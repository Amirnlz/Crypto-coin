// To parse this JSON data, do
//
//     final coinDeatails = coinDeatailsFromJson(jsonString);

import 'dart:convert';

CoinDetails coinDetailsFromJson(String str) =>
    CoinDetails.fromJson(json.decode(str));

String coinDetailsToJson(CoinDetails data) => json.encode(data.toJson());

class CoinDetails {
  CoinDetails({
    required this.id,
    required this.symbol,
    required this.name,
    required this.assetPlatformId,
    required this.platforms,
    required this.blockTimeInMinutes,
    required this.hashingAlgorithm,
    required this.categories,
    required this.publicNotice,
    required this.additionalNotices,
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
    required this.communityData,
    required this.developerData,
    required this.publicInterestStats,
    required this.statusUpdates,
    required this.lastUpdated,
    required this.tickers,
  });

  final Id id;
  final String symbol;
  final String name;
  final dynamic assetPlatformId;
  final Platforms platforms;
  final int blockTimeInMinutes;
  final String hashingAlgorithm;
  final List<String> categories;
  final dynamic publicNotice;
  final List<dynamic> additionalNotices;
  final Tion localization;
  final Tion description;
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
  final int publicInterestScore;
  final MarketData marketData;
  final CommunityData communityData;
  final DeveloperData developerData;
  final PublicInterestStats publicInterestStats;
  final List<dynamic> statusUpdates;
  final DateTime lastUpdated;
  final List<Ticker> tickers;

