import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BaseSettingsSubPage extends StatelessWidget {
  final Widget child;
  final String? title;

  const BaseSettingsSubPage({
    required this.title,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title ?? tr('settings_title'),
        ),
      ),
      body: SingleChildScrollView(child: child),
    );
  }
}
