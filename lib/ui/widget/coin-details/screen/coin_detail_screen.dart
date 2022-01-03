import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/coin-details/coin_details_bloc.dart';
import '../../../../constant/constans.dart';
import '../../../../models/coin/coin_details.dart';
import 'view/coin_details_widget.dart';

class CoinDetailScreen extends StatelessWidget {
  const CoinDetailScreen({required this.coinId, Key? key}) : super(key: key);
  final String coinId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<CoinDetailsBloc, CoinDetailsState>(
          bloc: BlocProvider.of<CoinDetailsBloc>(context)
            ..add(
              GetCoinDetailsById(id: coinId),
            ),
          listener: (context, state) {
            if (state is CoinDetailsError) {
              showSnackBar(context, state.error);
            }
          },
          builder: (context, state) {
            print('coin Id: $coinId');
            if (state is CoinDetailsLoading) {
              return showLoading(size.height * 0.12, size.width * 0.24);
            } else if (state is CoinDetailsLoaded) {
              return buildCoinDeatls(state.coinDetails!);
            } else {
              return showError();
            }
          },
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

  Widget showLoading(double height, double width) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: kLoadingIndecator,
      ),
    );
  }

  Widget buildCoinDeatls(CoinDetails coin) {
    return CoinDetailsWidget(coinDetails: coin);
  }

  Center showError() {
    return const Center(
      child: Text('Something went wrong.'),
    );
  }
}
