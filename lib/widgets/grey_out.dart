import 'package:flutter/material.dart';

class GreyOut extends StatelessWidget {
  final bool isActive;
  final Widget child;

  const GreyOut({
    required this.isActive,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(
        begin: isActive ? Colors.white : Colors.grey,
        end: isActive ? Colors.white : Colors.grey,
      ),
      duration: const Duration(milliseconds: 360),
      child: child,
      builder: (context, filterColor, child) {
        return ColorFiltered(
          colorFilter: ColorFilter.mode(filterColor!, BlendMode.modulate),
          child: child,
        );
      },
    );
  }
}
