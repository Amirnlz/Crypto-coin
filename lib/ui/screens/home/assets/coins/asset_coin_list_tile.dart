import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/extension/extension.dart';
import '../../../../../models/wallet/coin_wallet.dart';
import '../../../coin-details/coin_detail_screen.dart';

class AssetCoinListTile extends StatelessWidget {
  const AssetCoinListTile({required this.coinWallet, Key? key})
      : super(key: key);
  final CoinWallet coinWallet;

  Color getColor() {
    return isOnProfit() ? Colors.green : Colors.red;
  }

  bool isOnProfit() {
    return coinWallet.priceChangePercentage24H > 0;
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(seconds: 1),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CoinDetailScreen(coinId: coinWallet.id),
          ),
        ),
        child: ListTile(
          leading: leadingImage(),
          title: titleWidget(),
          subtitle: subtitleWidget(),
        ),
      ),
    );
  }

  CircleAvatar leadingImage() {
    return CircleAvatar(
      backgroundImage: NetworkImage(coinWallet.imageUrl),
      backgroundColor: Colors.transparent,
    );
  }

  Row titleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(coinWallet.name),
        Text(
          '\$' + coinWallet.currentPrice.divideWithComma,
        ),
      ],
    );
  }

  Row subtitleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${coinWallet.amount.toString()} ${coinWallet.symbol.toUpperCase()}',
        ),
        coinChangesInfo()
      ],
    );
  }

  Row coinChangesInfo() {
    return Row(
      children: [
        Text(
          coinWallet.priceChange24H.getCoinStatusSign +
              '\$' +
              coinWallet.priceChange24H.divideWithComma,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          coinWallet.priceChangePercentage24H.toStringAsFixed(2) + '%',
          style: TextStyle(
            color: getColor(),
          ),
        ),
      ],
    );
  }
}
