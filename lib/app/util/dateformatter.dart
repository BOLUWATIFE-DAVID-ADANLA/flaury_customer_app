import 'package:intl/intl.dart';

class Dateformatter {
  static formatdate(DateTime time) {
    return DateFormat('h:mm a').format(time);
  }
}
