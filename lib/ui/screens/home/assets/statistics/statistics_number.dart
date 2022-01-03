import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../bloc/coin-wallet/coin_wallet_bloc.dart';
import '../../../../../constant/extension/extension.dart';

class StatisticsNumber extends StatelessWidget {
  const StatisticsNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ZoomIn(
      delay: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 1),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: size.width * 0.01,
        ),
        child: BlocBuilder<CoinWalletBloc, CoinWalletState>(
          builder: (context, state) {
            if (state is CoinWalletListLoaded) {
              return buildStatics(
                  state.totalAmount, state.totalProfitPercentage, size);
            }
            return buildStarterStatic(size);
          },
        ),
      ),
    );
  }

  Column buildStatics(double amount, double percent, Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            assetsToNumber(amount),
            CircleAvatar(
              radius: size.width * 0.06,
              backgroundColor: Colors.white.withOpacity(0.15),
              child: Icon(
                Iconsax.activity,
                size: size.width * 0.07,
                color: Colors.white.withOpacity(0.8),
              ),
            )
          ],
        ),
        assetsProfitPercentage(percent),
      ],
    );
  }

  Text assetsToNumber(double amount) {
    return Text(
      '\$${amount.divideWithComma}',
      style: const TextStyle(
        fontSize: 43,
        color: Colors.white,
      ),
    );
  }

  Align assetsProfitPercentage(double percentage) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        '${percentage.toStringAsFixed(2)}% all time',
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildStarterStatic(Size size) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            assetsToNumber(0),
            CircleAvatar(
              radius: size.width * 0.06,
              backgroundColor: Colors.white.withOpacity(0.15),
              child: Icon(
                Iconsax.activity,
                size: size.width * 0.07,
                color: Colors.white.withOpacity(0.8),
              ),
            )
          ],
        ),
        assetsProfitPercentage(0),
      ],
    );
  }
}
