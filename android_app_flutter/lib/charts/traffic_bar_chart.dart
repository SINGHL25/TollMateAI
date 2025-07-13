```dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TrafficBarChart extends StatelessWidget {
  final Map<String, double> data;

  TrafficBarChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: (data.values.reduce((a, b) => a > b ? a : b)) + 10,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(showTitles: true, getTitles: (double value) {
            return data.keys.elementAt(value.toInt());
          }),
          leftTitles: SideTitles(showTitles: true),
        ),
        borderData: FlBorderData(show: false),
        barGroups: data.entries.mapIndexed((i, entry) {
          return BarChartGroupData(x: i, barRods: [
            BarChartRodData(y: entry.value, colors: [Colors.blue])
          ]);
        }).toList(),
      ),
    );
  }
}
