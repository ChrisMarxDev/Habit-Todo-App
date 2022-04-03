import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/models/daily_entry_types.dart';
import 'package:mindful/models/entry_description/routine_element_description.dart';
import 'package:mindful/models/weekdays.dart';
import 'package:mindful/util/analytics.dart';
import 'package:mindful/widgets/custom_paint/animated_cross.dart';

const predefinedEntryIdExercise = 'predefined_exercise';
const predefinedEntryIdTodos = 'predefined_todos';
const predefinedEntryIdHydrate = 'predefined_hydrate';
const predefinedEntryIdRead = 'predefined_reading';
const predefinedEntryIdMoodScore = 'predefined_mood';

List<RoutineElementDescription> initialEntries = [
  RoutineElementDescription(
    entryId: predefinedEntryIdExercise,
    title: tr('init_entry_title_exercise'),
    description: tr('init_entry_description_exercise'),
    type: DailyEntryType.checkbox,
    colorIndex: 1,
    image: '💪',
    activeDays: {Weekday.mon, Weekday.wed, Weekday.fri},
    active: true,
  ),
  RoutineElementDescription(
    entryId: predefinedEntryIdTodos,
    title: tr('init_entry_title_todos'),
    description: tr('init_entry_description_todos'),
    type: DailyEntryType.checkbox,
    image: '☑',
    colorIndex: 2,
    activeDays: {
      Weekday.mon,
      Weekday.tue,
      Weekday.wed,
      Weekday.thu,
      Weekday.fri,
      Weekday.sat,
    },
    active: true,
  ),
  RoutineElementDescription(
    entryId: predefinedEntryIdHydrate,
    title: tr('init_entry_title_hydrate'),
    description: tr('init_entry_description_hydrate'),
    type: DailyEntryType.checkbox,
    image: '💧',
    colorIndex: 3,
    activeDays: {
      Weekday.mon,
      Weekday.tue,
      Weekday.wed,
      Weekday.thu,
      Weekday.fri,
      Weekday.sat,
      Weekday.sun,
    },
    active: true,
  ),
  RoutineElementDescription(
    entryId: predefinedEntryIdRead,
    title: tr('init_entry_title_read'),
    description: tr('init_entry_description_read'),
    type: DailyEntryType.checkbox,
    image: '📚',
    colorIndex: 4,
    activeDays: {
      Weekday.mon,
      Weekday.wed,
      Weekday.fri,
      Weekday.sun,
    },
    active: true,
  ),
  RoutineElementDescription(
    entryId: predefinedEntryIdMoodScore,
    title: tr('init_entry_title_mood_score'),
    description: tr('init_entry_description_mood_score'),
    type: DailyEntryType.score,
    image: '🙂',
    colorIndex: 5,
    activeDays: {
      Weekday.mon,
      Weekday.tue,
      Weekday.wed,
      Weekday.thu,
      Weekday.fri,
      Weekday.sat,
      Weekday.sun,
    },
    active: true,
  ),
];

class OnboardingSelectRoutines extends StatelessWidget {
  final List<RoutineElementDescription> selectedEntries;
  final void Function(bool, RoutineElementDescription) toggleEntry;

  const OnboardingSelectRoutines({
    required this.selectedEntries,
    required this.toggleEntry,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            tr('onboarding_select_routines_description'),
            textAlign: TextAlign.center,
          ),
        ),
        ...initialEntries
            .map(
              (e) => _SelectRoutineTile(
                element: e,
                isSelected: selectedEntries
                    .where((element) => element.entryId == e.entryId)
                    .isNotEmpty,
                toggleEntry: toggleEntry,
              ),
            )
            .toList()
      ],
    );
  }
}

class _SelectRoutineTile extends StatelessWidget {
  final RoutineElementDescription element;
  final bool isSelected;
  final void Function(bool, RoutineElementDescription) toggleEntry;

  const _SelectRoutineTile({
    required this.element,
    required this.isSelected,
    required this.toggleEntry,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          logEvent('onboarding_select_predefined', {'item': element.entryId});
          toggleEntry(!isSelected, element);
        },
        child: Container(
          height: Dimens.onboardingSelectorRoutineSize,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    element.image,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        element.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        element.description,
                        maxLines: 3,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16, right: 8),
                  child: AnimatedCross(
                    color: color,
                    value: isSelected,
                    strokeWidth: 6,
                    onCheck: (val) => toggleEntry(val, element),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
