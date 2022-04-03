import 'package:flutter/material.dart';
import 'package:mindful/app/assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Image.asset(appLogo),
      ),
    );
  }
}
