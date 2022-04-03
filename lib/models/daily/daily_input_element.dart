// ignore_for_file: avoid_positional_boolean_parameters
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindful/util/converter/date_time_timestamp_converter.dart';

import '../daily_entry_types.dart';

part 'daily_input_element.freezed.dart';

part 'daily_input_element.g.dart';

@freezed
@DateTimeTimestampConverter()
class DailyInputElement with _$DailyInputElement {
  // @Implements<CheckboxEntry>()
  const factory DailyInputElement.checkBox({
    @Default(0) int streak,
    @Default(false) bool checked,
  }) = CheckBoxEntry;

  const factory DailyInputElement.rating({
    @Default(0) int streak,
    double? rating,
  }) = RatingEntry;

  const factory DailyInputElement.textList({
    @Default(0) int streak,
    @Default(<String>[]) List<String> items,
  }) = TextListEntry;

  const factory DailyInputElement.text({
    @Default(0) int streak,
    String? text,
  }) = TextEntry;

  factory DailyInputElement.fromJson(Map<String, dynamic> json) =>
      _$DailyInputElementFromJson(json);

  static DailyInputElement getEmptyByType(
    DailyEntryType type, {
    String? id,
    int streak = 0,
  }) {
    switch (type) {
      case DailyEntryType.checkbox:
        return const CheckBoxEntry();
      case DailyEntryType.score:
        return const RatingEntry();
      case DailyEntryType.textList:
        return const TextListEntry();
      case DailyEntryType.text:
        return const TextEntry();
    }
  }

  static bool matchesType(DailyInputElement element, DailyEntryType type) {
    return element.map(
      checkBox: (value) => type == DailyEntryType.checkbox,
      rating: (value) => type == DailyEntryType.score,
      textList: (value) => type == DailyEntryType.textList,
      text: (value) => type == DailyEntryType.text,
    );
  }
}
