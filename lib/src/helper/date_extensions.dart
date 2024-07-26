
import 'package:intl/intl.dart';

extension FormatDate on DateTime {
  String get formatDate {
    final formatter = DateFormat('MMM  dd, yyyy');

    return formatter.format(this);
  }
}