import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    super.key,
    required this.controller,
    this.suffixText,
  });

  final TextEditingController controller;
  final String? suffixText;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: '',
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(0xffDFDFDF),
          ),
        ),
        suffixText: suffixText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffA18AE4),
          ),
        ),
      ),
      textAlign: TextAlign.left,
    );
  }
}
