import 'package:bloc/bloc.dart';
import 'package:clock/clock.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindful/logic/repositories/firestore_manager.dart';
import 'package:mindful/models/daily/complete_daily_input.dart';
import 'package:mindful/models/entry_description/complete_routine.dart';
import 'package:mindful/util/extensions/date_time_extension.dart';

import 'models/task_summary.dart';

part 'routine_summary_state.dart';

part 'routine_summary_cubit.freezed.dart';

class RoutineSummaryCubit extends Cubit<RoutineSummaryState> {
  final FirestoreManager firestoreManager;

  final Clock clock;

  CompleteRoutine activeRoutine;

  RoutineSummaryCubit({
    required this.firestoreManager,
    required this.activeRoutine,
    Clock? clock,
  })  : clock = clock ?? const Clock(),
        super(const RoutineSummaryInitialState());

  Future<void> loadEntries(CompleteRoutine? routine) async {
    // if no routine is supplied, fetch from backend, if that one is null as well just return
    if (routine != null) {
      activeRoutine = routine;
    } else {
      final fetchedRoutine = await firestoreManager.getRoutine();
      if (fetchedRoutine != null) {
        activeRoutine = fetchedRoutine;
      } else {
        return;
      }
    }

    final currentInputs = await firestoreManager
        .getCompleteEntryMapUntil(DateTime(clock.now().year));

    if (currentInputs.isEmpty) {
      emit(
        const RoutineSummaryEmptyState(),
      );
      return;
    }

    final summaries = createSummaries(currentInputs, activeRoutine);
// TODO handle no entries better
    if (summaries.isEmpty) {
      emit(
        const RoutineSummaryEmptyState(),
      );
    } else {
      emit(
        RoutineSummaryContentState(
          summaries: summaries,
        ),
      );
    }
  }

  // expect a date sorted list of [inputs] and computes a summary element for each task
  List<TaskSummary> createSummaries(
    List<CompleteDailyInput> inputs,
    CompleteRoutine routine,
  ) {
    final summaryBuilders = Map<String, TaskSummaryBuilder>.fromEntries(
      routine.entries.map(
        (description) {
          return MapEntry(description.entryId, TaskSummaryBuilder(description));
        },
      ),
    );

    // oldest possible date
    var dateIndex = inputs.first.date;

    var inputIndex = 0;

    final now = clock.now();
    final dateLimit = DateTime(now.year, now.month, now.day, 23, 59, 59);
    // iterate through all dates since the oldest date
    while (dateIndex.isBefore(dateLimit)) {
      // if the date of the iterator is the same as an input entry, collect all checks
      if (inputIndex < inputs.length &&
          inputs[inputIndex].date.sameDate(dateIndex)) {
        final dateInput = inputs[inputIndex];
        for (final summaryBuilderEntry in summaryBuilders.entries) {
          if (dateInput.entries.containsKey(summaryBuilderEntry.key)) {
            summaryBuilderEntry.value.addEntryInput(
              dateIndex,
              dateInput.entries[summaryBuilderEntry.key],
            );
          } else {
            summaryBuilderEntry.value.addEntryInput(dateIndex, null);
          }
        }

        inputIndex++;
      }
      // else fill the builder with empty statements
      else {
        for (final summaryBuilder in summaryBuilders.values) {
          summaryBuilder.addEntryInput(dateIndex, null);
        }
      }

      dateIndex = dateIndex.add(const Duration(days: 1));
    }

    return routine.entries
        .map((entry) => summaryBuilders[entry.entryId]!.build())
        .toList();
  }
}
