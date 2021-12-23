import '../models/coin.dart';
import 'network/coin_api_provider.dart';

class CoinRepository {
  final CoinApiProvider _coinApiProvider = CoinApiProvider();

  Future<List<Coin>> fetchMarketCoins() =>
      _coinApiProvider.fetchMarketCoinList();
}
