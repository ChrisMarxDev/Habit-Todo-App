import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mindful/models/weekdays.dart';
import 'package:quiver/time.dart';

extension DateTimeUtil on DateTime {
  String format(String format) {
    final formatter = DateFormat(format);
    return formatter.format(this);
  }

  // fetch locale with context
  String ymd(BuildContext context) {
    return DateFormat.yMd().format(this);
  }

  // fetch locale with context
  String md(BuildContext context) {
    return format('dd.MM');
  }

  String toDocId() {
    return format('dd-MM-yyyy');
  }

  Weekday toWeekday() {
    return Weekday.values[weekday - 1];
  }

  String toTitle(BuildContext context) {
    return '${tr(toWeekday().toStringKeyLong())} ${ymd(context)}';
  }

  int getWeekOffset() {
    final firstDay = DateTime(year, month);
    return firstDay.weekday - 1;
  }

  int getDaysInMonth() {
    return daysInMonth(year, month);
  }

  // checks for same ymd date
  bool sameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
