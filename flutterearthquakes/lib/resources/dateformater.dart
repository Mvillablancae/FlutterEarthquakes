String dateFormat(DateTime date) {
  String year = date.year.toString();
  String month = date.month < 10 ? "0${date.month}" : date.month.toString();
  String day = date.day < 10 ? "0${date.day}" : date.day.toString();

  String hour = date.hour < 10 ? "0${date.hour}" : date.hour.toString();
  String minute = date.minute < 10 ? "0${date.minute}" : date.minute.toString();

  return '$year-$month-$day \t $hour:$minute';
}