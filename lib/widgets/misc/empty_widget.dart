import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '📭',
            style: TextStyle(fontSize: 42),
          ),
          Text(tr('no_entries_here')),
        ],
      ),
    );
  }
}
