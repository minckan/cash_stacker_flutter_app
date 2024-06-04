import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DecimalInputFormatter extends TextInputFormatter {
  final NumberFormat numberFormat = NumberFormat("#,##0.##");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // 숫자만 포함된 텍스트로 변환
    final String newText = _filterNumeric(newValue.text.replaceAll(',', ''));
    if (newText.isEmpty) {
      return newValue.copyWith(
          text: '', selection: const TextSelection.collapsed(offset: 0));
    }

    final int selectionIndexFromTheRight =
        newValue.text.length - newValue.selection.end;
    final double? value = double.tryParse(newText);
    if (value != null) {
      final formattedValue = numberFormat.format(value);
      final newSelectionIndex =
          formattedValue.length - selectionIndexFromTheRight;

      return TextEditingValue(
        text: formattedValue,
        selection: TextSelection.collapsed(
            offset: newSelectionIndex.clamp(0, formattedValue.length)),
      );
    }

    return newValue;
  }

  // 숫자만 포함된 문자열로 필터링하는 헬퍼 함수
  String _filterNumeric(String str) {
    final numericString = str.replaceAll(RegExp(r'[^0-9.]'), '');
    return numericString;
  }
}
