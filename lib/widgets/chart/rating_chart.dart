import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/screens/routine_summary/models/summary_day_item.dart';
import 'package:quiver/iterables.dart';

List<FlSpot> daysToFlData(
  List<SummaryDayItem> days, {
  bool removeEmpty = false,
}) {
  final mappedData = enumerate(days).map(
    (indexedDay) {
      final input = indexedDay.value.input;

      return FlSpot(
        indexedDay.index.toDouble() + 1,
        input == null
            ? (removeEmpty ? -1 : 0)
            : input.map(
                checkBox: (value) => value.checked ? 1 : 0,
                rating: (rating) => rating.rating ?? (removeEmpty ? -1 : 0),
                textList: (textList) => 0,
                text: (text) => (text.text?.isEmpty ?? true) ? 0 : 1,
              ),
      );
    },
  );
  if (removeEmpty) {
    return mappedData.where((spot) => spot.y != -1).toList();
  } else {
    return mappedData.toList();
  }
}

class RatingChart extends StatefulWidget {
  final List<FlSpot> data;
  final List<Color> colors;

  const RatingChart({required this.data, required this.colors, Key? key})
      : super(key: key);

  @override
  _RatingChartState createState() => _RatingChartState();
}

class _RatingChartState extends State<RatingChart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.60,
          child: LineChart(
            mainData(),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 2,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            dashArray: [4, 2],
            color: weakGrey,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            dashArray: [4, 2],
            color: weakGrey,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: chartGrey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            return (value.toInt() - 1) % 7 == 0 ? '${value.toInt()}.' : '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: chartGrey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            if (value == 0) return '';
            // ignore: use_is_even_rather_than_modulo
            return value.toInt() % 2 == 0 ? '${value.toInt()}' : '';
          },
          reservedSize: 18,
          margin: 4,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          left: BorderSide(
            color: Color(0xff37434d),
            width: 2,
          ),
          bottom: BorderSide(),
        ),
      ),
      minX: 1,
      // maxX: widget.data.length.toDouble(),
      maxX: 31,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: widget.data,
          isCurved: true,
          colors: widget.colors,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                widget.colors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
