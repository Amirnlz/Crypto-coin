import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../../../models/coin/coin_details.dart';
import 'coin_line_chart_data.dart';

class CoinDetailChart extends StatelessWidget {
  const CoinDetailChart({required this.marketData, Key? key}) : super(key: key);
  final MarketData marketData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.47,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LineChart(
          CoinLineChartData(sparkline7D: marketData.sparkline7D).lineChartData,
        ),
      ),
    );
  }
}
