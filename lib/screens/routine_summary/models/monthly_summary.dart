import 'package:mindful/models/weekdays.dart';
import 'package:mindful/screens/routine_summary/models/summary_day_item.dart';
import 'package:mindful/util/extensions/date_time_extension.dart';

class MonthlySummary {
  final DateTime date;
  final List<SummaryDayItem> items;

  MonthlySummary(this.date, this.items);

  MonthlySummary.builder(
    this.date,
    SummaryDayItem firstState,
    Set<Weekday> activeDays,
  ) : items = List.generate(date.day - 1, (index) {
          final indexDate = DateTime(date.year, date.month, index + 1);
          if (activeDays.contains(indexDate.toWeekday())) {
            return SummaryDayItem(
              state: CompletionState.notDone,
            );
          } else {
            return SummaryDayItem(
              state: CompletionState.notScheduled,
            );
          }
        })
          ..add(firstState);

  void addCompletionElement(DateTime date, SummaryDayItem newestState) {
    items.add(newestState);
  }

  void fillEmpty() {
    items.addAll(
      List.generate(
        date.getDaysInMonth() - items.length,
        (index) => SummaryDayItem(
          state: CompletionState.notScheduled,
        ),
      ),
    );
  }
}
