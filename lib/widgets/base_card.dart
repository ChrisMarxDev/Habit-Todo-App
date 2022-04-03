import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final Color? color;
  final List<Color>? gradient;
  final Widget child;

  // final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry innerPadding;
  final bool tapToHideKeyboard;
  final double borderRaidus;

  const BaseCard({
    // this.padding = const EdgeInsets.all(8),
    this.innerPadding = const EdgeInsets.all(8),
    this.color,
    this.gradient,
    required this.child,
    this.borderRaidus = 16,
    this.tapToHideKeyboard = true,
    Key? key,
  })  : assert(
          (color != null) != (gradient != null),
          'Either color or gradient have to be set. Both or none are not accepted.',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: AnimatedContainer(
        padding: innerPadding,
        decoration: BoxDecoration(
          color: color,
          gradient: gradient == null
              ? null
              : LinearGradient(
                  colors: gradient!,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius: BorderRadius.all(Radius.circular(borderRaidus)),
          // boxShadow: [
          // BoxShadow(
          //   color: Colors.black.withOpacity(0.5),
          //   spreadRadius: 10,
          //   blurRadius: 10,
          //   offset: const Offset(2, 2),
          // ),
          // ],
        ),
        duration: const Duration(milliseconds: 360),
        child: child,
      ),
    );
  }
}
