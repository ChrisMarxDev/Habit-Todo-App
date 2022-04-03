import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mindful/logic/cubits/color_palette/color_palette_cubit.dart';
import 'package:mindful/models/daily_entry_types.dart';
import 'package:mindful/models/entry_description/routine_element_description.dart';
import 'package:mindful/models/weekdays.dart';
import 'package:mindful/util/extensions/text_theme_extension.dart';
import 'package:mindful/util/logging.dart';
import 'package:mindful/widgets/base_card.dart';
import 'package:mindful/widgets/dialogs/emoji_picker_dialog.dart';
import 'package:mindful/widgets/grey_out.dart';
import 'package:mindful/widgets/icon_avatar_widget.dart';
import 'package:mindful/widgets/misc/empty_widget.dart';
import 'package:mindful/widgets/misc/loading_widget.dart';
import 'package:mindful/widgets/modal_editable_text.dart';
import 'package:mindful/widgets/quadratic_selector_button.dart';
import 'package:mindful/widgets/type_selector.dart';

import 'details/edit_routine_details_screen.dart';
import 'edit_routine_cubit.dart';

class EditRoutineScreen extends StatelessWidget {
  static String route = 'EditRoutineScreen';

  const EditRoutineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EditRoutineBuilder();
    // return BlocProvider(
    //   create: (context) => EditRoutineCubit(firestoreManager: di.get()),
    //   child: const EditRoutineBuilder(),
    // );
  }
}

class EditRoutineBuilder extends StatelessWidget {
  const EditRoutineBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditRoutineCubit, EditRoutineState>(
      builder: (context, state) {
        return state.map(
          loading: (state) => const LoadingWidget(),
          loaded: (state) {
            return EditRoutineView(entries: state.entries);
          },
          empty: (EmptyState value) {
            return const EmptyWidget();
          },
        );
      },
    );
  }
}

class EditRoutineView extends StatelessWidget {
  final List<RoutineElementDescription> entries;

  const EditRoutineView({required this.entries, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: MediaQuery.of(context).padding.bottom + 32,
      ),
      physics: const BouncingScrollPhysics(),
      onReorder: (int oldIndex, int newIndex) {
        logger
            .i('reorder elements with: $oldIndex oldIndex $newIndex newIndex');
        if (oldIndex <= entries.length - 1 && newIndex <= entries.length - 1) {
          context.read<EditRoutineCubit>().reorder(oldIndex, newIndex);
        }
      },
      itemCount: entries.length + 1,
      itemBuilder: (context, index) {
        if (index < entries.length) {
          final entry = entries[index];
          return EditRoutineElementTile(
            entry: entry,
            key: ValueKey(entry.entryId),
          );
        } else {
          return Padding(
            key: const ValueKey('add_entry'),
            padding: const EdgeInsets.all(16),
            child: FloatingActionButton(
              onPressed: () => context.read<EditRoutineCubit>().addEntry(),
              child: Icon(
                LineAwesomeIcons.plus,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          );
        }
      },
    );
  }
}

class EditRoutineElementTile extends StatelessWidget {
  final RoutineElementDescription entry;

  const EditRoutineElementTile({
    required this.entry,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final color = getPalette(context).get(entry.colorIndex);
    final colors = getPalette(context).getGradient(entry.colorIndex);
    return GreyOut(
      isActive: entry.active,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
        child: BaseCard(
          innerPadding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
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
                            (emoji) => onSetEmoji(context, emoji),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ModalEditableText(
                          entry.title,
                          label: tr('enter_title_label'),
                          style: TextStyle(color: context.onPrimary()),
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
                  const Icon(
                    Icons.drag_handle_rounded,
                    color: Colors.white,
                    size: 42,
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: TextButton.icon(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      context.onPrimary(),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push<void>(
                      MaterialPageRoute(
                        builder: (context) {
                          return BlocProvider.value(
                            value: context.read<EditRoutineCubit>(),
                            child: EditRoutineDetailsScreen(
                              entryId: entry.entryId,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                  ),
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tr(
                          'edit_entry_details',
                        ),
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodyText1!.fontSize,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: avoid_positional_boolean_parameters
  void onToggle(BuildContext context, bool? value) {
    if (value != null) {
      context
          .read<EditRoutineCubit>()
          .toggleActivationState(entry.entryId, value);
    }
  }

  void onToggleWeekday(BuildContext context, Weekday day) {
    context.read<EditRoutineCubit>().toggleWeekday(entry.entryId, day);
  }

  void onSetEmoji(BuildContext context, String emoji) {
    context.read<EditRoutineCubit>().setEmoji(entry.entryId, emoji);
  }

  void onToggleColorIndex(BuildContext context, int index) {
    context.read<EditRoutineCubit>().toggleColorIndex(entry.entryId, index);
  }
}

class EntryTypeSelector extends StatelessWidget {
  final DailyEntryType type;
  final void Function(DailyEntryType) onChange;

  const EntryTypeSelector({
    required this.type,
    required this.onChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('entry_item_type_mode'),
          style: TextStyle(color: context.onPrimary()),
        ),
        const SizedBox(
          height: 8,
        ),
        TypeSelector<DailyEntryType>(
          types: const [
            DailyEntryType.checkbox,
            DailyEntryType.score,
          ],
          selected: type,
          onChange: onChange,
          elementToText: (DailyEntryType type) {
            return tr('daily_entry_type_${type.name}');
          },
        ),
      ],
    );
  }
}

class ColorSelector extends StatelessWidget {
  final int activeIndex;
  final void Function(int) onSelect;

  const ColorSelector({
    required this.activeIndex,
    required this.onSelect,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = getPalette(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('plan_routine_color'),
          style: TextStyle(color: context.onPrimary()),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(palette.colorCount, (index) => index)
              .map(
                (index) => QuadraticSelectorButton(
                  isActive: activeIndex == index,
                  onTap: () => onSelect(index),
                  // color: palette.get(index),
                  colors: palette.getGradient(index),
                  child: activeIndex == index
                      ? Icon(
                          Icons.check,
                          color: palette.get(index),
                        )
                      : null,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
