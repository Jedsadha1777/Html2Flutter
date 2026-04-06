import 'package:flutter/material.dart';

class FormImageUpload extends StatelessWidget {
  final String name;
  final String source; // 'upload', 'camera', 'both'
  final double? width;
  final double? height;
  final String? value;
  final bool required;
  final VoidCallback? onTap;

  const FormImageUpload({
    super.key,
    required this.name,
    this.source = 'both',
    this.width,
    this.height,
    this.value,
    this.required = false,
    this.onTap,
  });

  factory FormImageUpload.fromJson(Map<String, dynamic> json, {
    VoidCallback? onTap,
  }) {
    return FormImageUpload(
      name: json['name'] as String? ?? '',
      source: json['source'] as String? ?? 'both',
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      value: json['value'] as String?,
      required: json['required'] == true,
      onTap: onTap,
    );
  }

  IconData get _icon {
    switch (source) {
      case 'camera':
        return Icons.camera_alt;
      case 'upload':
        return Icons.upload_file;
      default:
        return Icons.add_photo_alternate;
    }
  }

  String get _label {
    switch (source) {
      case 'camera':
        return 'Take Photo';
      case 'upload':
        return 'Upload Image';
      default:
        return 'Add Image';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 150,
        height: height ?? 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: required ? Colors.orange.shade300 : Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.shade50,
        ),
        child: value != null && value!.isNotEmpty
            ? const Center(child: Icon(Icons.image, size: 40, color: Colors.green))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_icon, size: 32, color: Colors.grey.shade400),
                  const SizedBox(height: 4),
                  Text(
                    _label,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  ),
                ],
              ),
      ),
    );
  }
}
