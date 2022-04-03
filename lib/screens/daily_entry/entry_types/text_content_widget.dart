import 'package:flutter/material.dart';
import 'package:mindful/models/daily/daily_input_element.dart';

class TextContentWidget extends StatelessWidget {
  final TextEntry entry;
  final Color color;
  final void Function(String)? onSubmit;

  const TextContentWidget({
    required this.entry,
    required this.color,
    required this.onSubmit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextField(),
    );
  }
}
