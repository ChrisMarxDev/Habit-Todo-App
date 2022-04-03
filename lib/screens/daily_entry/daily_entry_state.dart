part of 'daily_entry_cubit.dart';

@freezed
class DailyEntryState with _$DailyEntryState {
  const factory DailyEntryState.init() = DailyEntryInitialState;
  const factory DailyEntryState.content({
    required List<CombinedEntryModel> entries,
    required DateTime timestamp,
  }) = DailyEntryContentState;
  // const factory DailyEntryState.error({required String data}) = DailyEntryErrorState;
}
