import 'package:flutter/material.dart';

const _radius = 48.0;

class RoundedLabel extends StatelessWidget {
  final bool filled;
  final Color color;
  final Widget child;

  const RoundedLabel({
    this.filled = false,
    required this.color,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: filled ? color : Colors.transparent,
        border: filled
            ? null
            : Border.fromBorderSide(
                BorderSide(color: color, width: 2),
              ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(_radius),
          bottomRight: Radius.circular(_radius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}
