import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../../../constant/constans.dart';
import '../../../../../../../constant/extension/extension.dart';
import '../../../../../../../models/coin/coin_details.dart';

class CoinLineChartData {
  final Sparkline7D _sparkline7D;

  CoinLineChartData({required Sparkline7D sparkline7D})
      : _sparkline7D = sparkline7D;

  LineChartData get lineChartData => LineChartData(
        titlesData: _flTitlesData,
        gridData: _flGridData,
        lineTouchData: _flLineTouchData,
        lineBarsData: [
          _lineChartBarData,
        ],
        borderData: _flBorderData,
        minY: _sparkline7D.price.reduce(min),
        maxY: _sparkline7D.price.reduce(max),
        minX: 0,
        maxX: _sparkline7D.price.length - 1,
      );

  FlTitlesData get _flTitlesData => FlTitlesData(
        show: false,
      );

  FlGridData get _flGridData => FlGridData(
        drawVerticalLine: false,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) => FlLine(
          color: Colors.grey[300],
          strokeWidth: 1,
          dashArray: [8, 4],
        ),
      );

  LineChartBarData get _lineChartBarData => LineChartBarData(
        spots: chartDataSpots,
        isCurved: true,
        colors: [
          Colors.black.withOpacity(0.6),
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
          colors: [
            blueColor.withOpacity(0.2),
          ],
        ),
      );

  List<FlSpot> get chartDataSpots => _sparkline7D.price
      .map(
        (e) => FlSpot(
          _sparkline7D.price.indexOf(e).toDouble(),
          e.removeDecimal,
        ),
      )
      .toList();

  FlBorderData get _flBorderData => FlBorderData(
        show: false,
      );

  LineTouchData get _flLineTouchData => LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.grey.withOpacity(0.8),
          tooltipRoundedRadius: 8,
          fitInsideHorizontally: true,
          getTooltipItems: (spots) => spots
              .map(
                (spot) => LineTooltipItem(
                  '\$' + spot.y.toStringAsFixed(2),
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
              .toList(),
        ),
      );
}
