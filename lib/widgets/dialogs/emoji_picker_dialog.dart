import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

typedef OnPickEmoji = void Function(String emoji);

class EmojiPickerDialog extends StatelessWidget {
  final OnPickEmoji onPickEmoji;

  const EmojiPickerDialog({
    required this.onPickEmoji,
    Key? key,
  }) : super(key: key);

  static void show(BuildContext context, OnPickEmoji onPickEmoji) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return EmojiPickerDialog(onPickEmoji: onPickEmoji);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.633,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
          child: EmojiPicker(
            onEmojiSelected: (category, emoji) {
              onPickEmoji(emoji.emoji);
              Navigator.of(context).pop();
            },
            config: Config(
              columns: 6,
              showRecentsTab: false,
              emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
              initCategory: Category.ACTIVITIES,
              bgColor: Colors.transparent,
              indicatorColor: Theme.of(context).colorScheme.primary,
              iconColorSelected: Theme.of(context).colorScheme.primary,
              progressIndicatorColor: Theme.of(context).colorScheme.primary,
              buttonMode:
                  Platform.isIOS ? ButtonMode.CUPERTINO : ButtonMode.MATERIAL,
            ),
          ),
        ),
      ),
    );
  }
}
