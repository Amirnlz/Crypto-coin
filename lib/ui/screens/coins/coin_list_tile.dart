import '../../../models/coin.dart';
import 'package:flutter/material.dart';

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
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(coin.image),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(coin.name),
          Text(
            '\$' + coin.currentPrice.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(coin.symbol),
          Text(
            coin.priceChangePercentage24H.toStringAsFixed(2) + '%',
            style: TextStyle(
              color: getColor(),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
