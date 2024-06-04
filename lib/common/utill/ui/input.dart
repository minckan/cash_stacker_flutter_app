import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:flutter/material.dart';

const InputDecoration inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(
      width: 1,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.4,
      color: AppColors.primary,
    ),
  ),
);
