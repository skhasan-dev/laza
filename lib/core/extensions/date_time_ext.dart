import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isTomorrow() {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }

  String get toDDMMMYYYY {
    final dateString = DateFormat('dd MMM, yyyy').format(this);
    if (isToday()) {
      return "Today, $dateString";
    }
    if (isTomorrow()) {
      return "Tomorrow, $dateString";
    }
    return dateString;
  }

  String get toFormattedDDMMYYYY {
    final dateString = DateFormat('dd-MM-yyyy').format(this);
    return dateString;
  }
}
