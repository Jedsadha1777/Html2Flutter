import 'package:flutter/material.dart';

class FormDate extends StatefulWidget {
  final String name;
  final String? value;
  final String? placeholder;
  final String? min;
  final String? max;
  final bool required;
  final bool readonly;
  final bool snapMode;
  final ValueChanged<String?>? onChanged;

  const FormDate({
    super.key,
    required this.name,
    this.value,
    this.placeholder,
    this.min,
    this.max,
    this.required = false,
    this.readonly = false,
    this.snapMode = false,
    this.onChanged,
  });

  factory FormDate.fromJson(Map<String, dynamic> json, {
    ValueChanged<String?>? onChanged,
  }) {
    return FormDate(
      name: json['name'] as String? ?? '',
      value: json['value'] as String?,
      placeholder: json['placeholder'] as String?,
      min: json['min'] as String?,
      max: json['max'] as String?,
      required: json['required'] == true,
      readonly: json['readonly'] == true,
      onChanged: onChanged,
    );
  }

  @override
  State<FormDate> createState() => _FormDateState();
}

class _FormDateState extends State<FormDate> {
  String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.value;
  }

  DateTime? _parseDate(String? s) {
    if (s == null || s.isEmpty) return null;
    return DateTime.tryParse(s);
  }

  Future<void> _pickDate() async {
    if (widget.readonly) return;

    final now = DateTime.now();
    final first = _parseDate(widget.min) ?? DateTime(2000);
    final last = _parseDate(widget.max) ?? DateTime(2100);
    final initial = _parseDate(_selected) ?? now;

    final picked = await showDatePicker(
      context: context,
      initialDate: initial.isBefore(first) ? first : (initial.isAfter(last) ? last : initial),
      firstDate: first,
      lastDate: last,
    );

    if (picked != null) {
      final formatted = '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      setState(() => _selected = formatted);
      widget.onChanged?.call(formatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        // Adaptive suffix icon: hide when the host cell is shorter than ~32 px
        // (table form fields are often packed into 24-30 px rows). Showing the
        // 18 px calendar icon + InputDecoration's built-in icon padding eats
        // most of a tight cell's visible width and overflows it vertically;
        // dropping the icon makes the field behave like form_input in that case.
        final hasIconRoom =
            !constraints.maxHeight.isFinite || constraints.maxHeight >= 32;
        // contentPadding vertical 0: cell row heights from the HTML/Excel
        // source already account for the text glyph + border; the previous
        // 10v / 4v values made the field overflow tight cells.
        return SizedBox(
          width: double.infinity,
          child: TextField(
            controller: TextEditingController(text: _selected ?? ''),
            readOnly: true,
            onTap: widget.readonly ? null : _pickDate,
            decoration: InputDecoration(
              border: widget.snapMode
                  ? InputBorder.none
                  : const OutlineInputBorder(),
              isDense: true,
              contentPadding: widget.snapMode
                  ? const EdgeInsets.symmetric(horizontal: 4, vertical: 0)
                  : const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              hintText: widget.placeholder ?? 'เลือกวันที่',
              suffixIcon: hasIconRoom
                  ? const Icon(Icons.calendar_today, size: 18)
                  : null,
              filled: widget.required,
              fillColor: widget.required ? Colors.yellow.shade50 : null,
            ),
          ),
        );
      },
    );
  }
}
