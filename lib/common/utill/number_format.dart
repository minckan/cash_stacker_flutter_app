import 'package:intl/intl.dart';

final addComma = NumberFormat.currency(locale: 'ko_KR', symbol: '');

removeComma(String? numberString) {
  if (numberString == null) return;
  String cleanedString = numberString.replaceAll(',', '');
  return cleanedString;
}

removePercent(String? numberString) {
  if (numberString == null) return;
  String cleanedString = numberString.replaceAll('%', '');
  return cleanedString;
}
