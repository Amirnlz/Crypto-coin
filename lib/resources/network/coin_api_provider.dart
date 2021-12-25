import 'package:crypto_coin/models/supported_coin.dart';

import '../../constant/constans.dart';
import '../../models/coin.dart';
import 'client.dart';

class CoinApiProvider {
  final Client _clinet = Client();

  Future<List<Coin>> fetchMarketCoinList() async {
    final response = await _clinet.get('/coins/$coinMarketRequiredUrl');
    if (response.statusCode == 200) {
      return coinFromJson(response.data);
    } else {
      throw Exception('Failed to load coins');
    }
  }

  Future<List<SupportedCoin>> fetchSupportedCoinList() async {
    final response = await _clinet.get('/coins/list');
    if (response.statusCode == 200) {
      return supportedCoinFromJson(response.data);
    } else {
      throw Exception('Failed to load coins');
    }
  }
}
