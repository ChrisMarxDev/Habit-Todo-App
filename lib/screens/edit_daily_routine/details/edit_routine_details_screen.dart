// ignore_for_file: avoid_positional_boolean_parameters

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/logic/cubits/color_palette/color_palette_cubit.dart';
import 'package:mindful/models/entry_description/routine_element_description.dart';
import 'package:mindful/models/weekdays.dart';
import 'package:mindful/screens/page_container/page_container_widget.dart';
import 'package:mindful/util/extensions/text_theme_extension.dart';
import 'package:mindful/widgets/base_card.dart';
import 'package:mindful/widgets/dialogs/emoji_picker_dialog.dart';
import 'package:mindful/widgets/grey_out.dart';
import 'package:mindful/widgets/icon_avatar_widget.dart';
import 'package:mindful/widgets/misc/loading_widget.dart';
import 'package:mindful/widgets/modal_editable_text.dart';

import '../date_selector.dart';
import '../edit_daily_routine_screen.dart';
import '../edit_routine_cubit.dart';

class EditRoutineDetailsScreen extends StatelessWidget {
  final String entryId;

  const EditRoutineDetailsScreen({
    required this.entryId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditRoutineCubit, EditRoutineState>(
      builder: (context, state) {
        if (state is! LoadedState) {
          return const LoadingWidget();
        } else {
          final entry =
              state.entries.firstWhere((element) => element.entryId == entryId);
          final color = getPalette(context).get(entry.colorIndex);
          final colors = getPalette(context).getGradient(entry.colorIndex);
          return Scaffold(
            appBar: MainAppBar(
              title: entry.title,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: Dimens.unit8),
              child: GreyOut(
                isActive: entry.active,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
                  child: BaseCard(
                    innerPadding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 8,
                    ),
                    gradient: colors,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  EditIconAvatarWidget(
                                    emoji: entry.image,
                                    onTap: () => EmojiPickerDialog.show(
                                      context,
                                      (emoji) =>
                                          onSetEmoji(context, emoji, entry),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ModalEditableText(
                                    entry.title,
                                    label: tr('enter_title_label'),
                                    style:
                                        TextStyle(color: context.onPrimary()),
                                    onChange: (text) {
                                      context
                                          .read<EditRoutineCubit>()
                                          .setTitle(entry.entryId, text);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ModalEditableText(
                                    entry.description,
                                    label: tr('enter_description_label'),
                                    onChange: (text) {
                                      context
                                          .read<EditRoutineCubit>()
                                          .setDescription(entry.entryId, text);
                                    },
                                    maxLines: null,
                                    style: context
                                        .textTheme()
                                        .bodyText2!
                                        .recolor(context.onPrimary()),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            DateSelector(
                              color: color,
                              active: entry.activeDays,
                              onSelect: (weekday) =>
                                  onToggleWeekday(context, weekday, entry),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            ColorSelector(
                              activeIndex: entry.colorIndex,
                              onSelect: (index) =>
                                  onToggleColorIndex(context, index, entry),
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            EntryTypeSelector(
                              type: entry.type,
                              onChange: (newType) {
                                context
                                    .read<EditRoutineCubit>()
                                    .toggleEntryType(entry.entryId, newType);
                              },
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(24),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton.icon(
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                        deleteRed,
                                      ),
                                      // side: MaterialStateProperty.all<BorderSide>(
                                      //     const BorderSide(color: deleteRed, width: 2),),
                                      // shape: MaterialStateProperty.all(
                                      //   const RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.all(
                                      //       Radius.circular(24),
                                      //     ),
                                      //   ),
                                      // ),
                                    ),
                                    onPressed: () => context
                                        .read<EditRoutineCubit>()
                                        .removeEntry(entry.entryId),
                                    icon: const Icon(
                                      Icons.delete,
                                      color: deleteRed,
                                    ),
                                    label: Text(
                                      tr('delete'),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: deleteRed,
                                      ),
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () =>
                                        onToggle(context, !entry.active, entry),
                                    label: Text(
                                      entry.active
                                          ? tr('deactivate')
                                          : tr('activate'),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: deactivateGrey,
                                      ),
                                    ),
                                    icon: Icon(
                                      entry.active
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: deactivateGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  void onToggle(
    BuildContext context,
    bool? value,
    RoutineElementDescription entry,
  ) {
    if (value != null) {
      context
          .read<EditRoutineCubit>()
          .toggleActivationState(entry.entryId, value);
    }
  }

  void onToggleWeekday(
    BuildContext context,
    Weekday day,
    RoutineElementDescription entry,
  ) {
    context.read<EditRoutineCubit>().toggleWeekday(entry.entryId, day);
  }

  void onSetEmoji(
    BuildContext context,
    String emoji,
    RoutineElementDescription entry,
  ) {
    context.read<EditRoutineCubit>().setEmoji(entry.entryId, emoji);
  }

  void onToggleColorIndex(
    BuildContext context,
    int index,
    RoutineElementDescription entry,
  ) {
    context.read<EditRoutineCubit>().toggleColorIndex(entry.entryId, index);
  }
}
