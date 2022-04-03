import 'package:flutter/material.dart';

class ConditionalWidgetWrapper extends StatelessWidget {
  const ConditionalWidgetWrapper({
    Key? key,
    required this.condition,
    required this.child,
    required this.conditionalBuilder,
  }) : super(key: key);

  final Widget child;
  final bool condition;
  final Widget Function(Widget child) conditionalBuilder;

  @override
  Widget build(BuildContext context) {
    return condition ? conditionalBuilder(child) : child;
  }
}
