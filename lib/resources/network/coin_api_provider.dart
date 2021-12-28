import '../../constant/constans.dart';
import '../../models/coin/coin.dart';
import '../../models/coin/coin_details.dart';
import '../../models/coin/supported_coin.dart';
import 'client.dart';

class CoinApiProvider {
  final Client _clinet = Client();

  Future<List<Coin>> fetchMarketCoinList() async {
    final response = await _clinet.get('/coins/$coinMarketRequiredUrl');
    if (response.statusCode == 200) {
      return coinListFromJson(response.data);
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

  Future<CoinDetails> fetchCoinDetailsById(String id) async {
    final response = await _clinet.get('/coins/$id');
    if (response.statusCode == 200) {
      return coinDetailsFromJson(response.data);
    } else {
      throw Exception('Failed to load coins');
    }
  }

  Future<Coin> fetchCoinById(String id) async {
    try {
      return await searchOnMarketCoinList(id);
    } catch (e) {
      throw Exception('Failed to load coins');
    }
  }

  Future<Coin> searchOnMarketCoinList(String id) async {
    final coinList = await fetchMarketCoinList();
    return coinList.firstWhere((coin) => coin.id == id);
  }
}
