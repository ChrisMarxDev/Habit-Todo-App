import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindful/util/converter/date_time_timestamp_converter.dart';

part 'streak_entry.freezed.dart';
part 'streak_entry.g.dart';

@freezed
@DateTimeNullTimestampConverter()
class StreakEntry with _$StreakEntry {
  factory StreakEntry({
    required String entryId,
    required int streak,
    @DateTimeNullTimestampConverter() required DateTime? lastUpdate,
  }) = _StreakEntry;

  factory StreakEntry.fromJson(Map<String, dynamic> json) =>
      _$StreakEntryFromJson(json);

  // ignore: prefer_constructors_over_static_methods
  static StreakEntry empty(String id) =>
      StreakEntry(entryId: id, streak: 0, lastUpdate: null);
}
