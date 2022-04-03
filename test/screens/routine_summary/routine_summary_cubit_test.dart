import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindful/logic/repositories/firestore_manager.dart';
import 'package:mindful/models/daily/complete_daily_input.dart';
import 'package:mindful/models/daily/daily_input_element.dart';
import 'package:mindful/models/daily_entry_types.dart';
import 'package:mindful/models/entry_description/complete_routine.dart';
import 'package:mindful/models/entry_description/routine_element_description.dart';
import 'package:mindful/models/weekdays.dart';
import 'package:mindful/screens/routine_summary/models/summary_day_item.dart';
import 'package:mindful/screens/routine_summary/routine_summary_cubit.dart';

import '../../helpers/mocks.dart';

void main() {
  late FirestoreManager mockRepo;
  late Clock clock;

  setUp(() {
    mockRepo = MockFirestoreManager();
    clock = Clock(() => DateTime(2022, 1, 11));

    // when(mockRepo.function())
    //     .thenAnswer((invocation) => Future(() => mockResult));
  });

  RoutineSummaryCubit cubit({Clock? overrideClock}) => RoutineSummaryCubit(
        firestoreManager: mockRepo,
        clock: overrideClock ?? clock,
        activeRoutine: CompleteRoutine.empty(),
      );

  group('Functions tests', () {
    test('Test data ordering functions one input', () {
      const id1 = 'id1';

      final entries = [
        RoutineElementDescription(
          entryId: id1,
          title: '',
          description: '',
          type: DailyEntryType.checkbox,
          colorIndex: 1,
          image: '',
          activeDays: {
            Weekday.thu,
            Weekday.fri,
            Weekday.sat,
          },
          active: true,
        ),
      ];

      final inputs = [
        CompleteDailyInput(
          date: DateTime(2022, 1, 6),
          entries: {
            id1: const CheckBoxEntry(checked: true),
          },
        ),
        CompleteDailyInput(
          date: DateTime(2022, 1, 7),
          entries: {
            id1: const CheckBoxEntry(checked: false),
          },
        ),
        CompleteDailyInput(
          date: DateTime(2022, 1, 8),
          entries: {
            id1: const CheckBoxEntry(checked: true),
          },
        ),
      ];

      final summaries =
          cubit().createSummaries(inputs, CompleteRoutine(entries: entries));

      expect(summaries.length, 1);

      expect(summaries.first.monthlySummaries.first.items.length, 11);

      expect(summaries.first.monthlySummaries.first.items, [
        CompletionState.notDone,
        CompletionState.notScheduled,
        CompletionState.notScheduled,
        CompletionState.notScheduled,
        CompletionState.notScheduled,
        CompletionState.done,
        CompletionState.notDone,
        CompletionState.done,
        CompletionState.notScheduled,
        CompletionState.notScheduled,
        CompletionState.notScheduled,
      ]);
    });

    test('Test data ordering functions with two inputs', () {
      const id1 = 'id1';
      const id2 = 'id2';

      final entries = [
        RoutineElementDescription(
          entryId: id1,
          title: '',
          description: '',
          type: DailyEntryType.checkbox,
          colorIndex: 1,
          image: '',
          activeDays: {
            Weekday.thu,
            Weekday.fri,
            Weekday.sat,
          },
          active: true,
        ),
        RoutineElementDescription(
          entryId: id2,
          title: '',
          description: '',
          type: DailyEntryType.checkbox,
          colorIndex: 1,
          image: '',
          activeDays: {
            Weekday.mon,
            Weekday.tue,
            Weekday.wed,
            Weekday.thu,
            Weekday.fri,
          },
          active: true,
        ),
      ];

      final inputs = [
        CompleteDailyInput(
          date: DateTime(2022, 1, 6),
          entries: {
            id1: const CheckBoxEntry(checked: true),
            id2: const CheckBoxEntry(checked: true),
          },
        ),
        CompleteDailyInput(
          date: DateTime(2022, 1, 7),
          entries: {
            id1: const CheckBoxEntry(checked: false),
            id2: const CheckBoxEntry(checked: true),
          },
        ),
        CompleteDailyInput(
          date: DateTime(2022, 1, 8),
          entries: {
            id1: const CheckBoxEntry(checked: true),
          },
        ),
        CompleteDailyInput(
          date: DateTime(2022, 1, 10),
          entries: {
            id2: const CheckBoxEntry(checked: true),
          },
        ),
      ];

      final summaries =
          cubit().createSummaries(inputs, CompleteRoutine(entries: entries));

      expect(summaries.length, 2);

      expect(summaries.first.monthlySummaries.first.items.length, 11);
      expect(summaries[1].monthlySummaries.first.items.length, 11);

      expect(summaries.first.monthlySummaries.first.items, [
        CompletionState.notDone,
        CompletionState.notScheduled,
        CompletionState.notScheduled,
        CompletionState.notScheduled,
        CompletionState.notScheduled,
        CompletionState.done,
        CompletionState.notDone,
        CompletionState.done,
        CompletionState.notScheduled,
        CompletionState.notScheduled,
        CompletionState.notScheduled,
      ]);
    });

    test(
      'Test data ordering functions with two inputs over two months',
      () {
        const id1 = 'id1';
        const id2 = 'id2';

        final entries = [
          RoutineElementDescription(
            entryId: id1,
            title: '',
            description: '',
            type: DailyEntryType.checkbox,
            colorIndex: 1,
            image: '',
            activeDays: {
              Weekday.thu,
              Weekday.fri,
              Weekday.sat,
            },
            active: true,
          ),
          RoutineElementDescription(
            entryId: id2,
            title: '',
            description: '',
            type: DailyEntryType.checkbox,
            colorIndex: 1,
            image: '',
            activeDays: {
              Weekday.mon,
              Weekday.tue,
              Weekday.wed,
              Weekday.thu,
              Weekday.fri,
            },
            active: true,
          ),
        ];

        final inputs = [
          CompleteDailyInput(
            date: DateTime(2022, 1, 6),
            entries: {
              id1: const CheckBoxEntry(checked: true),
              id2: const CheckBoxEntry(checked: true),
            },
          ),
          CompleteDailyInput(
            date: DateTime(2022, 1, 7),
            entries: {
              id1: const CheckBoxEntry(checked: false),
              id2: const CheckBoxEntry(checked: true),
            },
          ),
          CompleteDailyInput(
            date: DateTime(2022, 1, 8),
            entries: {
              id1: const CheckBoxEntry(checked: true),
            },
          ),
          CompleteDailyInput(
            date: DateTime(2022, 1, 10),
            entries: {
              id2: const CheckBoxEntry(checked: true),
            },
          ),
        ];

        final summaries =
            cubit(overrideClock: Clock(() => DateTime(2022, 2, 11)))
                .createSummaries(inputs, CompleteRoutine(entries: entries));
        expect(summaries.length, 2);

        expect(summaries.first.monthlySummaries.first.items.length, 11);
        expect(summaries[1].monthlySummaries.first.items.length, 11);

        expect(summaries.first.monthlySummaries.first.items, [
          CompletionState.notDone,
          CompletionState.notScheduled,
          CompletionState.notScheduled,
          CompletionState.notScheduled,
          CompletionState.notScheduled,
          CompletionState.done,
          CompletionState.notDone,
          CompletionState.done,
          CompletionState.notScheduled,
          CompletionState.notScheduled,
          CompletionState.notScheduled,
        ]);
      },
      skip: true,
    );
  });

  group('RoutinteSummaryCubit tests', () {
    test('The first state should be InitialState', () {
      expect(cubit().state, const RoutineSummaryInitialState());
    });

    // blocTest<RoutineSummaryCubit,RoutineSummaryState>(' calls function and emits [State]',
    //     build: () => cubit,
    //     act: (RoutineSummaryCubit cubit) {},
    //     verify: (_) {
    //       // verify(mockRepo.function(any)).called(1);
    //       expect(cubit.state, isA<RoutineSummaryState>());
    //     });
  });
}
