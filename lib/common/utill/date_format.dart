import 'package:intl/intl.dart';

String getMonth(DateTime date) {
  return DateFormat('yyyy-MM').format(date);
}
