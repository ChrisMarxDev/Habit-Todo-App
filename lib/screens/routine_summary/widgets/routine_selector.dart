import 'package:flutter/material.dart';

class RoutineSelector extends StatefulWidget {
  final String title;
  final String emoji;
  final Color color;
  final void Function()? forward;
  final void Function()? backward;

  const RoutineSelector({
    required this.title,
    required this.emoji,
    required this.color,
    required this.forward,
    required this.backward,
    Key? key,
  }) : super(key: key);

  @override
  State<RoutineSelector> createState() => _RoutineSelectorState();
}

class _RoutineSelectorState extends State<RoutineSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextButton(
            onPressed: widget.backward,
            child: Icon(
              Icons.chevron_left,
              color: widget.color,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            '${widget.emoji} ${widget.title}',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: widget.color),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: widget.forward,
            child: Icon(
              Icons.chevron_right,
              color: widget.color,
            ),
          ),
        ),
      ],
    );
  }
}
