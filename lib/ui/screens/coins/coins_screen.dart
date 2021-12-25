import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/coin/coins_bloc.dart';
import '../../../constant/constans.dart';
import 'coin_list_tile.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<CoinsBloc, CoinsState>(
            listener: (context, state) {
              if (state is CoinsError) {
                showSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is CoinsLoading) {
                return buildLoadingIndicator(
                  size.height * 0.12,
                  size.width * 0.24,
                );
              } else if (state is CoinsLoaded) {
                return buildCoinsList(state.coins);
              }
              return const Center(
                child: Text('Error loading coins'),
              );
            },
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FadeInUp(
            duration: const Duration(milliseconds: 1500),
            child: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CoinsBloc>(context).add(GetMarketCoins());
              },
              child: const Icon(Icons.refresh),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
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

  Widget buildCoinsList(final coins) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CoinListTile(coin: coin),
        );
      },
    );
  }
}
