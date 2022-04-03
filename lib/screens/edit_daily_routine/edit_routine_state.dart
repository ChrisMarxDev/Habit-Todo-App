part of 'edit_routine_cubit.dart';

@freezed
class EditRoutineState with _$EditRoutineState {
  const factory EditRoutineState.loading() = LoadingState;
  const factory EditRoutineState.empty() = EmptyState;

  const factory EditRoutineState.loaded({
    required DateTime timestamp,
    required List<RoutineElementDescription> entries,
  }) = LoadedState;
}
