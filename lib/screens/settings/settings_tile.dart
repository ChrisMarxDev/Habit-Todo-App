import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const SettingsTile({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              const Icon(Icons.chevron_right)
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
