import 'package:flutter/material.dart';

class ScoreSlider extends StatefulWidget {
  final double value;
  final double max;
  final ValueChanged<double>? onChanged;
  final Color color;
  final bool isChecked;

  const ScoreSlider({
    required this.value,
    this.max = 10,
    this.color = Colors.black,
    required this.onChanged,
    this.isChecked = false,
    Key? key,
  }) : super(key: key);

  @override
  State<ScoreSlider> createState() => _ScoreSliderState();
}

class _ScoreSliderState extends State<ScoreSlider> {
  late double value;

  @override
  void didUpdateWidget(covariant ScoreSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      setState(() {
        value = widget.value;
      });
    }
  }

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        sliderTheme: SliderThemeData(
          // trackHeight: null,
          activeTrackColor: Colors.white,
          inactiveTrackColor: Colors.white.withOpacity(0.4),
          overlayColor: Colors.white,
          overlayShape: const CustomSliderOverlayCircle(),
          // tickMarkShape: null,
          thumbShape: CustomSliderThumbCircle(
            color: widget.color,
            checked: widget.isChecked,
          ),
          // valueIndicatorShape: null,
          // rangeTickMarkShape: null,
          // rangeThumbShape: null,
          // rangeTrackShape: null,
          // rangeValueIndicatorShape: null,
          // showValueIndicator: null,
          // valueIndicatorTextStyle: null,
          // minThumbSeparation: null,
          // thumbSelector: null,
        ),
      ),
      child: Slider(
        max: widget.max,
        value: value,
        onChanged: (val) {
          setState(() {
            value = val;
          });
        },
        onChangeEnd: widget.onChanged,
      ),
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  static const thumbRadius = 14.0;

  final int min;
  final int max;
  final Color color;
  final bool checked;

  const CustomSliderThumbCircle({
    required this.color,
    this.min = 0,
    this.max = 10,
    this.checked = false,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(thumbRadius);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final circleBackgroundPaint = Paint()
      ..color = color //Thumb Background Color
      ..style = PaintingStyle.fill;
    final checkedPaint = Paint()
      ..color = Colors.white //Thumb Background Color
      ..style = PaintingStyle.fill;

    final circleOutlinePaint = Paint()
      ..color = Colors.white //Thumb Background Color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // TextSpan span = new TextSpan(
    //   style: new TextStyle(
    //     fontSize: thumbRadius * .8,
    //     fontWeight: FontWeight.w700,
    //     color: sliderTheme.thumbColor, //Text Color of Value on Thumb
    //   ),
    //   text: getValue(value),
    // );
    //
    // TextPainter tp = new TextPainter(
    //     text: span,
    //     textAlign: TextAlign.center,
    //     textDirection: TextDirection.ltr);
    // tp.layout();
    // Offset textCenter =
    //     Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius, circleBackgroundPaint);
    // ignore: cascade_invocations
    if (checked) canvas.drawCircle(center, thumbRadius / 2, checkedPaint);
    // ignore: cascade_invocations
    canvas.drawCircle(center, thumbRadius, circleOutlinePaint);
    // tp.paint(canvas, textCenter);
  }
}

class CustomSliderOverlayCircle extends SliderComponentShape {
  static const thumbRadius = 20.0;

  const CustomSliderOverlayCircle();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final circleBackgroundPaint = Paint()
      ..color = Colors.white.withOpacity(0.4) //Thumb Background Color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, circleBackgroundPaint);
  }
}
