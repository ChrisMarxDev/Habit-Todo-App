import 'package:flutter/material.dart';

class BaseDailyEntryWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final String description;

  const BaseDailyEntryWidget({
    required this.title,
    required this.description,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: child,
      ),
    );
  }
}
