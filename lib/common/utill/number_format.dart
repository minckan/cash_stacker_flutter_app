import 'package:intl/intl.dart';

final addComma = NumberFormat.currency(locale: 'ko_KR', symbol: '');

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
