class DateTimeUtils {
  static const int fiveMinutesInMillis = 5 * 60 * 1000;

  static String getMinutesAndSecondsFromMillis(int millis) =>
      '${Duration(milliseconds: millis).inMinutes.remainder(60).toString()}:${Duration(milliseconds: millis).inSeconds.remainder(60).toString().padLeft(2, '0')}';

  static String getMMDDYYYYDate(DateTime date) {
    String month = date.month.toString().padLeft(2, '0');
    String day = date.day.toString().padLeft(2, '0');
    String year = date.year.toString();
    return '$month/$day/$year';
  }
}
