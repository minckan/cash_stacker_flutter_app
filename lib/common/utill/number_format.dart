import 'package:intl/intl.dart';

String? addComma(dynamic number) {
  if (number == null) return null;
  return NumberFormat.currency(locale: 'ko_KR', symbol: '').format(number);
}

double? removeComma(String? numberString) {
  if (numberString == null) return null;
  String cleanedString = numberString.replaceAll(',', '');
  return double.tryParse(cleanedString);
}

removePercent(String? numberString) {
  if (numberString == null) return;
  String cleanedString = numberString.replaceAll('%', '');
  return cleanedString;
}
