import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({
    super.key,
    required this.child,
    required this.label,
  });

  final Widget child;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: AppColors.bodyTextDark),
            ),
            const SizedBox(width: 20),
            child
          ],
        ),
      ),
    );
  }
}
