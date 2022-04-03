import 'package:flutter/material.dart';

class DragSwipeListener extends StatefulWidget {
  final bool enabled;
  final double swipeAcceptThreshold;
  final Widget child;
  final void Function(double) onProgress;
  final void Function(bool) onEnd;

  // final onDragging;
  const DragSwipeListener({
    this.enabled = true,
    required this.onProgress,
    required this.onEnd,
    this.swipeAcceptThreshold = 0.5,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _DragSwipeListenerState createState() => _DragSwipeListenerState();
}

class _DragSwipeListenerState extends State<DragSwipeListener> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    final dragMultiplier = MediaQuery.of(context).size.width / 2.2;

    return GestureDetector(
      onPanUpdate: widget.enabled
          ? (details) {
              progress += details.delta.dx / dragMultiplier;
              widget.onProgress(progress);
            }
          : null,
      onPanEnd: widget.enabled ? (details) => _onEndPan() : null,
      child: widget.child,
    );
  }

  void _onEndPan() {
    if (progress > widget.swipeAcceptThreshold) {
      widget.onEnd(true);
    } else {
      widget.onEnd(false);
    }
    progress = 0;
  }
}
