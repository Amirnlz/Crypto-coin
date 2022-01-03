// To parse this JSON data, do
//
//     final coinDeatails = coinDeatailsFromJson(jsonString);

import 'dart:convert';

CoinDetails coinDetailsFromJson(dynamic jsonData) =>
    CoinDetails.fromJson(jsonData);

String coinDetailsToJson(CoinDetails data) => json.encode(data.toJson());

class CoinDetails {
  CoinDetails({
    required this.id,
    required this.symbol,
    required this.name,
    required this.hashingAlgorithm,
    required this.categories,
    required this.localization,
    required this.description,
    required this.links,
    required this.image,
    required this.countryOrigin,
    required this.genesisDate,
    required this.sentimentVotesUpPercentage,
    required this.sentimentVotesDownPercentage,
    required this.marketCapRank,
    required this.coingeckoRank,
    required this.coingeckoScore,
    required this.developerScore,
    required this.communityScore,
    required this.liquidityScore,
    required this.publicInterestScore,
    required this.marketData,
    required this.lastUpdated,
  });

  final String id;
  final String symbol;
  final String name;
  final String hashingAlgorithm;
  final List<String> categories;
  final Languages localization;
  final Languages description;
  final Links links;
  final Image image;
  final String countryOrigin;
  final DateTime genesisDate;
  final double sentimentVotesUpPercentage;
  final double sentimentVotesDownPercentage;
  final int marketCapRank;
  final int coingeckoRank;
  final double coingeckoScore;
  final double developerScore;
  final double communityScore;
  final double liquidityScore;
  final double publicInterestScore;
  final MarketData marketData;
  final DateTime lastUpdated;

  factory CoinDetails.fromJson(Map<String, dynamic> json) => CoinDetails(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
        hashingAlgorithm: json['hashing_algorithm'] ?? 'Unkown',
        categories: List<String>.from(json['categories'].map((x) => x ?? '')),
        localization: Languages.fromJson(json['localization']),
        description: Languages.fromJson(json['description']),
        links: Links.fromJson(json['links']),
        image: Image.fromJson(json['image']),
        countryOrigin: json['country_origin'] ?? 'Unkown',
        genesisDate: json['genesis_date'] == null
            ? DateTime.now()
            : DateTime.parse(json['genesis_date']),
        sentimentVotesUpPercentage:
            json['sentiment_votes_up_percentage'].toDouble() ?? 0,
        sentimentVotesDownPercentage:
            json['sentiment_votes_down_percentage'].toDouble() ?? 0,
        marketCapRank: json['market_cap_rank'],
        coingeckoRank: json['coingecko_rank'],
        coingeckoScore: json['coingecko_score'].toDouble() ?? 0,
        developerScore: json['developer_score'].toDouble() ?? 0,
        communityScore: json['community_score'].toDouble() ?? 0,
        liquidityScore: json['liquidity_score'].toDouble() ?? 0,
        publicInterestScore: json['public_interest_score'].toDouble() ?? 0,
        marketData: MarketData.fromJson(json['market_data']),
        lastUpdated: DateTime.parse(json['last_updated']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'symbol': symbol,
        'name': name,
        'hashing_algorithm': hashingAlgorithm,
        'categories': List<dynamic>.from(categories.map((x) => x)),
        'localization': localization.toJson(),
        'description': description.toJson(),
        'links': links.toJson(),
        'image': image.toJson(),
        'country_origin': countryOrigin,
        'genesis_date':
            '${genesisDate.year.toString().padLeft(4, '0')}-${genesisDate.month.toString().padLeft(2, '0')}-${genesisDate.day.toString().padLeft(2, '0')}',
        'sentiment_votes_up_percentage': sentimentVotesUpPercentage,
        'sentiment_votes_down_percentage': sentimentVotesDownPercentage,
        'market_cap_rank': marketCapRank,
        'coingecko_rank': coingeckoRank,
        'coingecko_score': coingeckoScore,
        'developer_score': developerScore,
        'community_score': communityScore,
        'liquidity_score': liquidityScore,
        'public_interest_score': publicInterestScore,
        'market_data': marketData.toJson(),
        'last_updated': lastUpdated.toIso8601String(),
      };
}

class Languages {
  Languages({
    required this.en,
    required this.de,
    required this.es,
    required this.fr,
    required this.it,
    required this.pl,
    required this.ro,
    required this.hu,
    required this.nl,
    required this.pt,
    required this.sv,
    required this.vi,
    required this.tr,
    required this.ru,
    required this.ja,
    required this.zh,
    required this.zhTw,
    required this.ko,
    required this.ar,
    required this.th,
    required this.id,
  });

