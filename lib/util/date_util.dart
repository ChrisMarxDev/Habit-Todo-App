DateTime tomorrow([int hour = 12, int minute = 0]) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day + 1, hour, minute);
}
