import 'package:flutter/material.dart';

class FormFile extends StatelessWidget {
  final String name;
  final String? accept;
  final bool multiple;
  final int? maxSizeMb;
  final dynamic value;
  final bool required;
  final VoidCallback? onTap;

  const FormFile({
    super.key,
    required this.name,
    this.accept,
    this.multiple = false,
    this.maxSizeMb,
    this.value,
    this.required = false,
    this.onTap,
  });

  factory FormFile.fromJson(Map<String, dynamic> json, {
    VoidCallback? onTap,
  }) {
    return FormFile(
      name: json['name'] as String? ?? '',
      accept: json['accept'] as String?,
      multiple: json['multiple'] == true,
      maxSizeMb: (json['maxSize'] as num?)?.toInt(),
      value: json['value'],
      required: json['required'] == true,
      onTap: onTap,
    );
  }

  bool get _hasFiles {
    if (value == null) return false;
    if (value is List) return (value as List).isNotEmpty;
    if (value is String) return (value as String).isNotEmpty;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: required ? Colors.orange.shade300 : Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.shade50,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _hasFiles ? Icons.attach_file : Icons.upload_file,
              size: 20,
              color: _hasFiles ? Colors.green : Colors.grey.shade400,
            ),
            const SizedBox(width: 8),
            Text(
              _hasFiles ? 'File attached' : 'Choose file${multiple ? 's' : ''}',
              style: TextStyle(
                color: _hasFiles ? Colors.green : Colors.grey.shade600,
                fontSize: 13,
              ),
            ),
            if (accept != null) ...[
              const SizedBox(width: 8),
              Text(
                '($accept)',
                style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
