import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/models/weekdays.dart';
import 'package:mindful/util/extensions/text_theme_extension.dart';
import 'package:mindful/widgets/quadratic_selector_button.dart';

class DateSelector extends StatelessWidget {
  final Set<Weekday> active;
  final void Function(Weekday) onSelect;
  final Color color;

  const DateSelector({
    required this.active,
    required this.color,
    required this.onSelect,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${tr('plan_routine_schedule')} ${active.length} ${tr('days')}",
          style: TextStyle(color: context.onPrimary()),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: Weekday.values.map(
            (e) {
              final isActive = active.contains(e);
              return Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: QuadraticSelectorButton(
                    isActive: isActive,
                    width: null,
                    onTap: () => onSelect(e),
                    color: color,
                    child: Text(
                      describeEnum(e).toUpperCase(),
                      style:
                          TextStyle(color: isActive ? color : deactivateGrey),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
