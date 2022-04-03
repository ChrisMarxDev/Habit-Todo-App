import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/screens/routine_summary/models/summary_day_item.dart';
import 'package:mindful/util/extensions/date_time_extension.dart';
import 'package:quiver/iterables.dart';

import 'general_monthly_summary_entry.dart';

class CheckboxSummaryTable extends StatelessWidget {
  final DateTime dateTime;
  final List<SummaryDayItem> days;
  final Color color;

  const CheckboxSummaryTable({
    required this.days,
    required this.color,
    required this.dateTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weekDayOffset = dateTime.getWeekOffset();

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
      color: color,
      label: '$doneDays / $applicableDays',
      child: SummaryMonthGrid(
        weekDayOffset: weekDayOffset,
        days: days.map((element) => element.state).toList(),
        color: color,
      ),
    );
  }
}

class SummaryMonthGrid extends StatelessWidget {
  final List<CompletionState> days;
  final Color color;
  final int weekDayOffset;
  final bool showWeekDays;

  const SummaryMonthGrid({
    required this.days,
    required this.color,
    this.showWeekDays = true,
    required this.weekDayOffset,
    Key? key,
  }) : super(key: key);

  List<Widget> summaryEntries() {
    final paddedDayList = List.of(days)
      ..insertAll(
        0,
        List.generate(weekDayOffset, (index) => CompletionState.noDate),
      );

    final widgets = enumerate(paddedDayList)
        .map<Widget>(
          (indexedState) => SummarySquare(
            color: color,
            state: indexedState.value,
            day: indexedState.index + 1 - weekDayOffset,
          ),
        )
        .toList();

    if (showWeekDays) {
      // QuadraticSelectorButton(isActive: false,);
      // Add weekday indicator
      final weekDayIndicators = [
        Center(
          child: Text(
            tr('mon_one_letter'),
            style: TextStyle(color: color),
          ),
        ),
        Center(
          child: Text(
            tr('tue_one_letter'),
            style: TextStyle(color: color),
          ),
        ),
        Center(
          child: Text(
            tr('wed_one_letter'),
            style: TextStyle(color: color),
          ),
        ),
        Center(
          child: Text(
            tr('thu_one_letter'),
            style: TextStyle(color: color),
          ),
        ),
        Center(
          child: Text(
            tr('fri_one_letter'),
            style: TextStyle(color: color),
          ),
        ),
        Center(
          child: Text(
            tr('sat_one_letter'),
            style: TextStyle(color: color),
          ),
        ),
        Center(
          child: Text(
            tr('sun_one_letter'),
            style: TextStyle(color: color),
          ),
        ),
      ];

      widgets.insertAll(0, weekDayIndicators);
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.only(bottom: Dimens.unit3),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 20,
        mainAxisExtent: 24,
      ),
      children: summaryEntries(),
    );
  }
}

class SummarySquare extends StatelessWidget {
  final CompletionState state;
  final Color color;
  final int day;

  const SummarySquare({
    required this.state,
    required this.color,
    required this.day,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: getColorForDate(state),
        border: state != CompletionState.notDone
            ? null
            : Border.fromBorderSide(
                BorderSide(color: color.withOpacity(0.5), width: 1.3),
              ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      duration: const Duration(milliseconds: 360),
      child: day > 0
          ? Center(
              child: Text(
                '$day',
                style: TextStyle(
                  fontSize: 8,
                  color: getTextColorForDate(state),
                ),
              ),
            )
          : null,
    );
  }

  Color getColorForDate(CompletionState state) {
    switch (state) {
      case CompletionState.done:
        return color;
      case CompletionState.notDone:
        return Colors.transparent;
      case CompletionState.notScheduled:
        return summaryNotScheduled;
      case CompletionState.noDate:
        return Colors.transparent;
    }
  }

  Color getTextColorForDate(CompletionState state) {
    switch (state) {
      case CompletionState.done:
        return Colors.white;
      case CompletionState.notDone:
        return color;
      case CompletionState.notScheduled:
        return Colors.white;
      case CompletionState.noDate:
        return Colors.transparent;
    }
  }
}
