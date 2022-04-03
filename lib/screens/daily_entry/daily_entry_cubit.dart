import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindful/logic/repositories/firestore_manager.dart';
import 'package:mindful/models/combined_entry_model.dart';
import 'package:mindful/models/daily/complete_daily_input.dart';
import 'package:mindful/models/daily/daily_input_element.dart';
import 'package:mindful/models/daily/streak_entry.dart';
import 'package:mindful/models/entry_description/complete_routine.dart';
import 'package:mindful/util/extensions/date_time_extension.dart';

part 'daily_entry_state.dart';

part 'daily_entry_cubit.freezed.dart';

class DailyEntryCubit extends Cubit<DailyEntryState> {
  final FirestoreManager firestoreManager;

  List<CombinedEntryModel> entries;
  CompleteRoutine activeRoutine;

  DailyEntryCubit({required this.firestoreManager, required this.activeRoutine})
      : entries = [],
        super(const DailyEntryInitialState());

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

    final currentInputs =
        await firestoreManager.getCompleteEntryMapForDate(DateTime.now());

    final todayWeekday = DateTime.now().toWeekday();

    final streakEntries = await firestoreManager.getStreakMap();

    final currentEntries = activeRoutine.entries
        .where(
      (description) =>
          description.active && description.activeDays.contains(todayWeekday),
    )
        .map((description) {
      DailyInputElement input;

      final streak = streakEntries[description.entryId] ??
          StreakEntry.empty(description.entryId);
      if (currentInputs?.entries.containsKey(description.entryId) == true) {
        input = currentInputs!.entries[description.entryId]!;

        if (!DailyInputElement.matchesType(input, description.type)) {
          input = DailyInputElement.getEmptyByType(
            description.type,
            streak: streak.streak,
          );
        }
      } else {
        input = DailyInputElement.getEmptyByType(
          description.type,
          streak: streak.streak,
        );
      }
      return CombinedEntryModel(description: description, input: input);
    }).toList();

    entries = currentEntries;
    emit(
      DailyEntryContentState(
        entries: entries,
        timestamp: DateTime.now(),
      ),
    );
  }

  // ignore: avoid_void_async
  Future<void> _changeElement(
    String entryId,
    CombinedEntryModel? Function(CombinedEntryModel) changeFunction, {
    bool updateStreak = false,
  }) async {
    if (state is DailyEntryContentState) {
      final index = entries.indexWhere(
        (element) => element.description.entryId == entryId,
      );

      // edge case safety: if day day border (12 pm) has been crossed when doing a change, force to download a fresh version of the entries
      if ((state as DailyEntryContentState).timestamp.day !=
          DateTime.now().day) {
        await loadEntries(activeRoutine);
      }

      if (index >= 0) {
        final changedElement = changeFunction(entries[index]);
        if (changedElement != null) {
          entries[index] = changedElement;
          emit(
            DailyEntryContentState(
              entries: entries,
              timestamp: DateTime.now(),
              // timestamp: DateTime.now(),
            ),
          );
          await saveEntries();
          if (updateStreak) {
            await changeStreakForEntry(entryId);
          }
        }
      }
    }
  }

  // WARNING this will lead to misbehaviour if some of the entries have been checked before 12 pm and the last one at after 12
  /// Saves all current entries to the firestore
  Future<void> saveEntries() async {
    final entriesMap = Map.fromEntries(
      entries.map((e) => MapEntry(e.description.entryId, e.input)),
    );
    final completeInput =
        CompleteDailyInput(entries: entriesMap, date: DateTime.now());
    await firestoreManager.setCompleteEntryMap(completeInput);
  }

  // ignore: avoid_positional_boolean_parameters
  void checkEntry(String entryId, bool value) {
    _changeElement(
      entryId,
      (entry) {
        if (entry.input is CheckBoxEntry) {
          final newStreak =
              value ? entry.input.streak + 1 : entry.input.streak - 1;
          return CombinedEntryModel(
            input: (entry.input as CheckBoxEntry)
                .copyWith(checked: value, streak: newStreak),
            description: entry.description,
          );
        } else {
          return null;
        }
      },
      updateStreak: true,
    );
  }

  void rateEntry(String entryId, double value) {
    _changeElement(
      entryId,
      (entry) {
        if (entry.input is RatingEntry) {
          final newStreak = (entry.input as RatingEntry).rating == null
              ? entry.input.streak + 1
              : entry.input.streak;
          return CombinedEntryModel(
            input: (entry.input as RatingEntry)
                .copyWith(rating: value, streak: newStreak),
            description: entry.description,
          );
        } else {
          return null;
        }
      },
      updateStreak: true,
    );
  }

  Future<void> changeStreakForEntry(String entryId) async {
    if (state is DailyEntryContentState) {
      final index = entries.indexWhere(
        (element) => element.description.entryId == entryId,
      );
      final streak = entries[index].input.streak;

      await firestoreManager.setStreakForId(
        StreakEntry(
          entryId: entryId,
          streak: streak,
          lastUpdate: DateTime.now(),
        ),
      );
    }
  }
}
