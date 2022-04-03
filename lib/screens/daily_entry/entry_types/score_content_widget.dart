import 'package:flutter/material.dart';
import 'package:mindful/models/daily/daily_input_element.dart';
import 'package:mindful/widgets/score_slider.dart';

class ScoreContentWidget extends StatelessWidget {
  final RatingEntry entry;
  final Color color;
  final void Function(double)? onRate;

  const ScoreContentWidget({
    required this.entry,
    required this.color,
    required this.onRate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const mojiStyl = TextStyle(fontSize: 24);
    return Row(
      children: [
        const Text(
          '👎',
          style: mojiStyl,
        ),
        Flexible(
          fit: FlexFit.tight,
          child: ScoreSlider(
            onChanged: onRate,
            color: color,
            isChecked: entry.rating != null,
            value: entry.rating ?? 5,
          ),
        ),
        const Text(
          '👍',
          style: mojiStyl,
        ),
      ],
    );
  }
}
