import 'package:flutter/material.dart';

class BaseLegalScreen extends StatelessWidget {
  final String title;
  final String body;

  const BaseLegalScreen({required this.title, required this.body, Key? key})
      : super(key: key);

  static PageRoute route(String title, String body) {
    return MaterialPageRoute<void>(
      builder: (context) => BaseLegalScreen(title: title, body: body),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
            child: Text(title, style: Theme.of(context).textTheme.headline1),
          ),
          Text(body, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
