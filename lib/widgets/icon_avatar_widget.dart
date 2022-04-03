import 'package:flutter/material.dart';

class IconAvatarWidget extends StatelessWidget {
  final String emoji;
  final bool showBackground;
  final double size;

  const IconAvatarWidget({
    required this.emoji,
    this.showBackground = true,
    this.size = 42,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (showBackground) {
      return ClipOval(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: size + 8 + size / 10,
              height: size + 8 + size / 10,
              child: Center(
                child: Text(
                  emoji,
                  style: TextStyle(fontSize: size),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Text(
        emoji,
        style: const TextStyle(fontSize: 42),
      );
    }
  }
}

class EditIconAvatarWidget extends StatelessWidget {
  final String emoji;
  final double size;
  final void Function() onTap;

  const EditIconAvatarWidget({
    required this.emoji,
    required this.onTap,
    this.size = 42,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          IconAvatarWidget(size: size, emoji: emoji),
          // const Align(
          //   alignment: Alignment.topLeft,
          //   child: RotatedBox(
          //     quarterTurns: 3,
          //     child: Icon(
          //       Icons.edit,
          //       color: summaryGrey,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
