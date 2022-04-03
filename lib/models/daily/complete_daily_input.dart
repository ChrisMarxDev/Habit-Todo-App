import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindful/models/daily/daily_input_element.dart';
import 'package:mindful/util/converter/date_time_timestamp_converter.dart';

part 'complete_daily_input.freezed.dart';

part 'complete_daily_input.g.dart';

@freezed
@DateTimeTimestampConverter()
class CompleteDailyInput with _$CompleteDailyInput {
  factory CompleteDailyInput({
    required Map<String, DailyInputElement> entries,
    @DateTimeTimestampConverter() required DateTime date,
  }) = _CompleteDailyInput;

  factory CompleteDailyInput.fromJson(Map<String, dynamic> json) =>
      _$CompleteDailyInputFromJson(json);
}