  factory CoinDetails.fromJson(Map<String, dynamic> json) => CoinDetails(
        id: idValues.map[json['id']]!,
        symbol: json['symbol'],
        name: json['name'],
        assetPlatformId: json['asset_platform_id'],
        platforms: Platforms.fromJson(json['platforms']),
        blockTimeInMinutes: json['block_time_in_minutes'],
        hashingAlgorithm: json['hashing_algorithm'],
        categories: List<String>.from(json['categories'].map((x) => x)),
        publicNotice: json['public_notice'],
        additionalNotices:
            List<dynamic>.from(json['additional_notices'].map((x) => x)),
        localization: Tion.fromJson(json['localization']),
        description: Tion.fromJson(json['description']),
        links: Links.fromJson(json['links']),
        image: Image.fromJson(json['image']),
        countryOrigin: json['country_origin'],
        genesisDate: DateTime.parse(json['genesis_date']),
        sentimentVotesUpPercentage:
            json['sentiment_votes_up_percentage'].toDouble(),
        sentimentVotesDownPercentage:
            json['sentiment_votes_down_percentage'].toDouble(),
        marketCapRank: json['market_cap_rank'],
        coingeckoRank: json['coingecko_rank'],
        coingeckoScore: json['coingecko_score'].toDouble(),
        developerScore: json['developer_score'].toDouble(),
        communityScore: json['community_score'].toDouble(),
        liquidityScore: json['liquidity_score'].toDouble(),
        publicInterestScore: json['public_interest_score'],
        marketData: MarketData.fromJson(json['market_data']),
        communityData: CommunityData.fromJson(json['community_data']),
        developerData: DeveloperData.fromJson(json['developer_data']),
        publicInterestStats:
            PublicInterestStats.fromJson(json['public_interest_stats']),
        statusUpdates: List<dynamic>.from(json['status_updates'].map((x) => x)),
        lastUpdated: DateTime.parse(json['last_updated']),
        tickers:
            List<Ticker>.from(json['tickers'].map((x) => Ticker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': idValues.reverse[id],
        'symbol': symbol,
        'name': name,
        'asset_platform_id': assetPlatformId,
        'platforms': platforms.toJson(),
        'block_time_in_minutes': blockTimeInMinutes,
        'hashing_algorithm': hashingAlgorithm,
        'categories': List<dynamic>.from(categories.map((x) => x)),
        'public_notice': publicNotice,
        'additional_notices':
            List<dynamic>.from(additionalNotices.map((x) => x)),
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
        'community_data': communityData.toJson(),
        'developer_data': developerData.toJson(),
        'public_interest_stats': publicInterestStats.toJson(),
        'status_updates': List<dynamic>.from(statusUpdates.map((x) => x)),
        'last_updated': lastUpdated.toIso8601String(),
        'tickers': List<dynamic>.from(tickers.map((x) => x.toJson())),
      };
}

class CommunityData {
  CommunityData({
    required this.facebookLikes,
    required this.twitterFollowers,
    required this.redditAveragePosts48H,
    required this.redditAverageComments48H,
    required this.redditSubscribers,
    required this.redditAccountsActive48H,
    required this.telegramChannelUserCount,
  });

  final dynamic facebookLikes;
  final int twitterFollowers;
  final double redditAveragePosts48H;
  final int redditAverageComments48H;
  final int redditSubscribers;
  final int redditAccountsActive48H;
  final dynamic telegramChannelUserCount;

  factory CommunityData.fromJson(Map<String, dynamic> json) => CommunityData(
        facebookLikes: json['facebook_likes'],
        twitterFollowers: json['twitter_followers'],
        redditAveragePosts48H: json['reddit_average_posts_48h'].toDouble(),
        redditAverageComments48H: json['reddit_average_comments_48h'],
        redditSubscribers: json['reddit_subscribers'],
        redditAccountsActive48H: json['reddit_accounts_active_48h'],
        telegramChannelUserCount: json['telegram_channel_user_count'],
      );

  Map<String, dynamic> toJson() => {
        'facebook_likes': facebookLikes,
        'twitter_followers': twitterFollowers,
        'reddit_average_posts_48h': redditAveragePosts48H,
        'reddit_average_comments_48h': redditAverageComments48H,
        'reddit_subscribers': redditSubscribers,
        'reddit_accounts_active_48h': redditAccountsActive48H,
        'telegram_channel_user_count': telegramChannelUserCount,
      };
}

class Tion {
  Tion({
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

  factory Tion.fromJson(Map<String, dynamic> json) => Tion(
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

class DeveloperData {
  DeveloperData({
    required this.forks,
    required this.stars,
    required this.subscribers,
    required this.totalIssues,
    required this.closedIssues,
    required this.pullRequestsMerged,
    required this.pullRequestContributors,
    required this.codeAdditionsDeletions4Weeks,
    required this.commitCount4Weeks,
    required this.last4WeeksCommitActivitySeries,
  });

  final int forks;
  final int stars;
  final int subscribers;
  final int totalIssues;
  final int closedIssues;
  final int pullRequestsMerged;
  final int pullRequestContributors;
  final CodeAdditionsDeletions4Weeks codeAdditionsDeletions4Weeks;
  final int commitCount4Weeks;
  final List<int> last4WeeksCommitActivitySeries;

  factory DeveloperData.fromJson(Map<String, dynamic> json) => DeveloperData(
        forks: json['forks'],
        stars: json['stars'],
        subscribers: json['subscribers'],
        totalIssues: json['total_issues'],
        closedIssues: json['closed_issues'],
        pullRequestsMerged: json['pull_requests_merged'],
        pullRequestContributors: json['pull_request_contributors'],
        codeAdditionsDeletions4Weeks: CodeAdditionsDeletions4Weeks.fromJson(
            json['code_additions_deletions_4_weeks']),
        commitCount4Weeks: json['commit_count_4_weeks'],
        last4WeeksCommitActivitySeries: List<int>.from(
            json['last_4_weeks_commit_activity_series'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'forks': forks,
        'stars': stars,
        'subscribers': subscribers,
        'total_issues': totalIssues,
        'closed_issues': closedIssues,
        'pull_requests_merged': pullRequestsMerged,
        'pull_request_contributors': pullRequestContributors,
        'code_additions_deletions_4_weeks':
            codeAdditionsDeletions4Weeks.toJson(),
        'commit_count_4_weeks': commitCount4Weeks,
        'last_4_weeks_commit_activity_series':
            List<dynamic>.from(last4WeeksCommitActivitySeries.map((x) => x)),
      };
}

class CodeAdditionsDeletions4Weeks {
  CodeAdditionsDeletions4Weeks({
    required this.additions,
    required this.deletions,
  });

  final int additions;
  final int deletions;

  factory CodeAdditionsDeletions4Weeks.fromJson(Map<String, dynamic> json) =>
      CodeAdditionsDeletions4Weeks(
        additions: json['additions'],
        deletions: json['deletions'],
      );

  Map<String, dynamic> toJson() => {
        'additions': additions,
        'deletions': deletions,
      };
}

enum Id { TETHER, BITCOIN, BINANCE_USD, TRUE_USD, USD_COIN }

final idValues = EnumValues({
  'binance-usd': Id.BINANCE_USD,
  'bitcoin': Id.BITCOIN,
  'tether': Id.TETHER,
  'true-usd': Id.TRUE_USD,
  'usd-coin': Id.USD_COIN
});

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
    required this.blockchainSite,
    required this.officialForumUrl,
    required this.chatUrl,
    required this.announcementUrl,
    required this.twitterScreenName,
    required this.facebookUsername,
    required this.bitcointalkThreadIdentifier,
    required this.telegramChannelIdentifier,
    required this.subredditUrl,
    required this.reposUrl,
  });

  final List<String> homepage;
  final List<String> blockchainSite;
  final List<String> officialForumUrl;
  final List<String> chatUrl;
  final List<String> announcementUrl;
  final Id twitterScreenName;
  final String facebookUsername;
  final dynamic bitcointalkThreadIdentifier;
  final String telegramChannelIdentifier;
  final String subredditUrl;
  final ReposUrl reposUrl;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        homepage: List<String>.from(json['homepage'].map((x) => x)),
        blockchainSite:
            List<String>.from(json['blockchain_site'].map((x) => x)),
        officialForumUrl:
            List<String>.from(json['official_forum_url'].map((x) => x)),
        chatUrl: List<String>.from(json['chat_url'].map((x) => x)),
        announcementUrl:
            List<String>.from(json['announcement_url'].map((x) => x)),
        twitterScreenName: idValues.map[json['twitter_screen_name']]!,
        facebookUsername: json['facebook_username'],
        bitcointalkThreadIdentifier: json['bitcointalk_thread_identifier'],
        telegramChannelIdentifier: json['telegram_channel_identifier'],
        subredditUrl: json['subreddit_url'],
        reposUrl: ReposUrl.fromJson(json['repos_url']),
      );

  Map<String, dynamic> toJson() => {
        'homepage': List<dynamic>.from(homepage.map((x) => x)),
        'blockchain_site': List<dynamic>.from(blockchainSite.map((x) => x)),
        'official_forum_url':
            List<dynamic>.from(officialForumUrl.map((x) => x)),
        'chat_url': List<dynamic>.from(chatUrl.map((x) => x)),
        'announcement_url': List<dynamic>.from(announcementUrl.map((x) => x)),
        'twitter_screen_name': idValues.reverse[twitterScreenName],
        'facebook_username': facebookUsername,
        'bitcointalk_thread_identifier': bitcointalkThreadIdentifier,
        'telegram_channel_identifier': telegramChannelIdentifier,
        'subreddit_url': subredditUrl,
        'repos_url': reposUrl.toJson(),
      };
}

class ReposUrl {
  ReposUrl({
    required this.github,
    required this.bitbucket,
  });

  final List<String> github;
  final List<dynamic> bitbucket;

  factory ReposUrl.fromJson(Map<String, dynamic> json) => ReposUrl(
        github: List<String>.from(json['github'].map((x) => x)),
        bitbucket: List<dynamic>.from(json['bitbucket'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'github': List<dynamic>.from(github.map((x) => x)),
        'bitbucket': List<dynamic>.from(bitbucket.map((x) => x)),
      };
}

class MarketData {
  MarketData({
    required this.currentPrice,
    required this.totalValueLocked,
    required this.mcapToTvlRatio,
    required this.fdvToTvlRatio,
    required this.roi,
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
  final dynamic totalValueLocked;
  final dynamic mcapToTvlRatio;
  final dynamic fdvToTvlRatio;
  final dynamic roi;
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
  final int totalSupply;
  final int maxSupply;
  final int circulatingSupply;
  final Sparkline7D sparkline7D;
  final DateTime lastUpdated;

  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
        currentPrice: Map.from(json['current_price'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        totalValueLocked: json['total_value_locked'],
        mcapToTvlRatio: json['mcap_to_tvl_ratio'],
        fdvToTvlRatio: json['fdv_to_tvl_ratio'],
        roi: json['roi'],
        ath: Map.from(json['ath'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        athChangePercentage: Map.from(json['ath_change_percentage'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        athDate: Map.from(json['ath_date'])
            .map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        atl: Map.from(json['atl'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        atlChangePercentage: Map.from(json['atl_change_percentage'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        atlDate: Map.from(json['atl_date'])
            .map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        marketCap: Map.from(json['market_cap'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        marketCapRank: json['market_cap_rank'],
        fullyDilutedValuation: Map.from(json['fully_diluted_valuation'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        totalVolume: Map.from(json['total_volume'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        high24H: Map.from(json['high_24h'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        low24H: Map.from(json['low_24h'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChange24H: json['price_change_24h'].toDouble(),
        priceChangePercentage24H:
            json['price_change_percentage_24h'].toDouble(),
        priceChangePercentage7D: json['price_change_percentage_7d'].toDouble(),
        priceChangePercentage14D:
            json['price_change_percentage_14d'].toDouble(),
        priceChangePercentage30D:
            json['price_change_percentage_30d'].toDouble(),
        priceChangePercentage60D:
            json['price_change_percentage_60d'].toDouble(),
        priceChangePercentage200D:
            json['price_change_percentage_200d'].toDouble(),
        priceChangePercentage1Y: json['price_change_percentage_1y'].toDouble(),
        marketCapChange24H: json['market_cap_change_24h'].toDouble(),
        marketCapChangePercentage24H:
            json['market_cap_change_percentage_24h'].toDouble(),
        priceChange24HInCurrency: Map.from(json['price_change_24h_in_currency'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage1HInCurrency:
            Map.from(json['price_change_percentage_1h_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage24HInCurrency:
            Map.from(json['price_change_percentage_24h_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage7DInCurrency:
            Map.from(json['price_change_percentage_7d_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage14DInCurrency:
            Map.from(json['price_change_percentage_14d_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage30DInCurrency:
            Map.from(json['price_change_percentage_30d_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage60DInCurrency:
            Map.from(json['price_change_percentage_60d_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage200DInCurrency:
            Map.from(json['price_change_percentage_200d_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage1YInCurrency:
            Map.from(json['price_change_percentage_1y_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        marketCapChange24HInCurrency:
            Map.from(json['market_cap_change_24h_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        marketCapChangePercentage24HInCurrency:
            Map.from(json['market_cap_change_percentage_24h_in_currency'])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        totalSupply: json['total_supply'],
        maxSupply: json['max_supply'],
        circulatingSupply: json['circulating_supply'],
        sparkline7D: Sparkline7D.fromJson(json['sparkline_7d']),
        lastUpdated: DateTime.parse(json['last_updated']),
      );

  Map<String, dynamic> toJson() => {
        'current_price': Map.from(currentPrice)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'total_value_locked': totalValueLocked,
        'mcap_to_tvl_ratio': mcapToTvlRatio,
        'fdv_to_tvl_ratio': fdvToTvlRatio,
        'roi': roi,
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
        price: List<double>.from(json['price'].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        'price': List<dynamic>.from(price.map((x) => x)),
      };
}

class Platforms {
  Platforms({
    required this.empty,
  });

  final String empty;

  factory Platforms.fromJson(Map<String, dynamic> json) => Platforms(
        empty: json[''],
      );

  Map<String, dynamic> toJson() => {
        '': empty,
      };
}

class PublicInterestStats {
  PublicInterestStats({
    required this.alexaRank,
    required this.bingMatches,
  });

  final int alexaRank;
  final dynamic bingMatches;

  factory PublicInterestStats.fromJson(Map<String, dynamic> json) =>
      PublicInterestStats(
        alexaRank: json['alexa_rank'],
        bingMatches: json['bing_matches'],
      );

  Map<String, dynamic> toJson() => {
        'alexa_rank': alexaRank,
        'bing_matches': bingMatches,
      };
}

class Ticker {
  Ticker({
    required this.base,
    required this.target,
    required this.market,
    required this.last,
    required this.volume,
    required this.convertedLast,
    required this.convertedVolume,
    required this.trustScore,
    required this.bidAskSpreadPercentage,
    required this.timestamp,
    required this.lastTradedAt,
    required this.lastFetchAt,
    required this.isAnomaly,
    required this.isStale,
    required this.tradeUrl,
    required this.tokenInfoUrl,
    required this.coinId,
    required this.targetCoinId,
  });

  final String base;
  final String target;
  final Market market;
  final double last;
  final double volume;
  final Map<String, double> convertedLast;
  final Map<String, double> convertedVolume;
  final TrustScore trustScore;
  final double bidAskSpreadPercentage;
  final DateTime timestamp;
  final DateTime lastTradedAt;
  final DateTime lastFetchAt;
  final bool isAnomaly;
  final bool isStale;
  final String tradeUrl;
  final dynamic tokenInfoUrl;
  final String coinId;
  final Id targetCoinId;

  factory Ticker.fromJson(Map<String, dynamic> json) => Ticker(
        base: json['base'],
        target: json['target'],
        market: Market.fromJson(json['market']),
        last: json['last'].toDouble(),
        volume: json['volume'].toDouble(),
        convertedLast: Map.from(json['converted_last'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        convertedVolume: Map.from(json['converted_volume'])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        trustScore: trustScoreValues.map[json['trust_score']]!,
        bidAskSpreadPercentage: json['bid_ask_spread_percentage'].toDouble(),
        timestamp: DateTime.parse(json['timestamp']),
        lastTradedAt: DateTime.parse(json['last_traded_at']),
        lastFetchAt: DateTime.parse(json['last_fetch_at']),
        isAnomaly: json['is_anomaly'],
        isStale: json['is_stale'],
        tradeUrl: json['trade_url'],
        tokenInfoUrl: json['token_info_url'],
        coinId: json['coin_id'],
        targetCoinId: json['target_coin_id'] == null
            ? Id.TRUE_USD
            : idValues.map[json['target_coin_id']]!,
      );

  Map<String, dynamic> toJson() => {
        'base': base,
        'target': target,
        'market': market.toJson(),
        'last': last,
        'volume': volume,
        'converted_last': Map.from(convertedLast)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'converted_volume': Map.from(convertedVolume)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        'trust_score': trustScoreValues.reverse[trustScore],
        'bid_ask_spread_percentage': bidAskSpreadPercentage,
        'timestamp': timestamp.toIso8601String(),
        'last_traded_at': lastTradedAt.toIso8601String(),
        'last_fetch_at': lastFetchAt.toIso8601String(),
        'is_anomaly': isAnomaly,
        'is_stale': isStale,
        'trade_url': tradeUrl,
        'token_info_url': tokenInfoUrl,
        'coin_id': coinId,
        'target_coin_id': idValues.reverse[targetCoinId],
      };
}

class Market {
  Market({
    required this.name,
    required this.identifier,
    required this.hasTradingIncentive,
  });

  final String name;
  final String identifier;
  final bool hasTradingIncentive;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        name: json['name'],
        identifier: json['identifier'],
        hasTradingIncentive: json['has_trading_incentive'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'identifier': identifier,
        'has_trading_incentive': hasTradingIncentive,
      };
}

enum TrustScore { GREEN }

final trustScoreValues = EnumValues({'green': TrustScore.GREEN});

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
