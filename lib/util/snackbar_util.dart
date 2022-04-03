import 'package:flutter/material.dart';

void showSnackBarText(BuildContext context, String text, {Color? color}) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: color,
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
