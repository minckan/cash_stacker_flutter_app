import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Color borderColor;
  final TextEditingController controller;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.borderColor,
    TextEditingController? controller,
  }) : controller = controller ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: '금액 입력',
        // prefixIcon: Icon(prefixIcon),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: borderColor),
        //   borderRadius: BorderRadius.circular(8.0),
        // ),
        alignLabelWithHint: false,
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        // ),
      ),
    );
  }
}
