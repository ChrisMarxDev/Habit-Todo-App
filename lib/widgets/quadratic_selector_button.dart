import 'package:flutter/material.dart';
import 'package:mindful/app/themes.dart';

class QuadraticSelectorButton extends StatelessWidget {
  final bool isActive;
  final Color? color;
  final List<Color>? colors;
  final void Function()? onTap;
  final Widget? child;
  final double? width;

  const QuadraticSelectorButton({
    required this.isActive,
    this.child,
    this.color,
    this.colors,
    required this.onTap,
    this.width = Dimens.selectorButtonSize,
    Key? key,
  })  : assert(
          (color != null) != (colors != null),
          'Either color or gradient have to be set. Both or none are not accepted.',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = color != null
        ? (isActive ? Colors.white : color!.withOpacity(0.5))
        : null;
    final gradientColors = colors != null
        ? (isActive ? [Colors.white, Colors.white] : colors)
        : null;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: AspectRatio(
          aspectRatio: 1,
          child: AnimatedContainer(
            decoration: BoxDecoration(
              border: isActive
                  ? null
                  : Border.fromBorderSide(
                      BorderSide(
                        color: const Color(0xFFFFFFFF)
                            .withOpacity(isActive ? 1 : 0.2),
                        width: 2,
                      ),
                    ),
              color: backgroundColor,
              gradient: gradientColors == null
                  ? null
                  : LinearGradient(colors: gradientColors),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            duration: const Duration(milliseconds: 360),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
