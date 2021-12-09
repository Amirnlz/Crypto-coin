import 'package:crypto_coin/helpers/constans.dart';
import 'package:crypto_coin/model/coin.dart';
import 'package:crypto_coin/service/network_services.dart';

class CoinServices {
  final NetworkServices _networkServices = NetworkServices();

  Future<List<Coin>> getCoinsList() async {
    List<Coin> coins = [];
    try {
      var response =
          await _networkServices.getResponse(baseurl + coinsMarketUrl);
      if (response.statusCode == 200) {
        coins = coinFromJson(response.data);
        return coins;
      }
    } catch (e) {
      print(e);
    }
    return coins;
  }
}
