import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../daily_entry_types.dart';
import '../weekdays.dart';

part 'routine_element_description.freezed.dart';

part 'routine_element_description.g.dart';

@freezed
class RoutineElementDescription with _$RoutineElementDescription {
  factory RoutineElementDescription({
    required String title,
    required String description,
    required DailyEntryType type,
    required Set<Weekday> activeDays,
    required String entryId,
    required String image,
    required bool active,
    required int colorIndex,
  }) = _RoutineElementDescription;

  factory RoutineElementDescription.fromJson(Map<String, dynamic> json) =>
      _$RoutineElementDescriptionFromJson(json);

  // ignore: prefer_constructors_over_static_methods
  static RoutineElementDescription emptyCustom() => RoutineElementDescription(
        entryId: const Uuid().v4(),
        title: '',
        description: '',
        type: DailyEntryType.checkbox,
        image: '✏️',
        colorIndex: Random().nextInt(20),
        activeDays: Weekday.values.toSet(),
        active: true,
      );
}
