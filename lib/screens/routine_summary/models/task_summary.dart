import 'package:mindful/models/daily/daily_input_element.dart';
import 'package:mindful/models/entry_description/routine_element_description.dart';
import 'package:mindful/screens/routine_summary/models/monthly_summary.dart';
import 'package:mindful/screens/routine_summary/models/summary_day_item.dart';
import 'package:mindful/util/extensions/date_time_extension.dart';

class TaskSummary {
  final List<MonthlySummary> monthlySummaries;
  final RoutineElementDescription routineElementDescription;

  TaskSummary(this.monthlySummaries, this.routineElementDescription);
}

class TaskSummaryBuilder {
  final List<MonthlySummary> monthlySummaries;
  final RoutineElementDescription routineElementDescription;

  DateTime? lastInputDate;

  TaskSummaryBuilder(this.routineElementDescription) : monthlySummaries = [];

  // void addInput(DateTime date, CompletionState state) {
  //   if (lastInputDate == null) {
  //     monthlySummaries.add(MonthlySummary.builder(date, state));
  //   } else if (lastInputDate!.year == date.year &&
  //       lastInputDate!.month == date.month) {
  //     // add date
  //     monthlySummaries.last.addCompletionElement(date, state);
  //   } else {
  //     // fill last month and add new monthly summary element
  //     monthlySummaries.last.fillEmpty();
  //
  //     // check to fill months inbetween
  //     // while(lastInputDate!.year != date.year &&
  //     //     lastInputDate!.month != date.month){
  //     //   monthlySummaries.add(MonthlySummary(date, completion))
  //     // }
  //
  //     monthlySummaries.add(MonthlySummary.builder(date, state));
  //   }
  //
  //   lastInputDate = date;
  // }

  void addEntryInput(DateTime date, DailyInputElement? state) {
    CompletionState completionState;
    if (state == null) {
      if (routineElementDescription.activeDays.contains(
        date.toWeekday(),
      )) {
        completionState = CompletionState.notDone;
      } else {
        completionState = CompletionState.notScheduled;
      }
    } else {
      completionState = state.map(
        checkBox: (checkBox) {
          return checkBox.checked
              ? CompletionState.done
              : CompletionState.notDone;
        },
        rating: (rating) => rating.rating != null
            ? CompletionState.done
            : CompletionState.notDone,
        textList: (_) => CompletionState.done,
        text: (text) =>
            text.text != null ? CompletionState.done : CompletionState.notDone,
      );
    }

    late SummaryDayItem dayEntry;

    if (state != null) {
      dayEntry = SummaryDayItem(state: completionState, input: state);
    } else {
      dayEntry = SummaryDayItem(
        state: completionState,
      );
    }

    if (lastInputDate == null) {
      monthlySummaries.add(
        MonthlySummary.builder(
          date,
          dayEntry,
          routineElementDescription.activeDays,
        ),
      );
    } else if (lastInputDate!.year == date.year &&
        lastInputDate!.month == date.month) {
      // add date
      monthlySummaries.last.addCompletionElement(date, dayEntry);
    } else {
      monthlySummaries.add(
        MonthlySummary.builder(
          date,
          dayEntry,
          routineElementDescription.activeDays,
        ),
      );
    }

    lastInputDate = date;
  }

  TaskSummary build() {
    return TaskSummary(monthlySummaries, routineElementDescription);
  }
}
