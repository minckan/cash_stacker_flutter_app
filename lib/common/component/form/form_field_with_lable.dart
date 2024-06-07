import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:flutter/material.dart';

class FormFieldWithLabel extends StatelessWidget {
  final String label;
  final Widget formField;
  final String? helperText;

  const FormFieldWithLabel({
    super.key,
    required this.label,
    required this.formField,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          formField,
          if (helperText != null)
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                helperText!,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.bodyTextDark,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
