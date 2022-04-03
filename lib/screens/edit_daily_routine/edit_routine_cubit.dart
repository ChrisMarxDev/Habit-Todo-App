import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindful/logic/repositories/firestore_manager.dart';
import 'package:mindful/models/entry_description/complete_routine.dart';
import 'package:mindful/models/entry_description/routine_element_description.dart';
import 'package:mindful/models/weekdays.dart';
import 'package:mindful/util/extensions/list_extension.dart';
import 'package:mindful/util/logging.dart';

import '../../models/daily_entry_types.dart';

part 'edit_routine_cubit.freezed.dart';

part 'edit_routine_state.dart';

// fetches the current [EditRoutineCubit] state entries as [CompleteRoutine] or null
CompleteRoutine? getCurrentRoutine(BuildContext context) {
  final state = context.read<EditRoutineCubit>().state;
  return state is LoadedState ? CompleteRoutine(entries: state.entries) : null;
}

final exampleScore = RoutineElementDescription(
  description: 'test',
  activeDays: Weekday.values.toSet(),
  image: '🙏',
  title: 'test',
  active: true,
  entryId: 'test1',
  colorIndex: 2,
  type: DailyEntryType.score,
);
final exampleText = RoutineElementDescription(
  description: 'test',
  activeDays: Weekday.values.toSet(),
  image: '🙏',
  title: 'test4',
  active: true,
  entryId: 'test2',
  colorIndex: 2,
  type: DailyEntryType.text,
);

class EditRoutineCubit extends Cubit<EditRoutineState> {
  final FirestoreManager firestoreManager;

  List<RoutineElementDescription> entries;

  Timer? debounceTimer;

  EditRoutineCubit({required this.firestoreManager})
      : entries = [],
        super(
          const LoadingState(),
        );

  Future<void> init() async {
    logger.i('EditRoutineCubit init');
    final fetchedEntries = (await firestoreManager.getRoutine())?.entries;

    if (fetchedEntries != null) {
      entries = fetchedEntries;
    }
    // if entries are not empty before init, we assume that some have been set during the onboarding and want to save them.
    if (entries.isNotEmpty) {
      await saveEntries(dontDebounce: true);
    }
    emit(
      LoadedState(
        entries: entries,
        // entries: [
        //   exampleScore,
        //   exampleText,
        // ],
        timestamp: DateTime.now(),
      ),
    );
  }

  void toggleWeekday(String entryId, Weekday day) {
    _changeElement(entryId, (entry) {
      return entry.copyWith(
        activeDays: entry.activeDays.toggle(day),
      );
    });
  }

  void toggleColorIndex(String entryId, int index) {
    _changeElement(entryId, (entry) {
      return entry.copyWith(
        colorIndex: index,
      );
    });
  }

  void setEmoji(String entryId, String emoji) {
    _changeElement(entryId, (entry) {
      return entry.copyWith(
        image: emoji,
      );
    });
  }

  // ignore: avoid_positional_boolean_parameters
  void toggleActivationState(String entryId, bool active) {
    _changeElement(entryId, (entry) {
      return entry.copyWith(
        active: active,
      );
    });
  }

  void setTitle(String entryId, String title) {
    _changeElement(entryId, (entry) {
      return entry.copyWith(
        title: title,
      );
    });
  }

  void setDescription(String entryId, String description) {
    _changeElement(entryId, (entry) {
      return entry.copyWith(
        description: description,
      );
    });
  }

  void toggleEntryType(String entryId, DailyEntryType newType) {
    _changeElement(entryId, (entry) {
      return entry.copyWith(
        type: newType,
      );
    });
  }

  void _changeElement(
    String entryId,
    RoutineElementDescription Function(RoutineElementDescription)
        changeFunction,
  ) {
    if (state is LoadedState) {
      final index = entries.indexWhere(
        (element) => element.entryId == entryId,
      );
      if (index >= 0) {
        entries[index] = changeFunction(entries[index]);
        emit(
          LoadedState(
            entries: entries,
            timestamp: DateTime.now(),
          ),
        );
        // check if this is not maybe overload
        saveEntries();
      }
    }
  }

  void removeEntry(String entryId) {
    if (state is LoadedState) {
      entries.removeWhere((entry) => entry.entryId == entryId);
      emit(
        LoadedState(
          entries: entries,
          timestamp: DateTime.now(),
        ),
      );
    }
  }

  void addEntry() {
    if (state is LoadedState) {
      entries.add(RoutineElementDescription.emptyCustom());
      emit(
        LoadedState(
          entries: entries,
          timestamp: DateTime.now(),
        ),
      );
    }
  }

  void addMultipleEntries(List<RoutineElementDescription> elements) {
    entries.addAll(elements);
    if (state is LoadedState) {
      emit(
        LoadedState(
          entries: entries,
          timestamp: DateTime.now(),
        ),
      );
    }
  }

  Future<void> saveEntries({bool dontDebounce = false}) async {
    if ((debounceTimer?.isActive ?? false) || dontDebounce) {
      debounceTimer?.cancel();
    }
    debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      final routine = CompleteRoutine(entries: entries);
      await firestoreManager.setRoutine(routine);
    });
  }

  void reorder(int oldIndex, int newIndex) {
    var updatedIndex = newIndex;
    final item = entries.removeAt(oldIndex);

    if (updatedIndex > oldIndex) {
      updatedIndex--;
    }

    entries.insert(updatedIndex, item);
    emit(
      LoadedState(
        entries: entries,
        timestamp: DateTime.now(),
      ),
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
