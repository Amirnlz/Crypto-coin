import 'package:crypto_coin/helpers/constans.dart';
import 'package:crypto_coin/model/coin.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({required this.coin, Key? key}) : super(key: key);
  final Coin coin;

  @override
  Widget build(BuildContext context) {
    bool isOnProfit = coin.priceChangePercentage24H >= 0;
    return SizedBox(
      height: 12.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              child: Image.network(
                coin.image,
                fit: BoxFit.cover,
              ),
              radius: 2.5.h,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        coin.name,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$${coin.currentPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        coin.symbol.toUpperCase(),
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$${coin.priceChange24H.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            '${coin.priceChangePercentage24H.toStringAsFixed(2)}%',
                            style: TextStyle(
                              color: isOnProfit ? greenColor : redColor,
                              fontSize: 10.sp,
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
