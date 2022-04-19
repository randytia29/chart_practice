import 'package:chart_practice/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    Key? key,
    required this.barWidth,
  }) : super(key: key);

  final double barWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: BarChart(
        BarChartData(
            alignment: BarChartAlignment.center,
            maxY: 20,
            minY: -20,
            groupsSpace: 12,
            barTouchData: BarTouchData(enabled: true),
            titlesData: FlTitlesData(
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, titleMeta) {
                      return Text(
                        BarData.barData
                            .firstWhere(
                                (element) => element.id == value.toInt())
                            .name,
                        style: const TextStyle(fontSize: 10),
                      );
                    },
                    reservedSize: 15),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, titleMeta) {
                      return Text(
                        BarData.barData
                            .firstWhere(
                                (element) => element.id == value.toInt())
                            .name,
                        style: const TextStyle(fontSize: 10),
                      );
                    },
                    reservedSize: 15),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, titleMeta) {
                    return Text(
                      value == 0.0 ? '' : '${value.toInt()}k',
                      style: const TextStyle(fontSize: 10),
                    );
                  },
                  interval: BarData.interval.toDouble(),
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, titleMeta) {
                    return Text(
                      value == 0.0 ? '' : '${value.toInt()}k',
                      style: const TextStyle(fontSize: 10),
                    );
                  },
                  interval: BarData.interval.toDouble(),
                ),
              ),
            ),
            gridData: FlGridData(checkToShowHorizontalLine: (value) {
              return value % BarData.interval == 0;
            }, getDrawingHorizontalLine: (value) {
              if (value == 0.0) {
                return FlLine(color: const Color(0xFF363753), strokeWidth: 3);
              } else {
                return FlLine(color: const Color(0xFF2A2747), strokeWidth: 0.8);
              }
            }),
            barGroups: BarData.barData
                .map((e) => BarChartGroupData(x: e.id, barRods: [
                      BarChartRodData(
                        toY: e.y,
                        width: barWidth,
                        color: e.color,
                        borderRadius: e.y > 0
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6))
                            : const BorderRadius.only(
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6)),
                      ),
                    ]))
                .toList()),
      ),
    );
  }
}
