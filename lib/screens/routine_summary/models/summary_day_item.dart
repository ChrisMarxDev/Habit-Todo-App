import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/daily/daily_input_element.dart';

part 'summary_day_item.freezed.dart';

enum CompletionState {
  done,
  notDone,
  notScheduled,
  noDate,
}

@freezed
class SummaryDayItem with _$SummaryDayItem {
  factory SummaryDayItem({
    required CompletionState state,
    DailyInputElement? input,
  }) = _SummaryDayItem;
  // factory SummaryDayItem.score({required CompletionState state, required int score}) =
  //     ScoreSummaryItem;
  // factory SummaryDayItem.textBox({required CompletionState state, required String text}) =
  //     TextBoxSummaryItem;
}
