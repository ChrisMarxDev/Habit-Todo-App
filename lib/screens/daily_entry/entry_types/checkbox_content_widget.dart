import 'package:flutter/material.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/models/daily/daily_input_element.dart';
import 'package:mindful/widgets/custom_paint/animated_cross.dart';

class CheckBoxContentWidget extends StatelessWidget {
  final CheckBoxEntry entry;
  final Color color;
  final void Function(bool)? onCheck;

  const CheckBoxContentWidget({
    required this.entry,
    required this.color,
    required this.onCheck,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: Dimens.checkBoxSizeBig,
        ),
        child: SizedBox(
          height: Dimens.checkBoxSizeBig,
          width: Dimens.checkBoxSizeBig,
          child: AnimatedClippedCross(
            value: entry.checked,
            strokeWidth: 12,
            // color: color,
            onCheck: onCheck,
          ),
        ),
      ),
    );
  }
}
