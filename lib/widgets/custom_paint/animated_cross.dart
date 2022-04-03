import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class AnimatedCross extends StatefulWidget {
  final bool value;
  final void Function(bool)? onCheck;
  final Color color;
  final double strokeWidth;

  const AnimatedCross({
    required this.color,
    required this.value,
    required this.onCheck,
    this.strokeWidth = 8,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedCrossState createState() => _AnimatedCrossState();
}

class _AnimatedCrossState extends State<AnimatedCross>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> progressAnimation;

  @override
  void didUpdateWidget(covariant AnimatedCross oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      widget.value ? controller.forward() : controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();

    final progressTween = Tween<double>(begin: 0, end: 1);

    controller = AnimationController(
      value: widget.value ? 1 : 0,
      vsync: this,
      duration: const Duration(milliseconds: 360),
    );

    progressAnimation = progressTween.animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onCheck?.call(!widget.value),
      child: AspectRatio(
        aspectRatio: 1,
        child: AnimatedBuilder(
          animation: progressAnimation,
          builder: (context, snapshot) {
            return CustomPaint(
              painter: CrossPainter(
                color: widget.color,
                strokeWidth: widget.strokeWidth,
                progress: progressAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CrossPainter extends CustomPainter {
  final double progress;
  final bool showBox;
  final Color color;
  final Color backgroundColor;
  final double strokeWidth;

  CrossPainter({
    required this.color,
    this.backgroundColor = Colors.white,
    required this.strokeWidth,
    required this.progress,
    this.showBox = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(16));

    final crossPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = strokeWidth;

    final width = size.width;
    final height = size.height;

    final boxPaint = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill
      ..strokeWidth = 8;
    canvas.drawRRect(rrect, boxPaint);

    if (showBox) {
      final boxPaint = Paint()
        ..color = Colors.black
        ..strokeCap = StrokeCap.butt
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8;
      canvas.drawRRect(rrect, boxPaint);
    }

    var firstLinePercentage = progress / 0.5;

    if (firstLinePercentage > 1) {
      firstLinePercentage = 1;
    } else if (firstLinePercentage < 0) {
      firstLinePercentage = 0;
    }
    canvas.drawLine(
      Offset(0, height),
      Offset(
        width * firstLinePercentage,
        height - (height * firstLinePercentage),
      ),
      crossPaint,
    );

    var secondLineProgress = (progress - 0.5) / 0.5;
    if (secondLineProgress > 1) {
      secondLineProgress = 1;
    } else if (secondLineProgress < 0) {
      secondLineProgress = 0;
    }
    if (secondLineProgress > 0) {
      canvas.drawLine(
        Offset.zero,
        Offset(width * secondLineProgress, height * secondLineProgress),
        crossPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AnimatedClippedCross extends StatefulWidget {
  final bool value;
  final void Function(bool)? onCheck;
  final double strokeWidth;

  const AnimatedClippedCross({
    required this.value,
    required this.onCheck,
    this.strokeWidth = 8,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedClippedCrossState createState() => _AnimatedClippedCrossState();
}

class _AnimatedClippedCrossState extends State<AnimatedClippedCross>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> progressAnimation;

  @override
  void didUpdateWidget(covariant AnimatedClippedCross oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      widget.value ? controller.forward() : controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();

    final progressTween = Tween<double>(begin: 0, end: 1);

    controller = AnimationController(
      value: widget.value ? 1 : 0,
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    progressAnimation = progressTween.animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onCheck?.call(!widget.value),
      child: SizedBox(
        child: AnimatedBuilder(
          animation: progressAnimation,
          builder: (context, snapshot) {
            return ClipPath(
              clipper: CrossClipper(
                strokeWidth: widget.strokeWidth,
                progress: progressAnimation.value,
              ),
              child: Container(
                width: 50,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CrossClipper extends CustomClipper<Path> {
  final double progress;
  final double strokeWidth;

  CrossClipper({
    required this.strokeWidth,
    required this.progress,
  });

  @override
  Path getClip(Size size) {
    final path = Path()..fillType = PathFillType.nonZero;
    final sizeRect = Offset.zero & size;

    // path.to
    final width = size.width;
    final height = size.height;
    final side = min(width, height);

    final sideLength = sqrt(2 * side * side) * progress;

    final rect1 = Rect.fromCenter(
      center: sizeRect.center,
      width: sideLength,
      height: strokeWidth,
    );
    final rect2 = Rect.fromCenter(
      center: sizeRect.center,
      width: strokeWidth,
      height: sideLength,
    );

    var firstLinePercentage = progress / 0.5;

    if (firstLinePercentage > 1) {
      firstLinePercentage = 1;
    } else if (firstLinePercentage < 0) {
      firstLinePercentage = 0;
    }

    // canvas.drawLine(
    //   Offset(0, height),
    //   Offset(
    //     width * firstLinePercentage,
    //     height - (height * firstLinePercentage),
    //   ),
    //   crossPaint,
    // );
    //
    // var secondLineProgress = (progress - 0.5) / 0.5;
    // if (secondLineProgress > 1) {
    //   secondLineProgress = 1;
    // } else if (secondLineProgress < 0) {
    //   secondLineProgress = 0;
    // }
    // if (secondLineProgress > 0) {
    //   canvas.drawLine(
    //     Offset.zero,
    //     Offset(width * secondLineProgress, height * secondLineProgress),
    //     crossPaint,
    //   );
    // }
    // path.

    path
      ..addRect(rect1)
      ..addRect(rect2);
    // ..addRect(middleRect);

    final transform = Matrix4Transform()
        .rotateDegrees(45, origin: Offset(width / 2, height / 2))
        .matrix4;

    final rotatePath = path.transform(transform.storage);
    final borderSquare = Rect.fromCenter(
      center: sizeRect.center,
      width: side,
      height: side,
    );
    final borderRect =
        RRect.fromRectAndRadius(borderSquare, const Radius.circular(16));

    final canvasPath = Path()..addRRect(borderRect);

    return Path.combine(PathOperation.difference, canvasPath, rotatePath);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return progress != (oldClipper as CrossClipper).progress;
  }
}
