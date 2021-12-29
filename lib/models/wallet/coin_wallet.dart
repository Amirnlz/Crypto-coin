import '../coin/coin.dart';

class CoinWallet {
  final Coin _coin;
  double _amount;

  CoinWallet({required final amount, required final coin})
      : assert(amount != null),
        assert(coin != null),
        _coin = coin,
        _amount = amount;

  double get amount => _amount;
  String get name => _coin.name;
  String get id => _coin.id;
  String get symbol => _coin.symbol;
  String get imageUrl => _coin.image;
  double get currentPrice => _coin.currentPrice * _amount;
  double get priceChangePercentage24H => _coin.priceChangePercentage24H;
  double get priceChange24H => _coin.priceChange24H * _amount;

  void sumWithAmount(double amount) {
    _amount += amount;
  }
}
