String getTodayDay() {
  DateTime now = DateTime.now();
  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  String day = days[now.weekday - 1];
  return day;
}

String formatTodayDate() {
  DateTime now = DateTime.now();

  // List of month names in the required format
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  // Format: day-month-year
  return '${now.day}-${months[now.month - 1]}-${now.year}';
}
