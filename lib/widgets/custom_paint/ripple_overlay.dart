import 'package:flutter/material.dart';
import 'package:mindful/widgets/custom_paint/drag_swipe_listener.dart';

class RippleOverlay extends StatefulWidget {
  final Color color;
  final double borderRadius;
  final Widget child;
  final bool swipeable;
  final void Function()? onCompleteSwipe;

  const RippleOverlay({
    this.color = Colors.white,
    required this.child,
    this.swipeable = true,
    this.borderRadius = 0,
    this.onCompleteSwipe,
    Key? key,
  }) : super(key: key);

  @override
  _RippleOverlayState createState() => _RippleOverlayState();
}

class _RippleOverlayState extends State<RippleOverlay>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> progressAnimation;

  final curve = Curves.easeInOut;
  final duration = const Duration(milliseconds: 360);
  final threshold = 0.51;

  @override
  void didUpdateWidget(covariant RippleOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();

    final progressTween = Tween<double>(begin: 0, end: 1);

    controller = AnimationController(
      value: 0,
      vsync: this,
      duration: duration,
    );

    progressAnimation = progressTween.animate(
      CurvedAnimation(
        parent: controller,
        curve: curve,
      ),
    )..addListener(() {
        setState(() {});

        if (controller.isCompleted) {
          controller.reset();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DragSwipeListener(
      enabled: widget.swipeable,
      onEnd: (isSwiped) {
        if (isSwiped) {
          controller.forward();
          widget.onCompleteSwipe?.call();
        } else {
          controller.reset();
        }
      },
      onProgress: (progress) {
        setState(() {
          controller.value = progress;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: AnimatedBuilder(
          animation: progressAnimation,
          builder: (context, snapshot) {
            return CustomPaint(
              foregroundPainter: RipplePainter(
                color: widget.color,
                borderRadius: widget.borderRadius,
                progress: progressAnimation.value,
                highlight: controller.value > threshold,
              ),
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}

class RipplePainter extends CustomPainter {
  final double progress;
  final Color color;
  final double borderRadius;
  final bool highlight;

  RipplePainter({
    required this.color,
    required this.progress,
    required this.borderRadius,
    this.highlight = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rectPaint = Paint()
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill
      ..color = color.withOpacity(highlight ? 0.1 : 0.05);

    // final borderPaint = Paint()
    //   ..strokeCap = StrokeCap.butt
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 8
    //   ..color = color.withOpacity(highlight ? 0.2 : 0.06);

    final scaledRect = Offset.zero & Size(size.width * progress, size.height);
    final rrect = RRect.fromRectAndRadius(
      scaledRect.inflate(8),
      Radius.circular(borderRadius),
    );

    if (progress > 0) {
      canvas.drawRRect(rrect, rectPaint);
      // ..drawRRect(rrect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
