import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/views/reports_page/barGraph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  const MyBarGraph({super.key, required this.monthlyEarning});
  final List <dynamic>monthlyEarning;
  @override
  Widget build(BuildContext context) {
    BarData mybarData = BarData(
        januaryEarning: monthlyEarning[0],
        februaryEarning: monthlyEarning[11],
        marchEarning: monthlyEarning[10],
        aprilEarning: monthlyEarning[9],
        mayEarning: monthlyEarning[8],
        juneEarning: monthlyEarning[7],
        jullietEarning: monthlyEarning[6],
        augestEarning: monthlyEarning[5],
        septemberEarning: monthlyEarning[4],
        octoberEarning: monthlyEarning[3],
        novemberEarning: monthlyEarning[2],
        decemberEarning: monthlyEarning[1]);
    mybarData.initBarData();
    return BarChart(
      BarChartData(
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))),
        maxY: 1200,
        minY: 0,
        barGroups: mybarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(color: Colors.grey[800], 
                  width: 25,
                  borderRadius: BorderRadius.circular(10),
                 // backDrawRodData: BackgroundBarChartRodData(color: Colors.grey[200],show: true,toY: 5000),
                  toY: data.y ),
                ],
              ),
            )
            .toList()));
  }
}
