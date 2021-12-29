import 'package:animate_do/animate_do.dart';
import 'package:crypto_coin/constant/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../models/coin/coin.dart';

class CoinListTile extends StatelessWidget {
  const CoinListTile({required this.coin, Key? key}) : super(key: key);
  final Coin coin;

  Color getColor() {
    return isOnProfit() ? Colors.green : Colors.red;
  }

  bool isOnProfit() {
    return coin.priceChangePercentage24H > 0;
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(seconds: 1),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ListTile(
          leading: leadingWidget(),
          title: titleWidget(),
          subtitle: subtitleWidget(),
        ),
      ),
    );
  }

  CircleAvatar leadingWidget() {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: NetworkImage(coin.image),
    );
  }

  Row titleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(coin.name),
        Text(
          '\$' + coin.currentPrice.divideWithComma,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Row subtitleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(coin.symbol.toUpperCase()),
        Row(
          children: [
            Text(
              coin.priceChange24H.getCoinStatusSign +
                  '\$' +
                  coin.priceChange24H.divideWithComma.coinWithoutSign,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 8),
            Text(
              coin.priceChangePercentage24H.toStringAsFixed(2) + '%',
              style: TextStyle(
                color: getColor(),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
