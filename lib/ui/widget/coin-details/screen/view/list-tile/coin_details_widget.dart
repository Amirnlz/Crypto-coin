import 'package:flutter/material.dart';

import '../../../../../../models/coin/coin_details.dart';
import 'coin_details_list_tile.dart';

class CoinDetailsWidget extends StatelessWidget {
  const CoinDetailsWidget({required this.coinDetails, Key? key})
      : super(key: key);

  final CoinDetails coinDetails;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        constraints: BoxConstraints(
          minHeight: size.height,
          maxWidth: size.width,
        ),
        child: Column(
          children: [
            CoinDetailsListTile(
              imageUrl: coinDetails.image.large,
              name: coinDetails.name,
              symbol: coinDetails.symbol,
              price: coinDetails.marketData.currentPrice['usd']!,
              percentChange: coinDetails.marketData.priceChangePercentage24H,
            ),
            horizontalLine(size)
          ],
        ),
      ),
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
}
