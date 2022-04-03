import 'package:flutter/material.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/util/extensions/int_extension.dart';
import 'package:mindful/widgets/rounded_label.dart';

class GeneralMonthlySummaryEntry extends StatelessWidget {
  final DateTime dateTime;
  final Color color;
  final Widget child;
  final String? label;

  const GeneralMonthlySummaryEntry({
    required this.color,
    required this.dateTime,
    required this.child,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateLabel = dateTime.month.getStringForMonth();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RoundedLabel(
              filled: true,
              color: color,
              child: Text(
                dateLabel,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: Dimens.unit2,
            ),
            if (label != null)
              Text(
                label!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: color),
              )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
          child: child,
        )
      ],
    );
  }
}
