import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/app/service_locator.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/logic/cubits/color_palette/color_palette_cubit.dart';
import 'package:mindful/models/combined_entry_model.dart';
import 'package:mindful/models/entry_description/complete_routine.dart';
import 'package:mindful/screens/daily_entry/entry_types/checkbox_content_widget.dart';
import 'package:mindful/screens/edit_daily_routine/edit_routine_cubit.dart';
import 'package:mindful/util/extensions/int_extension.dart';
import 'package:mindful/util/extensions/text_theme_extension.dart';
import 'package:mindful/widgets/base_card.dart';
import 'package:mindful/widgets/custom_paint/ripple_overlay.dart';
import 'package:mindful/widgets/icon_avatar_widget.dart';
import 'package:mindful/widgets/misc/loading_widget.dart';

import 'daily_entry_cubit.dart';
import 'entry_types/score_content_widget.dart';
import 'entry_types/text_content_widget.dart';

class DailyEntryScreen extends StatelessWidget {
  const DailyEntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DailyEntryCubit(
        firestoreManager: di.get(),
        activeRoutine: CompleteRoutine.empty(),
      )..loadEntries(getCurrentRoutine(context)),
      child: const DailyEntryBuilder(),
    );
  }
}

class DailyEntryBuilder extends StatelessWidget {
  const DailyEntryBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditRoutineCubit, EditRoutineState>(
      listener: (context, state) {
        if (state is LoadedState) {
          context
              .read<DailyEntryCubit>()
              .loadEntries(CompleteRoutine(entries: state.entries));
        }
      },
      child: BlocBuilder<DailyEntryCubit, DailyEntryState>(
        builder: (context, state) {
          return state.map(
            init: (state) => const LoadingWidget(),
            content: (state) => DailyEntryView(state.entries),
          );
        },
      ),
    );
  }
}

class DailyEntryView extends StatefulWidget {
  final List<CombinedEntryModel> entries;

  const DailyEntryView(this.entries, {Key? key}) : super(key: key);

  @override
  State<DailyEntryView> createState() => _DailyEntryViewState();
}

class _DailyEntryViewState extends State<DailyEntryView> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(
      viewportFraction: 0.7,
    );
    // controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: widget.entries
          .map(
            (e) => EntryTile(
              entry: e,
              goToNextEntry: goToNextEntry,
            ),
          )
          .toList(),
    );
  }

  void goToNextEntry() {
    if (controller.page != null &&
        controller.page! < widget.entries.length - 1) {
      controller.animateToPage(
        controller.page!.floor() + 1,
        duration: Animations.baseDuration,
        curve: Animations.baseCurve,
      );
    }
  }
}

class EntryTile extends StatelessWidget {
  final CombinedEntryModel entry;
  final void Function()? goToNextEntry;

  const EntryTile({
    required this.entry,
    this.goToNextEntry,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = getPalette(context).get(entry.description.colorIndex);
    final gradient =
        getPalette(context).getGradient(entry.description.colorIndex);

    final isRippleActive = entry.input.mapOrNull(
      checkBox: (inp) => !inp.checked,
    );

    // final mediaQuery = MediaQuery.of(context);
    // final screenHeight = mediaQuery.size.height + mediaQuery.viewInsets.bottom;

    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.unit2,
        right: Dimens.unit2,
        top: Dimens.unit3,
        bottom: Dimens.unit,
      ),
      child: RippleOverlay(
        swipeable: isRippleActive == true,
        borderRadius: Dimens.borderRadiusInputCard,
        onCompleteSwipe: () => checkEntry(context, true),
        child: BaseCard(
          borderRaidus: Dimens.borderRadiusInputCard,
          innerPadding: const EdgeInsets.symmetric(
            horizontal: Dimens.unit3,
            vertical: Dimens.unit3,
          ),
          gradient: gradient,
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: Dimens.unit2,
                ),
                Center(
                  child: IconAvatarWidget(
                    emoji: entry.description.image,
                    size: 64,
                  ),
                ),
                const SizedBox(
                  height: Dimens.unit2,
                ),
                Text(
                  entry.description.title,
                  maxLines: 1,
                  style: context
                      .textTheme()
                      .headline3!
                      .recolor(context.onPrimary()),
                ),
                const SizedBox(
                  height: Dimens.unit,
                ),
                Expanded(
                  child: Text(
                    entry.description.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: context
                        .textTheme()
                        .bodyText2!
                        .recolor(context.onPrimary()),
                  ),
                ),
                entry.input.map(
                  checkBox: (inp) => CheckBoxContentWidget(
                    entry: inp,
                    color: color,
                    onCheck: (val) => checkEntry(context, val),
                  ),
                  rating: (inp) => ScoreContentWidget(
                    entry: inp,
                    color: color,
                    onRate: (val) => rateEntry(context, val),
                  ),
                  textList: (inp) => Container(),
                  text: (inp) => TextContentWidget(
                    entry: inp,
                    color: color,
                    onSubmit: (val) => editText(context, val),
                  ),
                ),
                const SizedBox(
                  height: Dimens.unit3,
                ),
                Text(
                  '${tr(
                    'base_daily_streak_text',
                    args: [entry.input.streak.toString()],
                  )}  ${entry.input.streak.getStreakIcons()}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: summaryGrey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: Dimens.unit,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _completedEntry() {
    HapticFeedback.heavyImpact();

    Future<void>.delayed(
      Animations.waitDuration,
    ).then((_) => goToNextEntry?.call());
  }

  // ignore: avoid_positional_boolean_parameters
  void checkEntry(BuildContext context, bool value) {
    context
        .read<DailyEntryCubit>()
        .checkEntry(entry.description.entryId, value);
    if (value) {
      _completedEntry();
    }
  }

  void editText(BuildContext context, String value) {
    // context
    //     .read<DailyEntryCubit>()
    //     .editText(entry.description.entryId, value);

    _completedEntry();
  }

  void rateEntry(BuildContext context, double value) {
    context.read<DailyEntryCubit>().rateEntry(entry.description.entryId, value);

    _completedEntry();
  }
}
