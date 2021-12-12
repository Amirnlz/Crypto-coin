import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto_coin/helpers/constans.dart';
import 'package:crypto_coin/helpers/extension.dart';
import 'package:crypto_coin/model/coin.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({required this.coin, Key? key}) : super(key: key);
  final Coin coin;

  @override
  Widget build(BuildContext context) {
    bool isOnProfit = coin.priceChangePercentage24H >= 0;
    return SizedBox(
      height: context.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              child: Image.network(
                coin.image,
                fit: BoxFit.cover,
              ),
              radius: context.width * 0.06,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: context.width * 0.05,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        coin.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AutoSizeText(
                        '\$${coin.currentPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        coin.symbol.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            '\$${coin.priceChange24H.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: context.width * 0.02,
                          ),
                          AutoSizeText(
                            '${coin.priceChangePercentage24H.toStringAsFixed(2)}%',
                            style: TextStyle(
                              color: isOnProfit ? greenColor : redColor,
                              fontSize: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
