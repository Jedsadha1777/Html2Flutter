import 'package:flutter/material.dart';

class FormSignature extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final String? value;

  const FormSignature({
    super.key,
    required this.name,
    this.width,
    this.height,
    this.value,
  });

  factory FormSignature.fromJson(Map<String, dynamic> json) {
    return FormSignature(
      name: json['name'] as String? ?? '',
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      value: json['value'] as String?,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 200,
      height: height ?? 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey.shade50,
      ),
      alignment: Alignment.center,
      child: value != null && value!.isNotEmpty
          ? const Text('(Signed)', style: TextStyle(color: Colors.green))
          : Text(
              'Signature',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            ),
    );
  }
}
