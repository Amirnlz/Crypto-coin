import 'package:flutter/material.dart';

import '../../../../../../constant/extension/extension.dart';
import '../../../../../../models/coin/coin_details.dart';
import 'line-chart/coin_detail_chart.dart';

class CoinDetailsStatistics extends StatelessWidget {
  const CoinDetailsStatistics({required this.marketData, Key? key})
      : super(key: key);

  final MarketData marketData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        coinMarketInfo(),
        const SizedBox(height: 30),
        CoinDetailChart(marketData: marketData),
      ],
    );
  }

  Row coinMarketInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        marketBox('Low', marketData.atl['usd']!, false),
        marketBox('High', marketData.ath['usd']!, false),
        marketBox('Vol', marketData.totalVolume['usd']!, true),
      ],
    );
  }

  Column marketBox(String title, double value, bool changeNumberFormat) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        Text(
          changeNumberFormat
              ? '\$' + value.thousandsFormatter
              : '\$' + value.divideWithComma,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
