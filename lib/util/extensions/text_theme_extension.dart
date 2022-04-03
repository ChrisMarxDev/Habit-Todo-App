import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }

  ColorScheme colorScheme() {
    return Theme.of(this).colorScheme;
  }

  Color primary() {
    return colorScheme().primary;
  }

  Color onPrimary() {
    return colorScheme().onPrimary;
  }
}

extension StyleExtension on TextStyle? {
  TextStyle? recolor(Color color) {
    return this?.copyWith(color: color);
  }
}
