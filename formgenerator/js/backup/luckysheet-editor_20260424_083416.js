window.LuckysheetEditors = window.LuckysheetEditors || {};
window.LuckysheetAreas = window.LuckysheetAreas || {};

function initLuckysheetEditor(wrapperId, config) {
    if (window.LuckysheetEditors[wrapperId]) {
        return;
    }
    window.LuckysheetEditors[wrapperId] = true;

    const formFieldRendererScript = document.createElement('script');
    formFieldRendererScript.src = 'js/form-field-renderer.js';
    if (!document.querySelector('script[src="js/form-field-renderer.js"]')) {
        document.head.appendChild(formFieldRendererScript);
    }

    const containerId = config.containerId;
    const statusId = config.statusId;
    const fullscreenBtnId = config.fullscreenBtnId;
    const previewBtnId = config.previewBtnId;
    const reloadBtnId = config.reloadBtnId;
    const previewId = config.previewId;
    const previewSheetsId = config.previewSheetsId;
    const fileUrl = config.fileUrl;

    const originalScrollTo = window.scrollTo;
    let scrollBlocked = false;
    window.scrollTo = function (x, y) { if (!scrollBlocked) originalScrollTo.call(window, x, y); };


    function saveContentToField(contentData, statusId) {
        console.log('=== SAVE CONTENT DEBUG ===');
        console.log('Data to save:', contentData);
        
        let contentInput = document.querySelector('[data-content-field="true"]');
        console.log('Method 1 [data-content-field]:', contentInput);
        
        if (!contentInput) {
            contentInput = document.querySelector('textarea[name="content"]');
            console.log('Method 2 [name=content]:', contentInput);
        }
        
        if (!contentInput) {
            contentInput = document.querySelector('textarea[wire\\:model="data.content"]');
            console.log('Method 3 [wire:model]:', contentInput);
        }
        
        if (!contentInput) {
            const allTextareas = document.querySelectorAll('textarea');
            console.log('Total textareas found:', allTextareas.length);
            allTextareas.forEach((ta, i) => {
                console.log(`Textarea ${i}:`, {
                    name: ta.name,
                    id: ta.id,
                    'wire:model': ta.getAttribute('wire:model'),
                    'data-attr': ta.getAttribute('data-content-field')
                });
            });
            
            for (let ta of allTextareas) {
                const name = ta.name || '';
                const wireModel = ta.getAttribute('wire:model') || '';
                if (name.includes('content') || wireModel.includes('content')) {
                    contentInput = ta;
                    console.log('Found by partial match!');
                    break;
                }
            }
        }
        
        if (contentInput) {
            const jsonString = JSON.stringify(contentData);            contentInput.value = jsonString;
            
            contentInput.dispatchEvent(new Event('input', { bubbles: true }));
            contentInput.dispatchEvent(new Event('change', { bubbles: true }));
            
            console.log('✓ SAVED! Length:', jsonString.length);
            document.getElementById(statusId).textContent = "Content saved (" + contentData.sheets.length + " sheets, " + jsonString.length + " chars)";
            return true;
        } else {
            console.error('✗ TEXTAREA NOT FOUND!');
            alert('Error: Cannot find content field. Check console (F12)');
            document.getElementById(statusId).textContent = "Error: Content field not found";
            return false;
        }
    }

    function loadResources(callback) {
        if (window.luckysheet && window.LuckyExcel && window.luckysheetToHtml) {
            callback();
            return;
        }

        const styles = [
            'vendor/luckysheet/css/luckysheet.css',
            'vendor/luckysheet/plugins/css/pluginsCss.css',
            'vendor/luckysheet/plugins/plugins.css',
            'vendor/luckysheet/assets/iconfont/iconfont.css'
        ];

        styles.forEach(href => {
            if (!document.querySelector(`link[href="${href}"]`)) {
                const link = document.createElement('link');
                link.rel = 'stylesheet';
                link.href = href;
                document.head.appendChild(link);
            }
        });

        const scripts = [
            'vendor/luckysheet/plugins/js/plugin.js',
            'vendor/luckysheet/luckysheet.umd.js',
            'vendor/luckyexcel/luckyexcel.umd.js',
            'js/luckysheet-to-html.js?v=2'
        ];

        let loaded = 0;
        scripts.forEach((src, index) => {
            if (document.querySelector(`script[src="${src}"]`)) {
                loaded++;
                if (loaded === scripts.length) callback();
                return;
            }
            const script = document.createElement('script');
            script.src = src;
            script.onload = () => {
                loaded++;
                if (loaded === scripts.length) {
                    setTimeout(callback, 100);
                }
            };
            document.head.appendChild(script);
        });
    }

    loadResources(function () {
        document.getElementById(statusId).textContent = "Loading...";

        // Support both URL (string) and ArrayBuffer (from file input)
        const filePromise = (fileUrl instanceof ArrayBuffer)
            ? Promise.resolve(fileUrl)
            : fetch(fileUrl).then(r => r.ok ? r.arrayBuffer() : Promise.reject("File not found"));

        filePromise.then(ab => {
                document.getElementById(statusId).textContent = "Converting...";
                LuckyExcel.transformExcelToLucky(ab, function (exportJson) {
                    if (exportJson.sheets && exportJson.sheets.length > 0) {
                        luckysheet.create({
                            container: containerId,
                            data: exportJson.sheets,
                            showinfobar: false,
                            showsheetbar: true,
                            enableAddRow: true,
                            enableAddCol: true,
                            showToolbar: true,
                            showFormulaBar: true,
                            enableAddBackTop: false,
                            userInfo: false,
                            myFolderUrl: false,
                            devicePixelRatio: 1,
                        });

                        scrollBlocked = true;
                        const container = document.getElementById(containerId);
                        container.addEventListener("mousedown", function (e) { scrollBlocked = true; }, true);
                        document.addEventListener("mouseup", function () { setTimeout(function () { scrollBlocked = false; }, 200); });

                        document.getElementById(statusId).textContent = "Ready";
                    }
                });
            })
            .catch(err => document.getElementById(statusId).textContent = "Error: " + err);

        

        function columnToLetter(col) {
            let letter = '';
            let temp = col;
            while (temp >= 0) {
                letter = String.fromCharCode(65 + (temp % 26)) + letter;
                temp = Math.floor(temp / 26) - 1;
            }
            return letter;
        }

        function getCellReference(row, col) {
            return columnToLetter(col) + (row + 1);
        }

        function cropTableByArea(htmlString, area) {
            if (!area) return htmlString;

            const tempDiv = document.createElement('div');
            tempDiv.innerHTML = htmlString;
            const table = tempDiv.querySelector('table');

            if (!table) return htmlString;

            const colgroup = table.querySelector('colgroup');
            const rows = Array.from(table.querySelectorAll('tr'));
            const startRow = area.row[0];
            const endRow = area.row[1];
            const startCol = area.column[0];
            const endCol = area.column[1];

            if (colgroup) {
                const cols = Array.from(colgroup.querySelectorAll('col'));
                cols.forEach((col, index) => {
                    if (index < startCol || index > endCol) {
                        col.remove();
                    }
                });
            }

            rows.forEach((row, rowIndex) => {
                if (rowIndex < startRow || rowIndex > endRow) {
                    row.remove();
                } else {
                    const cells = Array.from(row.querySelectorAll('td, th'));
                    let cellIndex = 0;
                    cells.forEach((cell) => {
                        const colspan = parseInt(cell.getAttribute('colspan') || '1');

                        if (cellIndex < startCol || cellIndex > endCol) {
                            cell.remove();
                        }

                        cellIndex += colspan;
                    });
                }
            });

            return tempDiv.innerHTML;
        }

        function generatePreview() {
            if (typeof luckysheetToHtml !== "function") {
                document.getElementById(statusId).textContent = "Error: Converter not loaded";
                return;
            }
            document.getElementById(statusId).textContent = "Generating HTML...";
            try {
                const sheets = luckysheetToHtml();
                const container = document.getElementById(previewSheetsId);
                container.innerHTML = "";

                const allSheets = luckysheet.getAllSheets();
                console.log('Luckysheet JSON:', JSON.stringify(allSheets, null, 2));

                let allHtml = "";

                const style = document.createElement('style');
                style.textContent = `
                    .sheet-wrapper { margin-bottom: 30px; border: 1px solid #e5e7eb; border-radius: 8px; padding: 20px; background: white; position: relative; }
                    .sheet-wrapper:last-child { margin-bottom: 0; }
                    .area-badge { position: absolute; top: 10px; right: 10px; background: #10b981; color: white; padding: 4px 12px; border-radius: 12px; font-size: 12px; font-weight: 500; }
                    .preview-tabs { display: flex; border-bottom: 2px solid #e5e7eb; margin-bottom: 20px; align-items: center; flex-wrap: wrap; gap: 8px; }
                    .preview-tab-btn { padding: 12px 24px; border: none; background: none; cursor: pointer; font-weight: 500; color: #6b7280; border-bottom: 3px solid transparent; transition: all 0.2s; }
                    .preview-tab-btn.active { color: #3b82f6; border-bottom-color: #3b82f6; }
                    .preview-tab-btn:hover:not(.active) { color: #374151; background: #f9fafb; }
                    .zoom-controls { margin-left: auto; display: flex; gap: 8px; align-items: center; }
                    .zoom-btn { width: 32px; height: 32px; border: 1px solid #d1d5db; background: white; border-radius: 6px; cursor: pointer; font-size: 16px; font-weight: bold; color: #374151; transition: all 0.2s; display: flex; align-items: center; justify-content: center; }
                    .zoom-btn:hover { background: #f3f4f6; border-color: #9ca3af; }
                    .zoom-level { font-size: 14px; color: #6b7280; min-width: 50px; text-align: center; }
                    .tab-content { display: none; }
                    .tab-content.active { display: block; }
                    .preview-content {  max-height: 600px; overflow: auto;  border: 1px solid #e5e7eb;  border-radius: 6px;  padding: 16px;   background: #fafafa;  }
                    .preview-content td{ white-space: pre !important;  overflow: visible !important;  text-overflow: clip !important;  max-width: none !important;}
                    .preview-content table td { line-height: 1.3; }
                    .preview-zoom-wrapper {  transform-origin: top left;  transition: transform 0.2s;}
                `;
                container.appendChild(style);

                const allSheetsData = [];

                sheets.forEach(function (sheet, index) {
                    const sheetArea = window.LuckysheetAreas[sheet.name];
                    let processedHtml = sheet.html;

                    if (sheetArea) {
                        processedHtml = cropTableByArea(sheet.html, sheetArea);
                    }

                    allSheetsData.push({
                        name: sheet.name,
                        html: processedHtml,
                        
                        area: sheetArea || null
                    });

                    allHtml += processedHtml;

                    const sheetWrapper = document.createElement('div');
                    sheetWrapper.className = 'sheet-wrapper';

                    if (sheetArea) {
                        const badge = document.createElement('div');
                        badge.className = 'area-badge';
                        badge.textContent = 'Area Set';
                        badge.title = 'Row ' + (sheetArea.row[0] + 1) + '-' + (sheetArea.row[1] + 1) + ', Col ' + (sheetArea.column[0] + 1) + '-' + (sheetArea.column[1] + 1);
                        sheetWrapper.appendChild(badge);
                    }

                    const title = document.createElement('h3');
                    title.className = 'font-semibold text-lg mb-4 text-gray-800';
                    title.textContent = 'Page: ' + sheet.name;
                    sheetWrapper.appendChild(title);

                    const tabsDiv = document.createElement('div');
                    tabsDiv.className = 'preview-tabs';

                    const previewBtn = document.createElement('button');
                    previewBtn.type = 'button';
                    previewBtn.className = 'preview-tab-btn active';
                    previewBtn.textContent = 'Preview';

                    const sourceBtn = document.createElement('button');
                    sourceBtn.type = 'button';
                    sourceBtn.className = 'preview-tab-btn';
                    sourceBtn.textContent = 'Source Code';

                    const zoomControls = document.createElement('div');
                    zoomControls.className = 'zoom-controls';

                    const zoomOutBtn = document.createElement('button');
                    zoomOutBtn.type = 'button';
                    zoomOutBtn.className = 'zoom-btn';
                    zoomOutBtn.innerHTML = '−';
                    zoomOutBtn.title = 'Zoom Out';

                    const zoomLevel = document.createElement('span');
                    zoomLevel.className = 'zoom-level';
                    zoomLevel.textContent = '100%';

                    const zoomInBtn = document.createElement('button');
                    zoomInBtn.type = 'button';
                    zoomInBtn.className = 'zoom-btn';
                    zoomInBtn.innerHTML = '+';
                    zoomInBtn.title = 'Zoom In';

                    const zoomResetBtn = document.createElement('button');
                    zoomResetBtn.type = 'button';
                    zoomResetBtn.className = 'zoom-btn';
                    zoomResetBtn.innerHTML = '⟲';
                    zoomResetBtn.title = 'Reset Zoom';
                    zoomResetBtn.style.fontSize = '18px';

                    zoomControls.appendChild(zoomOutBtn);
                    zoomControls.appendChild(zoomLevel);
                    zoomControls.appendChild(zoomInBtn);
                    zoomControls.appendChild(zoomResetBtn);

                    const previewTabContent = document.createElement('div');
                    previewTabContent.className = 'tab-content active preview-content';

                    const previewZoomWrapper = document.createElement('div');
                    previewZoomWrapper.className = 'preview-zoom-wrapper';
                    previewZoomWrapper.innerHTML = renderFormFields(processedHtml);
                    previewTabContent.appendChild(previewZoomWrapper);

                    const sourceTabContent = document.createElement('div');
                    sourceTabContent.className = 'tab-content';

                    const textarea = document.createElement('textarea');
                    textarea.className = 'w-full p-4 border rounded-lg font-mono text-sm bg-gray-50';
                    textarea.style.minHeight = '400px';
                    textarea.style.fontFamily = 'monospace';
                    textarea.spellcheck = false;
                    textarea.value = processedHtml;

                    let currentZoom = 1.0;

                    // แก้ไข: สร้างฟังก์ชัน updateZoom ให้รับพารามิเตอร์ wrapper และ table โดยตรง
                    function updateZoom(newZoom, targetWrapper) {
                        currentZoom = Math.max(0.25, Math.min(2.0, newZoom));
                        const table = targetWrapper.querySelector('table');
                        
                        if (table) {
                            // 1. Reset เพื่อวัดขนาดจริงของ Sheet นั้นๆ
                            targetWrapper.style.transform = 'scale(1)';
                            targetWrapper.style.width = 'auto';
                            targetWrapper.style.height = 'auto';
                            
                            // Force reflow เฉพาะตัวที่กำลังจัดการ
                            void targetWrapper.offsetWidth;

                            // 2. คำนวณขนาดจาก colgroup ของตารางนี้เท่านั้น
                            const colgroup = table.querySelector('colgroup');
                            let actualWidth = 0;
                            if (colgroup) {
                                const cols = colgroup.querySelectorAll('col');
                                cols.forEach(function (col) {
                                    const colWidth = col.style.width;
                                    actualWidth += parseFloat(colWidth) || 0;
                                });
                            }

                            if (actualWidth === 0) {
                                actualWidth = table.offsetWidth;
                            }
                            const actualHeight = table.offsetHeight;

                            table.style.width = actualWidth + 'px';
                            table.style.minWidth = actualWidth + 'px';
                            table.style.margin = '0';

                            // 3. ปรับขนาดกรอบตามเงื่อนไขที่ต้องการ
                            targetWrapper.style.transformOrigin = 'top left';
                            targetWrapper.style.transform = 'scale(' + currentZoom + ')';

                            if (currentZoom < 1) {
                                // ซูมออก: หดกรอบตามสัดส่วน
                                targetWrapper.style.width = (actualWidth * currentZoom) + 'px';
                                targetWrapper.style.height = (actualHeight * currentZoom) + 'px';
                            } else {
                                // ซูมเข้า: ล็อคกรอบไว้ที่ 100% ไม่ให้ล้น layout
                                targetWrapper.style.width = actualWidth + 'px';
                                targetWrapper.style.height = actualHeight + 'px';
                            }

                            // ล็อคความกว้างตารางข้างในไม่ให้เพี้ยน
                            table.style.width = actualWidth + 'px';
                            table.style.minWidth = actualWidth + 'px';
                            table.style.margin = '0';
                        }
                        
                        // อัปเดตตัวเลข % ในชุดควบคุมของ sheet นั้นๆ
                        const currentZoomLevelLabel = targetWrapper.closest('.sheet-wrapper').querySelector('.zoom-level');
                        if (currentZoomLevelLabel) {
                            currentZoomLevelLabel.textContent = Math.round(currentZoom * 100) + '%';
                        }
                    }

                    // แก้ไขส่วนการเรียกใช้ Event Listeners ของปุ่ม
                    zoomInBtn.onclick = function () { 
                        updateZoom(currentZoom + 0.1, previewZoomWrapper); 
                    };
                    zoomOutBtn.onclick = function () { 
                        updateZoom(currentZoom - 0.1, previewZoomWrapper); 
                    };
                    zoomResetBtn.onclick = function () { 
                        currentZoom = 1.0;
                        updateZoom(1.0, previewZoomWrapper); 
                    };

                    previewBtn.onclick = function () {
                        previewBtn.classList.add('active');
                        sourceBtn.classList.remove('active');
                        previewTabContent.classList.add('active');
                        sourceTabContent.classList.remove('active');
                        zoomControls.style.display = 'flex';
                    };

                    sourceBtn.onclick = function () {
                        previewBtn.classList.remove('active');
                        sourceBtn.classList.add('active');
                        previewTabContent.classList.remove('active');
                        sourceTabContent.classList.add('active');
                        zoomControls.style.display = 'none';
                    };

                    textarea.addEventListener('input', function () {
                        const newContent = renderFormFields(this.value);

                        previewZoomWrapper.innerHTML = newContent;
                        setTimeout(function () { updateZoom(currentZoom, previewZoomWrapper); }, 10);

                        sheets[index].html = this.value;

                        const updatedSheetsData = sheets.map(function (s) {
                            const area = window.LuckysheetAreas[s.name];
                            const processedHtml = area ? cropTableByArea(s.html, area) : s.html;
                            return {
                                name: s.name,
                                html: processedHtml,
                                
                                area: area || null
                            };
                        });

                        const contentData = {
                            sheets: updatedSheetsData,
                            generated_at: new Date().toISOString()
                        };

                        saveContentToField(contentData, statusId);
                    });

                    sourceTabContent.appendChild(textarea);

                    tabsDiv.appendChild(previewBtn);
                    tabsDiv.appendChild(sourceBtn);
                    tabsDiv.appendChild(zoomControls);
                    sheetWrapper.appendChild(tabsDiv);
                    sheetWrapper.appendChild(previewTabContent);
                    sheetWrapper.appendChild(sourceTabContent);

                    container.appendChild(sheetWrapper);

                    setTimeout(function () { updateZoom(1.0, previewZoomWrapper); }, 50);
                });

                const contentData = {
                    sheets: allSheetsData,
                    generated_at: new Date().toISOString()
                };

                saveContentToField(contentData, statusId);

                document.getElementById(previewId).style.display = "block";
                document.getElementById(previewBtnId).style.display = "none";
                document.getElementById(reloadBtnId).style.display = "inline-flex";
                document.getElementById(statusId).textContent = "Preview ready";

            } catch (e) {
                document.getElementById(statusId).textContent = "Error: " + e.message;
                console.error(e);
            }
        }

        document.getElementById(previewBtnId).addEventListener("click", function (e) {
            e.preventDefault();
            e.stopPropagation();
            generatePreview();
        });

        document.getElementById(reloadBtnId).addEventListener("click", function (e) {
            e.preventDefault();
            e.stopPropagation();
            generatePreview();
        });

        let isFullscreen = false;
        let originalStyle = "";
        let originalParent = null;
        let originalNextSibling = null;
        const fullscreenBtn = document.getElementById(fullscreenBtnId);
        let sidebarMenu = null;

        function createFormFieldButton(label, fieldType) {
            const btn = document.createElement("button");
            btn.className = "form-field-btn";
            btn.textContent = label;
            btn.onclick = function () {
                insertField(fieldType);
            };
            return btn;
        }

        function createAreaButton() {
            const btn = document.createElement("button");
            btn.className = "form-field-btn";
            btn.style.background = "#10b981";
            btn.textContent = "📐 Set Area";
            btn.onclick = function () {
                setArea();
            };
            return btn;
        }

        function updateSidebarAreaInfo() {
            if (!sidebarMenu) return;

            const existingInfo = sidebarMenu.querySelector('.area-info-section');
            if (existingInfo) {
                existingInfo.remove();
            }

            const allSheets = luckysheet.getAllSheets();

            const areaInfoSection = document.createElement("div");
            areaInfoSection.className = "menu-section area-info-section";
            areaInfoSection.style.maxHeight = "300px";
            areaInfoSection.style.overflowY = "auto";

            const areaInfoTitle = document.createElement("div");
            areaInfoTitle.className = "menu-title";
            areaInfoTitle.textContent = "Area Status";
            areaInfoSection.appendChild(areaInfoTitle);

            allSheets.forEach(function (sheet) {
                const sheetArea = window.LuckysheetAreas[sheet.name];

                const sheetInfo = document.createElement("div");
                sheetInfo.style.cssText = "padding:8px 12px;margin-bottom:8px;background:#374151;border-radius:6px;font-size:12px;line-height:1.4;";

                const sheetNameDiv = document.createElement("div");
                sheetNameDiv.style.cssText = "color:#f3f4f6;font-weight:600;margin-bottom:4px;";
                sheetNameDiv.textContent = sheet.name;
                sheetInfo.appendChild(sheetNameDiv);

                const areaStatusDiv = document.createElement("div");
                if (sheetArea) {
                    areaStatusDiv.style.color = "#10b981";
                    areaStatusDiv.innerHTML = "✓ R" + (sheetArea.row[0] + 1) + "-" + (sheetArea.row[1] + 1) +
                        " C" + (sheetArea.column[0] + 1) + "-" + (sheetArea.column[1] + 1);
                } else {
                    areaStatusDiv.style.color = "#9ca3af";
                    areaStatusDiv.textContent = "○ Full sheet";
                }
                sheetInfo.appendChild(areaStatusDiv);

                areaInfoSection.appendChild(sheetInfo);
            });

            sidebarMenu.appendChild(areaInfoSection);
        }

        function setArea() {
            const range = luckysheet.getRange();
            if (!range || range.length === 0) {
                alert('Please select a cell range first');
                return;
            }

            const selection = range[0];
            const currentSheet = luckysheet.getSheet();
            const sheetName = currentSheet.name;

            const area = {
                row: [selection.row[0], selection.row[1]],
                column: [selection.column[0], selection.column[1]]
            };

            window.LuckysheetAreas[sheetName] = area;

            const rowRange = 'Row ' + (area.row[0] + 1) + '-' + (area.row[1] + 1);
            const colRange = 'Col ' + (area.column[0] + 1) + '-' + (area.column[1] + 1);

            updateSidebarAreaInfo();

            alert('Area set for "' + sheetName + '":\n' + rowRange + '\n' + colRange + '\n\nClick "Reload HTML" to apply changes.');
        }

        function insertField(fieldType) {
            const range = luckysheet.getRange();
            if (!range || range.length === 0) {
                alert('Please select a cell first');
                return;
            }

            const selection = range[0];
            const row = selection.row[0];
            const col = selection.column[0];
            const rowEnd = selection.row[1];
            const colEnd = selection.column[1];

            showFieldDialog(fieldType, row, col, rowEnd, colEnd);
        }

        function showFieldDialog(fieldType, row, col, rowEnd, colEnd) {
            const fieldName = fieldType.match(/\[(.*?)\s/)[1];
            const cellRef = getCellReference(row, col);
            const defaultName = fieldName + '-field-' + cellRef;

            const dialog = document.createElement('div');
            dialog.style.cssText = 'position:fixed;top:50%;left:50%;transform:translate(-50%,-50%);background:white;padding:24px;border-radius:10px;box-shadow:0 8px 30px rgba(0,0,0,0.3);z-index:999;min-width:340px;max-width:520px;max-height:90vh;overflow-y:auto;';

            const labelStyle = 'display:block;margin-bottom:5px;font-size:13px;font-weight:600;color:#374151;';
            const inputStyle = 'width:100%;padding:8px;border:1px solid #d1d5db;border-radius:6px;font-size:13px;';
            const checkStyle = 'display:flex;align-items:center;font-size:13px;cursor:pointer;gap:6px;';
            const sectionStyle = 'margin-bottom:12px;';

            let html = '<h3 style="margin:0 0 16px 0;font-size:16px;font-weight:bold;color:#1f2937;">Configure: ' + fieldName + '</h3>';

            // Name (all)
            html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Field Name</label><input type="text" id="fd_name" value="' + defaultName + '" style="' + inputStyle + '"></div>';

            // --- Per-type fields ---
            if (fieldName === 'input') {
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Type</label><select id="fd_type" style="' + inputStyle + '"><option value="text">text</option><option value="email">email</option><option value="tel">tel</option><option value="number">number</option></select></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Placeholder</label><input type="text" id="fd_placeholder" style="' + inputStyle + '"></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Value</label><input type="text" id="fd_value" placeholder="ค่าเริ่มต้น หรือ {{$var}}" style="' + inputStyle + '"></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Pattern (regex)</label><input type="text" id="fd_pattern" placeholder="เช่น [A-Z]{2}-\\d{4}" style="' + inputStyle + '"></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + checkStyle + '"><input type="checkbox" id="fd_readonly"> readonly</label></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + checkStyle + '"><input type="checkbox" id="fd_disabled"> disabled</label></div>';
            }

            if (fieldName === 'textarea') {
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Rows</label><input type="number" id="fd_rows" value="3" min="1" max="20" style="' + inputStyle + '"></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Placeholder</label><input type="text" id="fd_placeholder" style="' + inputStyle + '"></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Value</label><input type="text" id="fd_value" style="' + inputStyle + '"></div>';
                html += '<div style="display:flex;gap:8px;' + sectionStyle + '"><div style="flex:1"><label style="' + labelStyle + '">Max width (px)</label><input type="number" id="fd_max_width" placeholder="เท่า cell" min="1" style="' + inputStyle + '"></div><div style="flex:1"><label style="' + labelStyle + '">Max height (px)</label><input type="number" id="fd_max_height" placeholder="เท่า cell" min="1" style="' + inputStyle + '"></div></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + checkStyle + '"><input type="checkbox" id="fd_readonly"> readonly</label></div>';
            }

            if (fieldName === 'select') {
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Options (one per line)</label><textarea id="fd_options" rows="6" placeholder="Option 1\nOption 2\nOption 3" style="' + inputStyle + 'font-family:monospace;">Option 1\nOption 2\nOption 3</textarea></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + checkStyle + '"><input type="checkbox" id="fd_first_as_label"> first_as_label (ตัวแรกเป็น label)</label></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Default value</label><input type="text" id="fd_value" style="' + inputStyle + '"></div>';
            }

            if (fieldName === 'checkbox') {
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Options (one per line, ว่าง = single checkbox)</label><textarea id="fd_options" rows="5" placeholder="ตัวเลือก 1\nตัวเลือก 2\nตัวเลือก 3" style="' + inputStyle + 'font-family:monospace;"></textarea></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + checkStyle + '"><input type="checkbox" id="fd_other"> เพิ่ม "อื่นๆ" (other)</label></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + checkStyle + '"><input type="checkbox" id="fd_has_label"> Single checkbox + label</label></div>';
                html += '<div id="fd_label_wrap" style="display:none;' + sectionStyle + '"><label style="' + labelStyle + '">Label text</label><input type="text" id="fd_label_text" placeholder="ยอมรับเงื่อนไข" style="' + inputStyle + '"></div>';
            }

            if (fieldName === 'radio') {
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Options (one per line)</label><textarea id="fd_options" rows="5" placeholder="Active\nInactive\nPending" style="' + inputStyle + 'font-family:monospace;">Active\nInactive</textarea></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Default value</label><input type="text" id="fd_value" style="' + inputStyle + '"></div>';
            }

            if (fieldName === 'date') {
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Value</label><input type="text" id="fd_value" placeholder="yyyy-mm-dd หรือ {{$var}}" style="' + inputStyle + '"></div>';
                html += '<div style="display:flex;gap:8px;' + sectionStyle + '"><div style="flex:1"><label style="' + labelStyle + '">Min</label><input type="date" id="fd_min" style="' + inputStyle + '"></div><div style="flex:1"><label style="' + labelStyle + '">Max</label><input type="date" id="fd_max" style="' + inputStyle + '"></div></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + checkStyle + '"><input type="checkbox" id="fd_readonly"> readonly</label></div>';
            }

            if (fieldName === 'time') {
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Value</label><input type="text" id="fd_value" placeholder="HH:mm หรือ {{$var}}" style="' + inputStyle + '"></div>';
                html += '<div style="display:flex;gap:8px;' + sectionStyle + '"><div style="flex:1"><label style="' + labelStyle + '">Min</label><input type="time" id="fd_min" style="' + inputStyle + '"></div><div style="flex:1"><label style="' + labelStyle + '">Max</label><input type="time" id="fd_max" style="' + inputStyle + '"></div></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Step (seconds)</label><input type="number" id="fd_step" placeholder="60 = นาที, 1 = วินาที" min="1" style="' + inputStyle + '"></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + checkStyle + '"><input type="checkbox" id="fd_readonly"> readonly</label></div>';
            }

            if (fieldName === 'signature') {
                html += '<div style="display:flex;gap:8px;' + sectionStyle + '"><div style="flex:1"><label style="' + labelStyle + '">Width (px)</label><input type="number" id="fd_width" placeholder="auto" style="' + inputStyle + '"></div><div style="flex:1"><label style="' + labelStyle + '">Height (px)</label><input type="number" id="fd_height" placeholder="auto" style="' + inputStyle + '"></div></div>';
            }

            if (fieldName === 'image-upload') {
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Source</label><select id="fd_source" style="' + inputStyle + '"><option value="both">both (upload + camera)</option><option value="upload">upload only</option><option value="camera">camera only</option></select></div>';
                html += '<div style="display:flex;gap:8px;' + sectionStyle + '"><div style="flex:1"><label style="' + labelStyle + '">Width (px)</label><input type="number" id="fd_width" placeholder="auto" style="' + inputStyle + '"></div><div style="flex:1"><label style="' + labelStyle + '">Height (px)</label><input type="number" id="fd_height" placeholder="auto" style="' + inputStyle + '"></div></div>';
            }

            if (fieldName === 'file') {
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Accept (file types)</label><input type="text" id="fd_accept" placeholder=".pdf,.xlsx,.doc" style="' + inputStyle + '"></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Max size (MB)</label><input type="number" id="fd_max_size" placeholder="ไม่จำกัด" style="' + inputStyle + '"></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + checkStyle + '"><input type="checkbox" id="fd_multiple"> multiple (แนบหลายไฟล์)</label></div>';
            }

            if (fieldName === 'search') {
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Source (data source name)</label><input type="text" id="fd_source" placeholder="customers" style="' + inputStyle + '"></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Display fields (comma separated)</label><input type="text" id="fd_display" placeholder="code,name" style="' + inputStyle + '"></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Auto-fill fields (comma separated)</label><input type="text" id="fd_fields" placeholder="name,address,phone" style="' + inputStyle + '"></div>';
                html += '<div style="' + sectionStyle + '"><label style="' + labelStyle + '">Placeholder</label><input type="text" id="fd_placeholder" style="' + inputStyle + '"></div>';
            }

            // Required (most types)
            const noRequired = ['checkbox', 'signature'];
            if (noRequired.indexOf(fieldName) === -1) {
                html += '<div style="margin:16px 0 12px;border-top:1px solid #e5e7eb;padding-top:12px;"><label style="' + checkStyle + '"><input type="checkbox" id="fd_required"> Required (บังคับกรอก)</label></div>';
            }

            // Buttons
            html += '<div style="display:flex;gap:10px;justify-content:flex-end;margin-top:16px;"><button id="fd_cancel" style="padding:8px 18px;background:#6B7280;color:white;border:none;border-radius:6px;cursor:pointer;">Cancel</button><button id="fd_ok" style="padding:8px 18px;background:#2563EB;color:white;border:none;border-radius:6px;cursor:pointer;font-weight:600;">OK</button></div>';

            dialog.innerHTML = html;
            document.body.appendChild(dialog);

            // Overlay
            const overlay = document.createElement('div');
            overlay.style.cssText = 'position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,0.3);z-index:998;';
            document.body.appendChild(overlay);

            // Wire up label toggle for checkbox
            const hasLabelEl = dialog.querySelector('#fd_has_label');
            if (hasLabelEl) {
                hasLabelEl.addEventListener('change', function() {
                    dialog.querySelector('#fd_label_wrap').style.display = this.checked ? 'block' : 'none';
                });
            }

            const nameInput = dialog.querySelector('#fd_name');
            nameInput.focus();
            nameInput.select();

            function closeDialog() { document.body.removeChild(dialog); document.body.removeChild(overlay); }
            overlay.onclick = closeDialog;
            dialog.querySelector('#fd_cancel').onclick = closeDialog;

            dialog.querySelector('#fd_ok').onclick = function() {
                const name = nameInput.value.trim() || defaultName;
                const shortcode = buildShortcodeFromDialog(fieldName, name, dialog);

                luckysheet.setCellValue(row, col, shortcode);
                const range = [row, col, rowEnd, colEnd];
                setTimeout(function() {
                    luckysheet.setRangeFormat("ht", 1, range);
                    luckysheet.setRangeFormat("vt", 0, range);
                    luckysheet.setRangeFormat("tb", 2, range);
                    luckysheet.setRangeFormat("fs", 12, range);
                }, 50);
                closeDialog();
            };

            nameInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter' && !dialog.querySelector('#fd_options')) {
                    dialog.querySelector('#fd_ok').click();
                }
            });
        }

        function getVal(dialog, id) {
            const el = dialog.querySelector('#' + id);
            if (!el) return '';
            if (el.type === 'checkbox') return el.checked;
            return (el.value || '').trim();
        }

        function getOptions(dialog) {
            const el = dialog.querySelector('#fd_options');
            if (!el) return [];
            return el.value.split('\n').map(s => s.trim()).filter(s => s.length > 0);
        }

        function buildShortcodeFromDialog(field, name, dialog) {
            const req = getVal(dialog, 'fd_required') ? '*' : '';
            let parts = ['[' + field + req, name];

            if (field === 'input') {
                const t = getVal(dialog, 'fd_type');
                if (t && t !== 'text') parts.push('type="' + t + '"');
                const ph = getVal(dialog, 'fd_placeholder');
                if (ph) parts.push('placeholder="' + ph + '"');
                const v = getVal(dialog, 'fd_value');
                if (v) parts.push('value="' + v + '"');
                const pat = getVal(dialog, 'fd_pattern');
                if (pat) parts.push('pattern="' + pat + '"');
                if (getVal(dialog, 'fd_readonly')) parts.push('readonly');
                if (getVal(dialog, 'fd_disabled')) parts.push('disabled');
            }

            if (field === 'textarea') {
                const rows = getVal(dialog, 'fd_rows');
                if (rows && rows !== '3') parts.push('rows="' + rows + '"');
                const ph = getVal(dialog, 'fd_placeholder');
                if (ph) parts.push('placeholder="' + ph + '"');
                const v = getVal(dialog, 'fd_value');
                if (v) parts.push('value="' + v + '"');
                const mw = getVal(dialog, 'fd_max_width');
                if (mw) parts.push('max-width="' + mw + '"');
                const mh = getVal(dialog, 'fd_max_height');
                if (mh) parts.push('max-height="' + mh + '"');
                if (getVal(dialog, 'fd_readonly')) parts.push('readonly');
            }

            if (field === 'select') {
                const v = getVal(dialog, 'fd_value');
                if (v) parts.push('value="' + v + '"');
                if (getVal(dialog, 'fd_first_as_label')) parts.push('first_as_label');
                getOptions(dialog).forEach(opt => parts.push('"' + opt + '"'));
            }

            if (field === 'checkbox') {
                const opts = getOptions(dialog);
                if (opts.length > 0) {
                    if (getVal(dialog, 'fd_other')) parts.push('other');
                    opts.forEach(opt => parts.push('"' + opt + '"'));
                } else if (getVal(dialog, 'fd_has_label')) {
                    const label = getVal(dialog, 'fd_label_text');
                    if (label) parts.push('label="' + label + '"');
                }
            }

            if (field === 'radio') {
                const v = getVal(dialog, 'fd_value');
                if (v) parts.push('value="' + v + '"');
                getOptions(dialog).forEach(opt => parts.push('"' + opt + '"'));
            }

            if (field === 'date') {
                const v = getVal(dialog, 'fd_value');
                if (v) parts.push('value="' + v + '"');
                const min = getVal(dialog, 'fd_min');
                if (min) parts.push('min="' + min + '"');
                const max = getVal(dialog, 'fd_max');
                if (max) parts.push('max="' + max + '"');
                if (getVal(dialog, 'fd_readonly')) parts.push('readonly');
            }

            if (field === 'time') {
                const v = getVal(dialog, 'fd_value');
                if (v) parts.push('value="' + v + '"');
                const min = getVal(dialog, 'fd_min');
                if (min) parts.push('min="' + min + '"');
                const max = getVal(dialog, 'fd_max');
                if (max) parts.push('max="' + max + '"');
                const step = getVal(dialog, 'fd_step');
                if (step) parts.push('step="' + step + '"');
                if (getVal(dialog, 'fd_readonly')) parts.push('readonly');
            }

            if (field === 'signature') {
                const w = getVal(dialog, 'fd_width');
                if (w) parts.push('width="' + w + '"');
                const h = getVal(dialog, 'fd_height');
                if (h) parts.push('height="' + h + '"');
            }

            if (field === 'image-upload') {
                const src = getVal(dialog, 'fd_source');
                if (src && src !== 'both') parts.push('source="' + src + '"');
                const w = getVal(dialog, 'fd_width');
                if (w) parts.push('width="' + w + '"');
                const h = getVal(dialog, 'fd_height');
                if (h) parts.push('height="' + h + '"');
            }

            if (field === 'file') {
                const acc = getVal(dialog, 'fd_accept');
                if (acc) parts.push('accept="' + acc + '"');
                const ms = getVal(dialog, 'fd_max_size');
                if (ms) parts.push('max-size="' + ms + '"');
                if (getVal(dialog, 'fd_multiple')) parts.push('multiple');
            }

            if (field === 'search') {
                const src = getVal(dialog, 'fd_source');
                if (src) parts.push('source="' + src + '"');
                const disp = getVal(dialog, 'fd_display');
                if (disp) parts.push('display="' + disp + '"');
                const fields = getVal(dialog, 'fd_fields');
                if (fields) parts.push('fields="' + fields + '"');
                const ph = getVal(dialog, 'fd_placeholder');
                if (ph) parts.push('placeholder="' + ph + '"');
            }

            return parts.join(' ') + ']';
        }

        function toggleFullscreen() {
            const container = document.getElementById(containerId);
            if (!isFullscreen) {
                originalParent = container.parentNode;
                originalNextSibling = container.nextSibling;
                originalStyle = container.getAttribute("style");
                sidebarMenu = document.createElement("div");
                sidebarMenu.style.cssText = 'position:fixed;top:0;left:0;width:220px;height:100vh;background:#1f2937;z-index:998;padding:20px;box-sizing:border-box;overflow-y:auto;';

                const returnBtn = document.createElement("button");
                returnBtn.textContent = "← Return";
                returnBtn.className = "inline-flex items-center px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-500 w-full justify-center";
                returnBtn.style.marginBottom = "20px";
                returnBtn.onclick = toggleFullscreen;
                sidebarMenu.appendChild(returnBtn);

                const formFieldsSection = document.createElement("div");
                formFieldsSection.className = "menu-section";
                const formFieldsTitle = document.createElement("div");
                formFieldsTitle.className = "menu-title";
                formFieldsTitle.textContent = "Form Fields";
                formFieldsSection.appendChild(formFieldsTitle);

                formFieldsSection.appendChild(createFormFieldButton("📝 Input", "[input your-field]"));
                formFieldsSection.appendChild(createFormFieldButton("📄 Textarea", "[textarea your-message]"));
                formFieldsSection.appendChild(createFormFieldButton("📋 Dropdown", "[select your-dropdown]"));
                formFieldsSection.appendChild(createFormFieldButton("☑️ Checkbox", "[checkbox your-checkbox]"));
                formFieldsSection.appendChild(createFormFieldButton("🔘 Radio", "[radio your-choice]"));
                formFieldsSection.appendChild(createFormFieldButton("📅 Date", "[date your-date]"));
                formFieldsSection.appendChild(createFormFieldButton("⏰ Time", "[time your-time]"));
                formFieldsSection.appendChild(createFormFieldButton("✍️ Signature", "[signature your-signature]"));
                formFieldsSection.appendChild(createFormFieldButton("🖼️ Image Upload", "[image-upload your-image]"));
                formFieldsSection.appendChild(createFormFieldButton("📎 File Upload", "[file your-file]"));
                formFieldsSection.appendChild(createFormFieldButton("🔍 Search", "[search your-search]"));

                sidebarMenu.appendChild(formFieldsSection);

                const areaSection = document.createElement("div");
                areaSection.className = "menu-section";
                const areaTitle = document.createElement("div");
                areaTitle.className = "menu-title";
                areaTitle.textContent = "Preview Area";
                areaSection.appendChild(areaTitle);
                areaSection.appendChild(createAreaButton());
                sidebarMenu.appendChild(areaSection);

                document.body.appendChild(sidebarMenu);
                document.body.appendChild(container);

                container.style.cssText = 'position:fixed;top:0;left:220px;width:calc(100vw - 220px);height:100vh;margin:0;border:none;background:#fff;z-index:2;';

                updateSidebarAreaInfo();
                fullscreenBtn.textContent = "Exit Fullscreen";
                fullscreenBtn.style.backgroundColor = "#DC2626";
                fullscreenBtn.style.color = "#FFF";
                isFullscreen = true;
                setTimeout(function () {
                    luckysheet.resize();
                }, 100);
            } else {
                if (sidebarMenu) {
                    document.body.removeChild(sidebarMenu);
                    sidebarMenu = null;
                }

                document.body.removeChild(container);

                if (originalNextSibling) {
                    originalParent.insertBefore(container, originalNextSibling);
                } else {
                    originalParent.appendChild(container);
                }

                container.setAttribute("style", originalStyle);
                fullscreenBtn.textContent = "Fullscreen";
                fullscreenBtn.style.backgroundColor = "#4B5563";
                fullscreenBtn.style.color = "#FFF";
                isFullscreen = false;
                setTimeout(function () {
                    luckysheet.resize();
                }, 100);
            }
        }

        fullscreenBtn.addEventListener("click", function (e) {
            e.preventDefault();
            e.stopPropagation();
            toggleFullscreen();
        });
    });
}