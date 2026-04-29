import 'package:flutter/material.dart';

class FormSearch extends StatefulWidget {
  final String name;
  final String source;
  final String? displayFields;
  final String? valueField;
  final String? fields;
  final String? placeholder;
  final String? value;
  final bool required;
  final bool readonly;
  final bool snapMode;
  final ValueChanged<Map<String, dynamic>?>? onSelected;

  const FormSearch({
    super.key,
    required this.name,
    required this.source,
    this.displayFields,
    this.valueField,
    this.fields,
    this.placeholder,
    this.value,
    this.required = false,
    this.readonly = false,
    this.snapMode = false,
    this.onSelected,
  });

  factory FormSearch.fromJson(Map<String, dynamic> json, {
    ValueChanged<Map<String, dynamic>?>? onSelected,
  }) {
    return FormSearch(
      name: json['name'] as String? ?? '',
      source: json['source'] as String? ?? '',
      displayFields: json['display'] as String?,
      valueField: json['valueField'] as String?,
      fields: json['fields'] as String?,
      placeholder: json['placeholder'] as String?,
      value: json['value'] as String?,
      required: json['required'] == true,
      readonly: json['readonly'] == true,
      onSelected: onSelected,
    );
  }

  @override
  State<FormSearch> createState() => _FormSearchState();
}

class _FormSearchState extends State<FormSearch> {
  final TextEditingController _ctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _ctrl.text = widget.value ?? '';
  }

  @override
  void didUpdateWidget(covariant FormSearch oldWidget) {
    super.didUpdateWidget(oldWidget);
    // In readonly mode the field mirrors a parent-owned value (e.g. duplicate
    // occurrences of the same field on page 2 of a multi-page form). The
    // parent rebuilds with a new `value` whenever the editable copy on page 1
    // changes — sync the controller so the displayed text follows.
    if (widget.readonly && widget.value != oldWidget.value) {
      _ctrl.text = widget.value ?? '';
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        // See form_date.build for rationale on adaptive icon + 0v contentPadding.
        final hasIconRoom =
            !constraints.maxHeight.isFinite || constraints.maxHeight >= 32;
        // Readonly hides the search icon entirely (no search action makes
        // sense) and disables onChanged.
        final showIcon = !widget.readonly && hasIconRoom;
        return SizedBox(
          width: double.infinity,
          child: TextField(
            controller: _ctrl,
            readOnly: widget.readonly,
            decoration: InputDecoration(
              border: widget.snapMode
                  ? InputBorder.none
                  : const OutlineInputBorder(),
              isDense: true,
              contentPadding: widget.snapMode
                  ? const EdgeInsets.symmetric(horizontal: 4, vertical: 0)
                  : const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              hintText: widget.placeholder ?? 'Search ${widget.source}...',
              suffixIcon:
                  showIcon ? const Icon(Icons.search, size: 18) : null,
              filled: widget.required,
              fillColor: widget.required ? Colors.yellow.shade50 : null,
            ),
            onChanged: widget.readonly
                ? null
                : (query) {
                    // TODO: implement fuzzy search against source data
                    // and call widget.onSelected with matched record
                  },
          ),
        );
      },
    );
  }
}
