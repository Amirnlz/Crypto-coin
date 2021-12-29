import 'package:crypto_coin/constant/extension/extension.dart';
import 'package:crypto_coin/models/wallet/coin_wallet.dart';
import 'package:flutter/material.dart';

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
    return ListTile(
      leading: leadingImage(),
      title: titleWidget(),
      subtitle: subtitleWidget(),
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
          coinWallet.priceChange24H.toString().getCoinStatusSign +
              '\$' +
              coinWallet.priceChange24H.toStringAsFixed(2).coinWithoutSign(),
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

  Row titleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(coinWallet.name),
        Text(
          '\$' + coinWallet.currentPrice.toString(),
        ),
      ],
    );
  }

  CircleAvatar leadingImage() {
    return CircleAvatar(
      backgroundImage: NetworkImage(coinWallet.imageUrl),
      backgroundColor: Colors.transparent,
    );
  }
}