  final String en;
  final String de;
  final String es;
  final String fr;
  final String it;
  final String pl;
  final String ro;
  final String hu;
  final String nl;
  final String pt;
  final String sv;
  final String vi;
  final String tr;
  final String ru;
  final String ja;
  final String zh;
  final String zhTw;
  final String ko;
  final String ar;
  final String th;
  final String id;

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        en: json['en'],
        de: json['de'],
        es: json['es'],
        fr: json['fr'],
        it: json['it'],
        pl: json['pl'],
        ro: json['ro'],
        hu: json['hu'],
        nl: json['nl'],
        pt: json['pt'],
        sv: json['sv'],
        vi: json['vi'],
        tr: json['tr'],
        ru: json['ru'],
        ja: json['ja'],
        zh: json['zh'],
        zhTw: json['zh-tw'],
        ko: json['ko'],
        ar: json['ar'],
        th: json['th'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'en': en,
        'de': de,
        'es': es,
        'fr': fr,
        'it': it,
        'pl': pl,
        'ro': ro,
        'hu': hu,
        'nl': nl,
        'pt': pt,
        'sv': sv,
        'vi': vi,
        'tr': tr,
        'ru': ru,
        'ja': ja,
        'zh': zh,
        'zh-tw': zhTw,
        'ko': ko,
        'ar': ar,
        'th': th,
        'id': id,
      };
}

class Image {
  Image({
    required this.thumb,
    required this.small,
    required this.large,
  });

  final String thumb;
  final String small;
  final String large;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        thumb: json['thumb'],
        small: json['small'],
        large: json['large'],
      );

  Map<String, dynamic> toJson() => {
        'thumb': thumb,
        'small': small,
        'large': large,
      };
}

class Links {
  Links({
    required this.homepage,
    required this.twitterScreenName,
    required this.facebookUsername,
    required this.subredditUrl,
  });

  final List<String> homepage;
  final String twitterScreenName;
  final String facebookUsername;
  final String subredditUrl;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        homepage: List<String>.from(json['homepage'].map((x) => x)),
        twitterScreenName: json['twitter_screen_name'] ?? 'twitter.com/',
        facebookUsername: json['facebook_username'] ?? 'facebook.com/',
        subredditUrl: json['subreddit_url'] ?? 'reddit.com/',
      );

  Map<String, dynamic> toJson() => {
        'homepage': List<dynamic>.from(homepage.map((x) => x)),
        'twitter_screen_name': twitterScreenName,
        'facebook_username': facebookUsername,
        'subreddit_url': subredditUrl,
      };
}

class MarketData {
  MarketData({
    required this.currentPrice,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.priceChangePercentage7D,
    required this.priceChangePercentage14D,
    required this.priceChangePercentage30D,
    required this.priceChangePercentage60D,
    required this.priceChangePercentage200D,
    required this.priceChangePercentage1Y,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.priceChange24HInCurrency,
    required this.priceChangePercentage1HInCurrency,
    required this.priceChangePercentage24HInCurrency,
    required this.priceChangePercentage7DInCurrency,
    required this.priceChangePercentage14DInCurrency,
    required this.priceChangePercentage30DInCurrency,
    required this.priceChangePercentage60DInCurrency,
    required this.priceChangePercentage200DInCurrency,
    required this.priceChangePercentage1YInCurrency,
    required this.marketCapChange24HInCurrency,
    required this.marketCapChangePercentage24HInCurrency,
    required this.totalSupply,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.sparkline7D,
    required this.lastUpdated,
  });

