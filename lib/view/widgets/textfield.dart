import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final TextInputType? keyboardType;
  final String? suffixText;
  final int? maxLength;
  final int? maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.keyboardType,
    this.suffixText,
    this.maxLength,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        maxLines: maxLines,
        maxLength:maxLength,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          suffixText: suffixText,
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
