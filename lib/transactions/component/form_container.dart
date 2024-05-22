import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatefulWidget {
  const FormContainer({
    super.key,
    required this.child,
    this.label,
  });

  final Widget child;
  final String? label;

  @override
  State<FormContainer> createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  bool _isFocused = false;
  void _handleFocusChange(bool hasFocus) {
    setState(() {
      _isFocused = hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          border: Border.all(
            color: _isFocused ? AppColors.primary : Colors.transparent,
            width: 2.0,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.label != null)
              Text(
                widget.label!,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: AppColors.bodyTextDark),
              ),
            if (widget.label != null) const SizedBox(width: 20),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Focus(
                  onFocusChange: _handleFocusChange,
                  child: widget.child,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
