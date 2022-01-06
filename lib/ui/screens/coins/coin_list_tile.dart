import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../constant/extension/extension.dart';
import '../../../models/coin/coin.dart';
import '../coin-details/coin_detail_screen.dart';

class CoinListTile extends StatelessWidget {
  const CoinListTile({required this.coin, Key? key}) : super(key: key);
  final Coin coin;

  Color get getColor => isOnProfit ? Colors.green : Colors.red;

  bool get isOnProfit => coin.priceChangePercentage24H > 0;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(seconds: 1),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CoinDetailScreen(coinId: coin.id),
          ),
        ),
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
                  coin.priceChange24H.divideWithComma,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 8),
            Text(
              coin.priceChangePercentage24H.toStringAsFixed(2) + '%',
              style: TextStyle(
                color: getColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
