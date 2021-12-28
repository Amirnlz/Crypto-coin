import 'dart:convert';

List<Coin> coinListFromJson(List<dynamic> data) =>
    List<Coin>.from(data.map((x) => Coin.fromJson(x)));

Coin coinFromJson(Map<String, dynamic> data) => Coin.fromJson(data);

String coinToJson(List<Coin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coin {
  Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.roi,
    required this.lastUpdated,
    required this.sparklineIn7D,
    required this.priceChangePercentage1YInCurrency,
  });

  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final int marketCap;
  final int marketCapRank;
  final int fullyDilutedValuation;
  final double totalVolume;
  final double high24H;
  final double low24H;
  final double priceChange24H;
  final double priceChangePercentage24H;
  final double marketCapChange24H;
  final double marketCapChangePercentage24H;
  final double circulatingSupply;
  final double totalSupply;
  final double maxSupply;
  final double ath;
  final double athChangePercentage;
  final DateTime athDate;
  final double atl;
  final double atlChangePercentage;
  final DateTime atlDate;
  final Roi roi;
  final DateTime lastUpdated;
  final SparklineIn7D sparklineIn7D;
  final double priceChangePercentage1YInCurrency;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
        image: json['image'],
        currentPrice: json['current_price'].toDouble(),
        marketCap: json['market_cap'],
        marketCapRank: json['market_cap_rank'],
        fullyDilutedValuation: json['fully_diluted_valuation'] ?? 0,
        totalVolume: json['total_volume'].toDouble(),
        high24H: json['high_24h'].toDouble(),
        low24H: json['low_24h'].toDouble(),
        priceChange24H: json['price_change_24h'].toDouble(),
        priceChangePercentage24H:
            json['price_change_percentage_24h'].toDouble(),
        marketCapChange24H: json['market_cap_change_24h'].toDouble(),
        marketCapChangePercentage24H:
            json['market_cap_change_percentage_24h'].toDouble(),
        circulatingSupply: json['circulating_supply'].toDouble(),
        totalSupply: json['total_supply'] == null
            ? 0.0
            : json['total_supply'].toDouble(),
        maxSupply:
            json['max_supply'] == null ? 0.0 : json['max_supply'].toDouble(),
        ath: json['ath'].toDouble(),
        athChangePercentage: json['ath_change_percentage'].toDouble(),
        athDate: DateTime.parse(json['ath_date']),
        atl: json['atl'].toDouble(),
        atlChangePercentage: json['atl_change_percentage'].toDouble(),
        atlDate: DateTime.parse(json['atl_date']),
        roi: json['roi'] == null
            ? Roi(times: 0.0, currency: Currency.USD, percentage: 0.0)
            : Roi.fromJson(json['roi']),
        lastUpdated: DateTime.parse(json['last_updated']),
        sparklineIn7D: SparklineIn7D.fromJson(json['sparkline_in_7d']),
        priceChangePercentage1YInCurrency:
            json['price_change_percentage_1y_in_currency'] == null
                ? 0.0
                : json['price_change_percentage_1y_in_currency'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'symbol': symbol,
        'name': name,
        'image': image,
        'current_price': currentPrice,
        'market_cap': marketCap,
        'market_cap_rank': marketCapRank,
        'fully_diluted_valuation': fullyDilutedValuation,
        'total_volume': totalVolume,
        'high_24h': high24H,
        'low_24h': low24H,
        'price_change_24h': priceChange24H,
        'price_change_percentage_24h': priceChangePercentage24H,
        'market_cap_change_24h': marketCapChange24H,
        'market_cap_change_percentage_24h': marketCapChangePercentage24H,
        'circulating_supply': circulatingSupply,
        'total_supply': totalSupply,
        'max_supply': maxSupply,
        'ath': ath,
        'ath_change_percentage': athChangePercentage,
        'ath_date': athDate.toIso8601String(),
        'atl': atl,
        'atl_change_percentage': atlChangePercentage,
        'atl_date': atlDate.toIso8601String(),
        'roi': roi.toJson(),
        'last_updated': lastUpdated.toIso8601String(),
        'sparkline_in_7d': sparklineIn7D.toJson(),
        'price_change_percentage_1y_in_currency':
            priceChangePercentage1YInCurrency,
      };
}

class Roi {
  Roi({
    required this.times,
    required this.currency,
    required this.percentage,
  });

  final double times;
  final Currency? currency;
  final double percentage;

  factory Roi.fromJson(Map<String, dynamic> json) => Roi(
        times: json['times'].toDouble(),
        currency: currencyValues.map[json['currency']],
        percentage: json['percentage'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'times': times,
        'currency': currencyValues.reverse[currency],
        'percentage': percentage,
      };
}

enum Currency { BTC, USD, ETH }

final currencyValues =
    EnumValues({'btc': Currency.BTC, 'eth': Currency.ETH, 'usd': Currency.USD});

class SparklineIn7D {
  SparklineIn7D({
    required this.price,
  });

  final List<double> price;

  factory SparklineIn7D.fromJson(Map<String, dynamic> json) => SparklineIn7D(
        price: List<double>.from(json['price'].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        'price': List<dynamic>.from(price.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    map.values.toSet().forEach((y) {
      reverseMap[y] = map.keys.where((x) => map[x] == y).toSet() as String;
    });
    return reverseMap;
  }
}
