import 'package:flutter/widgets.dart';

extension FocusNodeUtil on FocusNode {
  void toggle() {
    if (hasFocus) {
      unfocus();
    } else {
      requestFocus();
    }
  }
}
