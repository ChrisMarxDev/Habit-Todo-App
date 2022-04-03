part of 'routine_summary_cubit.dart';

@freezed
class RoutineSummaryState with _$RoutineSummaryState {
  const factory RoutineSummaryState.init() = RoutineSummaryInitialState;
  const factory RoutineSummaryState.empty() = RoutineSummaryEmptyState;

  const factory RoutineSummaryState.content({
    required List<TaskSummary> summaries,
  }) = RoutineSummaryContentState;
}