  final Map<String, double> currentPrice;
  final Map<String, double> ath;
  final Map<String, double> athChangePercentage;
  final Map<String, DateTime> athDate;
  final Map<String, double> atl;
  final Map<String, double> atlChangePercentage;
  final Map<String, DateTime> atlDate;
  final Map<String, double> marketCap;
  final int marketCapRank;
  final Map<String, double> fullyDilutedValuation;
  final Map<String, double> totalVolume;
  final Map<String, double> high24H;
  final Map<String, double> low24H;
  final double priceChange24H;
  final double priceChangePercentage24H;
  final double priceChangePercentage7D;
  final double priceChangePercentage14D;
  final double priceChangePercentage30D;
  final double priceChangePercentage60D;
  final double priceChangePercentage200D;
  final double priceChangePercentage1Y;
  final double marketCapChange24H;
  final double marketCapChangePercentage24H;
  final Map<String, double> priceChange24HInCurrency;
  final Map<String, double> priceChangePercentage1HInCurrency;
  final Map<String, double> priceChangePercentage24HInCurrency;
  final Map<String, double> priceChangePercentage7DInCurrency;
  final Map<String, double> priceChangePercentage14DInCurrency;
  final Map<String, double> priceChangePercentage30DInCurrency;
  final Map<String, double> priceChangePercentage60DInCurrency;
  final Map<String, double> priceChangePercentage200DInCurrency;
  final Map<String, double> priceChangePercentage1YInCurrency;
  final Map<String, double> marketCapChange24HInCurrency;
  final Map<String, double> marketCapChangePercentage24HInCurrency;
  final double totalSupply;
  final double maxSupply;
  final double circulatingSupply;
  final Sparkline7D sparkline7D;
  final DateTime lastUpdated;

  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
        currentPrice: Map.from(json['current_price'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        ath: Map.from(json['ath'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        athChangePercentage: Map.from(json['ath_change_percentage'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        athDate: Map.from(json['ath_date'])
            .map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        atl: Map.from(json['atl'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        atlChangePercentage: Map.from(json['atl_change_percentage'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        atlDate: Map.from(json['atl_date'])
            .map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        marketCap: Map.from(json['market_cap'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        marketCapRank: json['market_cap_rank'],
        fullyDilutedValuation: Map.from(json['fully_diluted_valuation'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        totalVolume: Map.from(json['total_volume'] ?? {})
            .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        high24H: Map.from(json['high_24h'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        low24H: Map.from(json['low_24h'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        priceChange24H: json['price_change_24h'].toDouble() ?? 0,
        priceChangePercentage24H:
            json['price_change_percentage_24h'].toDouble() ?? 0,
        priceChangePercentage7D:
            json['price_change_percentage_7d'].toDouble() ?? 0,
        priceChangePercentage14D:
            json['price_change_percentage_14d'].toDouble() ?? 0,
        priceChangePercentage30D:
            json['price_change_percentage_30d'].toDouble() ?? 0,
        priceChangePercentage60D:
            json['price_change_percentage_60d'].toDouble() ?? 0,
        priceChangePercentage200D:
            json['price_change_percentage_200d'].toDouble() ?? 0,
        priceChangePercentage1Y:
            json['price_change_percentage_1y'].toDouble() ?? 0,
        marketCapChange24H: json['market_cap_change_24h'].toDouble() ?? 0,
        marketCapChangePercentage24H:
            json['market_cap_change_percentage_24h'].toDouble() ?? 0,
        priceChange24HInCurrency: Map.from(json['price_change_24h_in_currency'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        priceChangePercentage1HInCurrency:
            Map.from(json['price_change_percentage_1h_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        priceChangePercentage24HInCurrency:
            Map.from(json['price_change_percentage_24h_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        priceChangePercentage7DInCurrency:
            Map.from(json['price_change_percentage_7d_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        priceChangePercentage14DInCurrency:
            Map.from(json['price_change_percentage_14d_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        priceChangePercentage30DInCurrency:
            Map.from(json['price_change_percentage_30d_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        priceChangePercentage60DInCurrency:
            Map.from(json['price_change_percentage_60d_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        priceChangePercentage200DInCurrency:
            Map.from(json['price_change_percentage_200d_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        priceChangePercentage1YInCurrency:
            Map.from(json['price_change_percentage_1y_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        marketCapChange24HInCurrency:
            Map.from(json['market_cap_change_24h_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        marketCapChangePercentage24HInCurrency:
            Map.from(json['market_cap_change_percentage_24h_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble() ?? 0)),
        totalSupply: json['total_supply'] == null
            ? double.infinity
            : json['total_supply'].toDouble(),
        maxSupply: json['max_supply'] == null
            ? double.infinity
            : json['max_supply'].toDouble(),
        circulatingSupply:
            json['circulating_supply'].toDouble() ?? double.infinity,
        sparkline7D: Sparkline7D.fromJson(json['sparkline_7d'] ??
            {
              'price': [
                0,
              ],
            }),
        lastUpdated: DateTime.parse(json['last_updated']),
      );

  Map<String, dynamic> toJson() => {
        'current_price': Map.from(currentPrice)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'ath': Map.from(ath).map((k, v) => MapEntry<String, dynamic>(k, v)),
        'ath_change_percentage': Map.from(athChangePercentage)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'ath_date': Map.from(athDate)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        'atl': Map.from(atl).map((k, v) => MapEntry<String, dynamic>(k, v)),
        'atl_change_percentage': Map.from(atlChangePercentage)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'atl_date': Map.from(atlDate)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        'market_cap':
            Map.from(marketCap).map((k, v) => MapEntry<String, dynamic>(k, v)),
        'market_cap_rank': marketCapRank,
        'fully_diluted_valuation': Map.from(fullyDilutedValuation)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'total_volume': Map.from(totalVolume)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'high_24h':
            Map.from(high24H).map((k, v) => MapEntry<String, dynamic>(k, v)),
        'low_24h':
            Map.from(low24H).map((k, v) => MapEntry<String, dynamic>(k, v)),
        'price_change_24h': priceChange24H,
        'price_change_percentage_24h': priceChangePercentage24H,
        'price_change_percentage_7d': priceChangePercentage7D,
        'price_change_percentage_14d': priceChangePercentage14D,
        'price_change_percentage_30d': priceChangePercentage30D,
        'price_change_percentage_60d': priceChangePercentage60D,
        'price_change_percentage_200d': priceChangePercentage200D,
        'price_change_percentage_1y': priceChangePercentage1Y,
        'market_cap_change_24h': marketCapChange24H,
        'market_cap_change_percentage_24h': marketCapChangePercentage24H,
        'price_change_24h_in_currency': Map.from(priceChange24HInCurrency)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_1h_in_currency':
            Map.from(priceChangePercentage1HInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_24h_in_currency':
            Map.from(priceChangePercentage24HInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_7d_in_currency':
            Map.from(priceChangePercentage7DInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_14d_in_currency':
            Map.from(priceChangePercentage14DInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_30d_in_currency':
            Map.from(priceChangePercentage30DInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_60d_in_currency':
            Map.from(priceChangePercentage60DInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_200d_in_currency':
            Map.from(priceChangePercentage200DInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'price_change_percentage_1y_in_currency':
            Map.from(priceChangePercentage1YInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'market_cap_change_24h_in_currency':
            Map.from(marketCapChange24HInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'market_cap_change_percentage_24h_in_currency':
            Map.from(marketCapChangePercentage24HInCurrency)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'total_supply': totalSupply,
        'max_supply': maxSupply,
        'circulating_supply': circulatingSupply,
        'sparkline_7d': sparkline7D.toJson(),
        'last_updated': lastUpdated.toIso8601String(),
      };
}

class Sparkline7D {
  Sparkline7D({
    required this.price,
  });

  final List<double> price;

  factory Sparkline7D.fromJson(Map<String, dynamic> json) => Sparkline7D(
        price: List<double>.from(json['price'].map((x) => x.toDouble() ?? 0)),
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
