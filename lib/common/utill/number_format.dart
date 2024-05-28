import 'package:intl/intl.dart';

final addComma = NumberFormat.currency(locale: 'ko_KR', symbol: '');

removeComma(String numberString) {
  String cleanedString = numberString.replaceAll(',', '');
  return cleanedString;
}
