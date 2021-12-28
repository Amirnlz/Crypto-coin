import 'dart:convert';

List<SupportedCoin> supportedCoinFromJson(List<dynamic> data) =>
    List<SupportedCoin>.from(data.map((x) => SupportedCoin.fromJson(x)));

String supportedCoinToJson(List<SupportedCoin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupportedCoin {
  SupportedCoin({
    required this.id,
    required this.symbol,
    required this.name,
  });

  final String id;
  final String symbol;
  final String name;

  factory SupportedCoin.fromJson(Map<String, dynamic> json) => SupportedCoin(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'symbol': symbol,
        'name': name,
      };
}
