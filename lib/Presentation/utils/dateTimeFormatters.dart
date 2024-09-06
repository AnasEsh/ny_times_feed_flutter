import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  static final DateFormat _formatter = DateFormat('yyyy-MM-dd');
  String ymd() => _formatter.format(this);
}
