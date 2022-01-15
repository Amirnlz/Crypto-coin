import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/bloc/swap-coin/swap_coin_bloc.dart';
import '/ui/screens/swap/source-coin/source_coin.dart';
import '../../../constant/constans.dart';
import '../../../models/coin/coin.dart';

class SwapWidgets extends StatefulWidget {
  const SwapWidgets({required this.coins, Key? key}) : super(key: key);

  final List<Coin> coins;

  @override
  State<SwapWidgets> createState() => _SwapWidgetsState();
}

class _SwapWidgetsState extends State<SwapWidgets> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        topBackgroundImage(size.height * 0.5, size.width),
        SizedBox(height: size.height * 0.05),
        swapActionBLocBuilder(),
      ],
    );
  }

  SvgPicture topBackgroundImage(double height, double width) {
    return SvgPicture.asset(
      'assets/images/Bitcoin P2P-pana.svg',
      semanticsLabel: 'Swap coins',
      width: width,
      height: height,
    );
  }

  BlocBuilder swapActionBLocBuilder() {
    return BlocBuilder<SwapCoinBloc, SwapCoinState>(
      builder: (context, state) {
        debugPrint('state $state');

        if (state is LoadingSwapCoinState) {
          return buildLoadingIndicator();
        } else if (state is UpdateSourceCoinState ||
            state is InitialSwapCoinState) {
          return Sourcecoin(
            coinList: widget.coins,
            coin: state.sourceCoin,
            sourcePriceValue: state.sourcePrice,
          );
        }

        return const Text('text');
      },
    );
  }

  Widget buildLoadingIndicator() {
    return const Center(
      child: SizedBox(
        height: 90,
        width: 90,
        child: kLoadingIndecator,
      ),
    );
  }
}
