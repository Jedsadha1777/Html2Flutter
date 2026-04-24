(function() {
    'use strict';

    // =========================================================================
    // AST-based Tag Parser — scans character by character, no fragile regex
    // =========================================================================

    var TAG_TYPES = ['input','textarea','select','checkbox','radio','date','time',
                     'signature','image-upload','file','search'];
    var KNOWN_FLAGS = ['readonly','disabled','other','first_as_label','multiple'];

    // --- Tokeniser: walk through the raw content of a tag and emit tokens ---
    // Token types: 'string' (quoted), 'flag', 'kv' (key=value), 'word'
    function tokenise(raw) {
        var tokens = [];
        var i = 0, len = raw.length;

        while (i < len) {
            // skip whitespace
            if (raw[i] === ' ' || raw[i] === '\t' || raw[i] === '\n' || raw[i] === '\r') { i++; continue; }

            // quoted string  "..."
            if (raw[i] === '"') {
                var j = i + 1;
                while (j < len && raw[j] !== '"') j++;
                tokens.push({ type: 'string', value: raw.substring(i + 1, j) });
                i = j + 1;
                continue;
            }

            // word / flag / key="value" / key=value
            var start = i;
            while (i < len && raw[i] !== ' ' && raw[i] !== '\t' && raw[i] !== '\n' && raw[i] !== '\r' && raw[i] !== '"') i++;
            var word = raw.substring(start, i);

            // Check if this is key= followed by a quoted value (e.g. type="email")
            if (word.length > 0 && word.charAt(word.length - 1) === '=' && i < len && raw[i] === '"') {
                var key = word.substring(0, word.length - 1);
                i++; // skip opening "
                var valStart = i;
                while (i < len && raw[i] !== '"') i++;
                var val = raw.substring(valStart, i);
                if (i < len) i++; // skip closing "
                tokens.push({ type: 'kv', key: key, value: val });
            } else if (word.indexOf('=') > 0) {
                // key=value without quotes (e.g. key=val)
                var eqIdx = word.indexOf('=');
                var key2 = word.substring(0, eqIdx);
                var val2 = word.substring(eqIdx + 1);
                // strip quotes if fully wrapped
                if (val2.charAt(0) === '"' && val2.charAt(val2.length - 1) === '"') {
                    val2 = val2.substring(1, val2.length - 1);
                }
                tokens.push({ type: 'kv', key: key2, value: val2 });
            } else if (KNOWN_FLAGS.indexOf(word) !== -1) {
                tokens.push({ type: 'flag', value: word });
            } else if (word.length > 0) {
                tokens.push({ type: 'word', value: word });
            }
        }
        return tokens;
    }

    // --- Parse a tag body into a structured AST node ---
    function parseTag(tagType, required, name, body) {
        var tokens = tokenise(body);
        var node = {
            tag: tagType,
            required: required,
            name: name,
            attrs: {},
            flags: {},
            options: []
        };

        for (var i = 0; i < tokens.length; i++) {
            var t = tokens[i];
            if (t.type === 'string') node.options.push(t.value);
            else if (t.type === 'flag')  node.flags[t.value] = true;
            else if (t.type === 'kv')    node.attrs[t.key] = t.value;
        }

        return node;
    }

    // =========================================================================
    // Scanner: walk through HTML and find our shortcode patterns
    // =========================================================================

    function scanAndReplace(html) {
        var out = '';
        var i = 0, len = html.length;

        while (i < len) {
            // --- {{$binding}} ---
            if (html[i] === '{' && html[i+1] === '{' && html[i+2] === '$') {
                var end = html.indexOf('}}', i + 3);
                if (end !== -1) {
                    var varPath = html.substring(i + 3, end);
                    out += renderBinding(varPath);
                    i = end + 2;
                    continue;
                }
            }

            // --- [hidden-print]...[/hidden-print]  or  [hidden-screen]...[/hidden-screen] ---
            if (html[i] === '[' && html.substring(i, i + 14) === '[hidden-print]') {
                var closeTag = '[/hidden-print]';
                var closeIdx = html.indexOf(closeTag, i + 14);
                if (closeIdx !== -1) {
                    out += '<span class="hidden-print" style="background:#fef3c7;border:1px dashed #f59e0b;padding:0 4px;" title="Hidden when printing">' + html.substring(i + 14, closeIdx) + '</span>';
                    i = closeIdx + closeTag.length;
                    continue;
                }
            }
            if (html[i] === '[' && html.substring(i, i + 15) === '[hidden-screen]') {
                var closeTag2 = '[/hidden-screen]';
                var closeIdx2 = html.indexOf(closeTag2, i + 15);
                if (closeIdx2 !== -1) {
                    out += '<span class="hidden-screen" style="background:#dbeafe;border:1px dashed #3b82f6;padding:0 4px;" title="Hidden on screen">' + html.substring(i + 15, closeIdx2) + '</span>';
                    i = closeIdx2 + closeTag2.length;
                    continue;
                }
            }

            // --- [tagType ...] form field tags ---
            if (html[i] === '[') {
                var parsed = tryParseFieldTag(html, i);
                if (parsed) {
                    out += renderNode(parsed.node);
                    i = parsed.end;
                    continue;
                }
            }

            out += html[i];
            i++;
        }

        return out;
    }

    // Try to parse a field tag starting at position pos.
    // Returns { node, end } on success, or null if not a known tag.
    function tryParseFieldTag(html, pos) {
        // Must start with [
        if (html[pos] !== '[') return null;

        // Read tag type
        var i = pos + 1;
        var len = html.length;

        // Read until space or ] or *
        var typeStart = i;
        while (i < len && html[i] !== ' ' && html[i] !== ']' && html[i] !== '*') i++;
        var tagType = html.substring(typeStart, i);

        // Check required *
        var required = false;
        if (html[i] === '*') { required = true; i++; }

        // Must be a known tag
        if (TAG_TYPES.indexOf(tagType) === -1) return null;

        // Skip space
        if (html[i] !== ' ') return null;
        i++;

        // Read field name (until space or ])
        var nameStart = i;
        while (i < len && html[i] !== ' ' && html[i] !== ']') i++;
        var name = html.substring(nameStart, i);
        if (!name) return null;

        // Read body until closing ] — but respect quoted strings
        var bodyStart = i;
        while (i < len) {
            if (html[i] === '"') {
                // skip quoted string entirely
                i++;
                while (i < len && html[i] !== '"') i++;
                if (i < len) i++; // skip closing "
                continue;
            }
            if (html[i] === ']') break;
            i++;
        }

        if (i >= len) return null; // no closing ]

        var body = html.substring(bodyStart, i);
        var node = parseTag(tagType, required, name, body);

        return { node: node, end: i + 1 }; // +1 to skip ]
    }

    // =========================================================================
    // Renderers
    // =========================================================================

    function esc(s) {
        return String(s || '').replace(/&/g,'&amp;').replace(/"/g,'&quot;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
    }

    function renderBinding(varPath) {
        return '<span class="display-binding" data-bind="' + esc(varPath) + '" style="color:#6366f1;font-style:italic;">{{$' + esc(varPath) + '}}</span>';
    }

    function renderNode(n) {
        var fieldId = 'field_' + n.name.replace(/[^a-zA-Z0-9]/g, '_');
        var req = n.required ? ' required' : '';
        var ro  = n.flags.readonly  ? ' readonly' : '';
        var dis = n.flags.disabled  ? ' disabled' : '';
        var ph  = n.attrs.placeholder ? ' placeholder="' + esc(n.attrs.placeholder) + '"' : '';
        var val = n.attrs.value ? ' value="' + esc(n.attrs.value) + '"' : '';
        var id  = ' id="' + fieldId + '" name="' + esc(n.name) + '"';

        switch (n.tag) {

        // --- INPUT ---
        case 'input': {
            var t = n.attrs.type || 'text';
            var pat = n.attrs.pattern ? ' pattern="' + esc(n.attrs.pattern) + '"' : '';
            return '<input type="' + esc(t) + '"' + id + ' class="w-full border rounded px-2 py-1"' + val + ph + pat + req + ro + dis + '>';
        }

        // --- TEXTAREA ---
        case 'textarea': {
            var rows = n.attrs.rows || '3';
            var tv = n.attrs.value || '';
            var taStyle = '';
            if (n.attrs['max-width'])  taStyle += 'max-width:'  + esc(n.attrs['max-width'])  + 'px;';
            if (n.attrs['max-height']) taStyle += 'max-height:' + esc(n.attrs['max-height']) + 'px;';
            var taMW = n.attrs['max-width']  ? ' data-max-width="'  + esc(n.attrs['max-width'])  + '"' : '';
            var taMH = n.attrs['max-height'] ? ' data-max-height="' + esc(n.attrs['max-height']) + '"' : '';
            var taStyleAttr = taStyle ? ' style="' + taStyle + '"' : '';
            return '<textarea' + id + taMW + taMH + ' class="w-full border rounded px-2 py-1" rows="' + esc(rows) + '"' + ph + req + ro + dis + taStyleAttr + '>' + esc(tv) + '</textarea>';
        }

        // --- SELECT ---
        case 'select': {
            var sv = n.attrs.value || '';
            var h = '<select' + id + ' class="w-full border rounded px-2 py-1"' + req + dis + '>';
            if (n.flags.first_as_label && n.options.length > 0) {
                h += '<option value="">' + esc(n.options[0]) + '</option>';
                for (var i = 1; i < n.options.length; i++) {
                    h += '<option value="' + esc(n.options[i]) + '"' + (n.options[i] === sv ? ' selected' : '') + '>' + esc(n.options[i]) + '</option>';
                }
            } else {
                h += '<option value="">-- Select --</option>';
                for (var i = 0; i < n.options.length; i++) {
                    h += '<option value="' + esc(n.options[i]) + '"' + (n.options[i] === sv ? ' selected' : '') + '>' + esc(n.options[i]) + '</option>';
                }
            }
            h += '</select>';
            return h;
        }

        // --- CHECKBOX ---
        case 'checkbox': {
            // Group
            if (n.options.length > 0) {
                var g = '<span class="checkbox-group" data-field-id="' + fieldId + '" style="display:inline-flex;flex-wrap:wrap;gap:8px;align-items:center;white-space:normal;">';
                n.options.forEach(function(opt, i) {
                    g += '<label style="display:inline-flex;align-items:center;gap:4px;cursor:pointer;">';
                    g += '<input type="checkbox" id="' + fieldId + '_' + i + '" data-group="' + fieldId + '" data-option="' + esc(opt) + '" class="rounded"> ' + esc(opt);
                    g += '</label>';
                });
                if (n.flags.other) {
                    g += '<label style="display:inline-flex;align-items:center;gap:4px;cursor:pointer;"><input type="checkbox" id="' + fieldId + '_other" data-group="' + fieldId + '" data-option="other" class="rounded"> อื่นๆ</label>';
                    g += '<input type="text" data-other-for="' + fieldId + '" placeholder="ระบุ..." style="border:1px solid #ccc;border-radius:4px;padding:2px 6px;width:120px;" disabled>';
                }
                g += '</span>';
                return g;
            }
            // Single + label
            if (n.attrs.label) {
                return '<label style="display:inline-flex;align-items:center;gap:6px;cursor:pointer;"><input type="checkbox"' + id + ' class="rounded"' + dis + '> ' + esc(n.attrs.label) + '</label>';
            }
            // Single
            return '<input type="checkbox"' + id + ' class="rounded"' + dis + '>';
        }

        // --- RADIO ---
        case 'radio': {
            var rv = n.attrs.value || '';
            var r = '<span class="radio-group" data-field-id="' + fieldId + '" style="display:inline-flex;flex-wrap:wrap;gap:8px;align-items:center;white-space:normal;">';
            n.options.forEach(function(opt, i) {
                r += '<label style="display:inline-flex;align-items:center;gap:4px;cursor:pointer;">';
                r += '<input type="radio" name="' + esc(n.name) + '" id="' + fieldId + '_' + i + '" data-group="' + fieldId + '" value="' + esc(opt) + '"' + (opt === rv ? ' checked' : '') + req + '> ' + esc(opt);
                r += '</label>';
            });
            r += '</span>';
            return r;
        }

        // --- DATE ---
        case 'date': {
            var mn = n.attrs.min ? ' min="' + esc(n.attrs.min) + '"' : '';
            var mx = n.attrs.max ? ' max="' + esc(n.attrs.max) + '"' : '';
            return '<input type="date"' + id + ' class="border rounded px-2 py-1"' + val + mn + mx + ph + req + ro + dis + '>';
        }

        // --- TIME ---
        case 'time': {
            var tmn = n.attrs.min ? ' min="' + esc(n.attrs.min) + '"' : '';
            var tmx = n.attrs.max ? ' max="' + esc(n.attrs.max) + '"' : '';
            var tstep = n.attrs.step ? ' step="' + esc(n.attrs.step) + '"' : '';
            return '<input type="time"' + id + ' class="border rounded px-2 py-1"' + val + tmn + tmx + tstep + ph + req + ro + dis + '>';
        }

        // --- SIGNATURE ---
        case 'signature': {
            var sw = n.attrs.width ? 'width:' + n.attrs.width + 'px;' : 'width:100%;';
            var sh = n.attrs.height ? 'height:' + n.attrs.height + 'px;' : 'height:80px;';
            return '<div class="signature-field" data-field-id="' + fieldId + '" style="border:2px dashed #d1d5db;border-radius:8px;' + sw + sh + 'display:flex;align-items:center;justify-content:center;color:#9ca3af;font-size:13px;cursor:pointer;" title="Click to sign">Signature: ' + esc(n.name) + '</div>';
        }

        // --- IMAGE-UPLOAD ---
        case 'image-upload': {
            var src = n.attrs.source || 'both';
            var iw = n.attrs.width ? 'width:' + n.attrs.width + 'px;' : 'width:200px;';
            var ih = n.attrs.height ? 'height:' + n.attrs.height + 'px;' : 'height:150px;';
            var btns = '';
            if (src === 'upload' || src === 'both') btns += '<button type="button" style="padding:4px 12px;border:1px solid #d1d5db;border-radius:4px;background:white;cursor:pointer;font-size:12px;">📁 Upload</button>';
            if (src === 'camera' || src === 'both') btns += '<button type="button" style="padding:4px 12px;border:1px solid #d1d5db;border-radius:4px;background:white;cursor:pointer;font-size:12px;">📷 Camera</button>';
            return '<div class="image-upload-field" data-field-id="' + fieldId + '" data-source="' + esc(src) + '" style="border:2px dashed #d1d5db;border-radius:8px;' + iw + ih + 'display:flex;flex-direction:column;align-items:center;justify-content:center;gap:8px;color:#9ca3af;font-size:13px;">' +
                '<span>Image: ' + esc(n.name) + '</span><div style="display:flex;gap:6px;">' + btns + '</div>' +
                '<input type="file" accept="image/*"' + id + ' style="display:none;"' + req + '></div>';
        }

        // --- FILE ---
        case 'file': {
            var acc = n.attrs.accept ? ' accept="' + esc(n.attrs.accept) + '"' : '';
            var mul = n.flags.multiple ? ' multiple' : '';
            var ms = n.attrs['max-size'] || '';
            var msLabel = ms ? ' (max ' + esc(ms) + 'MB)' : '';
            return '<div class="file-upload-field" data-field-id="' + fieldId + '"' + (ms ? ' data-max-size="' + esc(ms) + '"' : '') + ' style="border:2px dashed #d1d5db;border-radius:8px;padding:12px;display:flex;align-items:center;gap:8px;">' +
                '<input type="file"' + id + acc + mul + req + ' style="font-size:13px;">' +
                '<span style="color:#9ca3af;font-size:12px;">' + (n.attrs.accept || 'all files') + msLabel + '</span></div>';
        }

        // --- SEARCH ---
        case 'search': {
            var ss = n.attrs.source || '';
            var sd = n.attrs.display || '';
            var sf = n.attrs.fields || '';
            return '<div class="search-field" data-field-id="' + fieldId + '" data-source="' + esc(ss) + '" data-display="' + esc(sd) + '" data-fields="' + esc(sf) + '" style="display:inline-flex;align-items:center;gap:4px;width:100%;">' +
                '<input type="text"' + id + ' class="w-full border rounded px-2 py-1" autocomplete="off"' + ph + val + req + ' style="flex:1;" data-search-source="' + esc(ss) + '">' +
                '<span style="font-size:16px;cursor:pointer;" title="Search">🔍</span></div>';
        }

        default:
            return '[' + n.tag + ' ' + n.name + ']';
        }
    }

    // =========================================================================
    // Public API:  renderFormFields(html) -> html with tags replaced
    // =========================================================================

    function renderFormFields(html) {
        // Decode HTML entities that Luckysheet may have encoded
        var decoded = html.replace(/&quot;/g, '"');
        return scanAndReplace(decoded);
    }

    // =========================================================================
    // Data Collection / Form Setup  (unchanged logic, kept for compatibility)
    // =========================================================================

    function collectData(formElement) {
        var data = {};

        formElement.querySelectorAll('input, select, textarea').forEach(function(field) {
            if (field.dataset.group !== undefined || field.dataset.otherFor !== undefined) return;
            if (field.type === 'radio' || field.type === 'file') return;
            if (field.dataset.searchSource !== undefined) return;

            var td = field.closest('td');
            var cellRef = td ? td.getAttribute('data-cell') : field.getAttribute('data-cell');
            if (cellRef && (field.value || field.type === 'checkbox')) {
                var parts = cellRef.split(':');
                if (parts[0] && parts[1]) {
                    if (!data[parts[0]]) data[parts[0]] = {};
                    data[parts[0]][parts[1]] = field.type === 'checkbox' ? field.checked : field.value;
                }
            }
        });

        // Checkbox groups
        formElement.querySelectorAll('td[data-cell]').forEach(function(td) {
            var group = td.querySelector('.checkbox-group');
            if (!group) return;
            var ref = td.getAttribute('data-cell').split(':');
            if (!ref[0] || !ref[1]) return;
            var selected = [], otherText = '';
            group.querySelectorAll('input[type="checkbox"][data-option]').forEach(function(cb) {
                if (cb.checked) {
                    if (cb.dataset.option === 'other') {
                        var o = group.querySelector('[data-other-for]');
                        otherText = o ? o.value : '';
                    } else { selected.push(cb.dataset.option); }
                }
            });
            if (!data[ref[0]]) data[ref[0]] = {};
            data[ref[0]][ref[1]] = { selected: selected, other_text: otherText };
        });

        // Radio groups
        formElement.querySelectorAll('td[data-cell]').forEach(function(td) {
            var group = td.querySelector('.radio-group');
            if (!group) return;
            var ref = td.getAttribute('data-cell').split(':');
            if (!ref[0] || !ref[1]) return;
            var checked = group.querySelector('input[type="radio"]:checked');
            if (!data[ref[0]]) data[ref[0]] = {};
            data[ref[0]][ref[1]] = checked ? checked.value : '';
        });

        // Search fields
        formElement.querySelectorAll('td[data-cell]').forEach(function(td) {
            var sf = td.querySelector('.search-field');
            if (!sf) return;
            var ref = td.getAttribute('data-cell').split(':');
            if (!ref[0] || !ref[1]) return;
            var inp = sf.querySelector('input[type="text"]');
            if (!data[ref[0]]) data[ref[0]] = {};
            data[ref[0]][ref[1]] = inp ? inp.value : '';
        });

        return data;
    }

    function processTemplateContents() {
        document.querySelectorAll('.template-content[data-processed="false"]').forEach(function(el) {
            if (el.closest('[x-data]')) return;
            el.innerHTML = renderFormFields(el.innerHTML);
            el.setAttribute('data-processed', 'true');
        });
    }

    function setupFormListener(formElement) {
        if (!formElement || formElement.dataset.listenerAttached === 'true') return;
        if (formElement.closest('[x-data]')) return;

        formElement.addEventListener('change', function(e) {
            if (!e.target.matches('input, select, textarea')) return;
            if (e.target.dataset.option === 'other') {
                var g = e.target.closest('.checkbox-group');
                if (g) { var o = g.querySelector('[data-other-for]'); if (o) { o.disabled = !e.target.checked; if (!e.target.checked) o.value = ''; } }
            }
            var d = collectData(formElement);
            if (window.Livewire) {
                var w = formElement.closest('[wire\\:id]');
                w = w ? w.getAttribute('wire:id') : null;
                if (w) { var c = window.Livewire.find(w); if (c) c.set('data.form_data', JSON.stringify(d), false); }
            }
        }, true);
        formElement.dataset.listenerAttached = 'true';
    }

    function loadExistingData(formElement) {
        var attr = formElement.dataset.existingData;
        if (!attr) return;
        try {
            var dec = document.createElement('textarea'); dec.innerHTML = attr;
            var ed = JSON.parse(dec.value);
            if (!ed) return;
            Object.keys(ed).forEach(function(sheet) {
                Object.keys(ed[sheet]).forEach(function(cell) {
                    var value = ed[sheet][cell], cellRef = sheet + ':' + cell;
                    var td = formElement.querySelector('td[data-cell="' + cellRef + '"]');

                    var cbG = td && td.querySelector('.checkbox-group');
                    if (cbG && value && typeof value === 'object' && value.selected) {
                        cbG.querySelectorAll('input[type="checkbox"][data-option]').forEach(function(cb) { cb.checked = value.selected.indexOf(cb.dataset.option) !== -1; });
                        if (value.other_text) { var o = cbG.querySelector('[data-other-for]'); if (o) { o.disabled = false; o.value = value.other_text; } }
                        return;
                    }
                    var rG = td && td.querySelector('.radio-group');
                    if (rG && typeof value === 'string') { rG.querySelectorAll('input[type="radio"]').forEach(function(r) { r.checked = (r.value === value); }); return; }
                    var sF = td && td.querySelector('.search-field input[type="text"]');
                    if (sF) { sF.value = value || ''; return; }

                    var f = formElement.querySelector('[data-cell="' + cellRef + '"]');
                    if (!f) f = td && td.querySelector('input, select, textarea');
                    if (f) { if (f.type === 'checkbox') f.checked = value; else f.value = value; }
                });
            });
        } catch (e) { console.error('Failed to load existing data:', e); }
    }

    function initTemplateForms() {
        processTemplateContents();
        document.querySelectorAll('[id^="doc_form_"]').forEach(function(form) {
            if (form.closest('[x-data]')) return;
            setupFormListener(form);
            loadExistingData(form);
        });
    }

    var observer = new MutationObserver(function(mutations) {
        var shouldInit = false;
        mutations.forEach(function(mut) {
            mut.addedNodes.forEach(function(node) {
                if (node.nodeType === 1) {
                    if (node.closest && node.closest('[x-data]')) return;
                    if ((node.classList && node.classList.contains('template-content')) ||
                        (node.querySelector && node.querySelector('.template-content')) ||
                        (node.id && node.id.indexOf('doc_form_') === 0)) shouldInit = true;
                }
            });
        });
        if (shouldInit) setTimeout(initTemplateForms, 10);
    });
    observer.observe(document.body, { childList: true, subtree: true });

    if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initTemplateForms);
    else initTemplateForms();

    document.addEventListener('livewire:navigated', initTemplateForms);
    document.addEventListener('livewire:load', initTemplateForms);

    window.renderFormFields = renderFormFields;
    window.initTemplateForms = initTemplateForms;
})();
