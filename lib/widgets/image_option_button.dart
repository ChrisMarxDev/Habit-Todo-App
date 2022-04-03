import 'package:flutter/material.dart';

class IconImageOptionButton extends StatelessWidget {
  final IconData iconData;
  final void Function() onPressed;
  final String description;

  const IconImageOptionButton({
    required this.iconData,
    required this.onPressed,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageOptionButton(
      onPressed: onPressed,
      description: description,
      child: Icon(
        iconData,
        color: Theme.of(context).disabledColor,
        size: 32,
      ),
    );
  }
}

class ImageOptionButton extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;
  final String description;

  const ImageOptionButton({
    required this.child,
    required this.onPressed,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: Theme.of(context).disabledColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              child,
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
