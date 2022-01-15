import 'package:flutter/material.dart';

import '../../../../../constant/extension/extension.dart';
import '../../../../../models/coin/coin_details.dart';
import '../../../../widget/market_box.dart';

class MarketInfo extends StatelessWidget {
  const MarketInfo({required this.marketData, Key? key}) : super(key: key);
  final MarketData marketData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        allTimeHigh(),
        horizontalLine(size),
        allTimeLow(),
        horizontalLine(size),
        supplymentInfo(),
      ],
    );
  }

  Column allTimeHigh() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'All Time High',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        allTimeWidget(
          marketData.ath['usd']!,
          marketData.athChangePercentage['usd']!,
          marketData.athDate['usd']!,
        ),
      ],
    );
  }

  Column allTimeLow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'All Time Low',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        allTimeWidget(
          marketData.atl['usd']!,
          marketData.atlChangePercentage['usd']!,
          marketData.atlDate['usd']!,
        ),
      ],
    );
  }

  Row allTimeWidget(double price, double percent, DateTime date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MarketBox(
          title: 'Price',
          subtitle: '\$${price.divideWithComma}',
          subTitleFontSize: 15,
        ),
        MarketBox(
          title: 'Change',
          subtitle: '${percent.toStringAsFixed(2)}%',
          subTitleFontSize: 15,
        ),
        MarketBox(
          title: 'Date',
          subtitle: '${date.year}.${date.month}.${date.day}',
          subTitleFontSize: 15,
        ),
      ],
    );
  }

  SizedBox horizontalLine(Size size) {
    return SizedBox(
      height: size.height * 0.05,
      width: size.width * 0.9,
      child: Divider(
        color: Colors.grey[200],
        thickness: 1,
      ),
    );
  }

  Column supplymentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Supplyment Info',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        supplymentInfoItems(),
      ],
    );
  }

  Row supplymentInfoItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MarketBox(
          title: 'Total supply',
          subtitle: marketData.totalSupply.thousandsFormatter,
        ),
        MarketBox(
          title: 'Max supply',
          subtitle: marketData.maxSupply.thousandsFormatter,
        ),
        MarketBox(
          title: 'Circulating supply',
          subtitle: marketData.circulatingSupply.thousandsFormatter,
        ),
      ],
    );
  }
}
