List rooms = [
  [1, 12, 18, 100],
  [2, 15, 16, 200],
  [5, 10, 12, 100],
  [17, 8, 10, 80],
  [19, 12, 18, 999],
];

String getMonth(int index) {
  List<String> months = [
    '',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    "Jun",
    'Jul',
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  return months[index];
}

String getWeekday(int index) {
  List<String> weekdays = [
    '',
    'Mon',
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];
  return weekdays[index];
}
