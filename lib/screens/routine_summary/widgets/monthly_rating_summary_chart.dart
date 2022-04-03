import 'package:flutter/material.dart';
import 'package:mindful/screens/routine_summary/models/summary_day_item.dart';
import 'package:mindful/widgets/chart/rating_chart.dart';

import 'general_monthly_summary_entry.dart';

class MonthlyRatingSummaryChart extends StatelessWidget {
  final DateTime dateTime;
  final List<SummaryDayItem> days;
  final List<Color> colors;

  const MonthlyRatingSummaryChart({
    required this.days,
    required this.colors,
    required this.dateTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // only go over
    final applicableDays = days
        .where(
          (element) =>
              element.state == CompletionState.done ||
              element.state == CompletionState.notDone,
        )
        .toList()
        .length;
    final doneDays = days
        .where((element) => element.state == CompletionState.done)
        .toList()
        .length;
    return GeneralMonthlySummaryEntry(
      dateTime: dateTime,
      color: colors.first,
      label: '$doneDays / $applicableDays',
      child: RatingChart(
        colors: colors,
        data: daysToFlData(
          days,
          removeEmpty: true,
        ),
      ),
    );
  }
}
