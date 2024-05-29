import 'package:intl/intl.dart';

String getMonth(DateTime date) {
  return DateFormat('yyyy-MM').format(date);
}

DateTime getDateFromMonthKey(String monthKey) {
  return DateFormat('yyyy-MM').parse(monthKey);
}
