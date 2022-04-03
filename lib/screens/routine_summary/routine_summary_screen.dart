import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/app/service_locator.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/logic/cubits/color_palette/color_palette_cubit.dart';
import 'package:mindful/models/daily_entry_types.dart';
import 'package:mindful/models/entry_description/complete_routine.dart';
import 'package:mindful/screens/edit_daily_routine/edit_routine_cubit.dart';
import 'package:mindful/screens/routine_summary/models/task_summary.dart';
import 'package:mindful/screens/routine_summary/widgets/routine_selector.dart';
import 'package:mindful/widgets/misc/empty_widget.dart';
import 'package:mindful/widgets/misc/loading_widget.dart';

import 'routine_summary_cubit.dart';
import 'widgets/checkbox_summary_table.dart';
import 'widgets/monthly_rating_summary_chart.dart';

class RoutineSummaryScreen extends StatelessWidget {
  const RoutineSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoutineSummaryCubit(
        firestoreManager: di.get(),
        activeRoutine: CompleteRoutine.empty(),
      )..loadEntries(getCurrentRoutine(context)),
      child: const RoutineSummaryBuilder(),
    );
  }
}

class RoutineSummaryBuilder extends StatelessWidget {
  const RoutineSummaryBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoutineSummaryCubit, RoutineSummaryState>(
      builder: (context, state) {
        return state.map(
          init: (value) {
            return const LoadingWidget();
          },
          content: (content) {
            return RoutineSummaryView(summaries: content.summaries);
          },
          empty: (RoutineSummaryEmptyState value) {
            return const EmptyWidget();
          },
        );
      },
    );
  }
}

class RoutineSummaryView extends StatefulWidget {
  final List<TaskSummary> summaries;

  const RoutineSummaryView({required this.summaries, Key? key})
      : super(key: key);

  @override
  State<RoutineSummaryView> createState() => _RoutineSummaryViewState();
}

class _RoutineSummaryViewState extends State<RoutineSummaryView> {
  int index = 0;
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: index);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: Dimens.taskSelectorSize,
            child: RoutineSelector(
              emoji: widget.summaries[index].routineElementDescription.image,
              backward: index > 0
                  ? () => controller.animateToPage(
                        index - 1,
                        duration: Animations.quickAnimation,
                        curve: Animations.baseCurve,
                      )
                  : null,
              forward: index < widget.summaries.length - 1
                  ? () => controller.animateToPage(
                        index + 1,
                        duration: Animations.quickAnimation,
                        curve: Animations.baseCurve,
                      )
                  : null,
              color: getPalette(context).get(
                widget.summaries[index].routineElementDescription.colorIndex,
              ),
              title: widget.summaries[index].routineElementDescription.title,
            ),
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: (page) {
                setState(() {
                  index = page;
                });
              },
              controller: controller,
              itemCount: widget.summaries.length,
              itemBuilder: (context, index) {
                return RoutineSummaryPage(
                  taskSummary: widget.summaries[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class RoutineSummaryPage extends StatelessWidget {
  final TaskSummary taskSummary;

  const RoutineSummaryPage({
    required this.taskSummary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = taskSummary.monthlySummaries.length;
    return Align(
      alignment: Alignment.topCenter,
      child: ListView.builder(
        shrinkWrap: count < 5,
        // shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: count,
        reverse: true,
        itemBuilder: (context, index) {
          // taskSummary.

          final summary = taskSummary.monthlySummaries[count - 1 - index];

          final date = summary.date;

          final days = summary.items;
          final color = getPalette(context)
              .get(taskSummary.routineElementDescription.colorIndex);
          final colors = getPalette(context)
              .getGradient(taskSummary.routineElementDescription.colorIndex);

          switch (taskSummary.routineElementDescription.type) {
            case DailyEntryType.checkbox:
              return CheckboxSummaryTable(
                dateTime: date,
                days: days,
                color: color,
              );
            case DailyEntryType.score:
              return MonthlyRatingSummaryChart(
                days: days,
                dateTime: date,
                colors: colors,
              );
            case DailyEntryType.textList:
              break;
            case DailyEntryType.text:
              // TODO: Handle this case.
              break;
          }
          return Container();
        },
        // children: [
        //   CheckboxSummaryTable(
        //     dateTime: DateTime(2022, 4),
        //     days: List.generate(
        //       31,
        //       (index) => CompletionState.values[Random().nextInt(3)],
        //     ),
        //     color: getPalette(context).primary,
        //   ),
        // ],
      ),
    );
  }
}
