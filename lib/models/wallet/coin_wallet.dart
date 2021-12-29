import 'package:crypto_coin/models/coin/coin_details.dart';

class CoinWallet {
  final CoinDetails _coin;
  final double _amount;

  CoinWallet({required final amount, required final coin})
      : assert(amount != null),
        assert(coin != null),
        _coin = coin,
        _amount = amount;

  double get amount => _amount;
  String get name => _coin.name;
  String get symbol => _coin.symbol;
  String get imageUrl => _coin.image.small;
  double get currentPrice => _coin.marketData.currentPrice['usd']! * _amount;
  double get priceChangePercentage24H =>
      _coin.marketData.priceChangePercentage24H;
  double get priceChange24H => _coin.marketData.priceChange24H * _amount;
}
