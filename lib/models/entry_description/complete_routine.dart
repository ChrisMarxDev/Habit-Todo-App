import 'package:freezed_annotation/freezed_annotation.dart';

import 'routine_element_description.dart';

part 'complete_routine.freezed.dart';

part 'complete_routine.g.dart';

@freezed
class CompleteRoutine with _$CompleteRoutine {
  factory CompleteRoutine({required List<RoutineElementDescription> entries}) =
      _CompleteRoutine;

  factory CompleteRoutine.fromJson(Map<String, dynamic> json) =>
      _$CompleteRoutineFromJson(json);

  // ignore: prefer_constructors_over_static_methods
  static CompleteRoutine empty() => CompleteRoutine(entries: []);
}
