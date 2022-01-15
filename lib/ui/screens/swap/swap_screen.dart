import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/coin/coins_bloc.dart';
import '../../../constant/constans.dart';
import 'swap_widgets.dart';

class SwapScreen extends StatelessWidget {
  const SwapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CoinBloc, CoinListState>(
          bloc: BlocProvider.of<CoinBloc>(context)..add(GetMarketCoin()),
          builder: (context, state) {
            if (state is CoinListLoading) {
              return buildLoadingIndicator(
                size.height * 0.12,
                size.width * 0.24,
              );
            } else if (state is CoinListLoaded) {
              return buildWidgets(state.coinList);
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}

Widget buildWidgets(final coins) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: SwapWidgets(
      coins: coins,
    ),
  );
}

Widget buildLoadingIndicator(double height, double width) {
  return Center(
    child: SizedBox(
      height: height,
      width: width,
      child: kLoadingIndecator,
    ),
  );
}
