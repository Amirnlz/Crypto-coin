import '../models/coin/coin.dart';
import '../models/coin/coin_details.dart';
import '../models/coin/supported_coin.dart';
import 'network/coin_api_provider.dart';

class CoinRepository {
  final CoinApiProvider _coinApiProvider = CoinApiProvider();

  Future<List<Coin>> get fetchMarketCoin =>
      _coinApiProvider.fetchMarketCoinList();

  Future<List<SupportedCoin>> get fetchSupportedCoin =>
      CoinApiProvider().fetchSupportedCoinList();

  Future<CoinDetails> fetchCoinDetailsById(String id) =>
      _coinApiProvider.fetchCoinDetailsById(id);

  Future<Coin> fetchCoinById(String id) => _coinApiProvider.fetchCoinById(id);
}
