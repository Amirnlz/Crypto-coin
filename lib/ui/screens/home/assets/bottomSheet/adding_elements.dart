import '../../../../../bloc/coin/coins_bloc.dart';

import '../../../../../../constant/constans.dart';
import 'input_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingElements extends StatelessWidget {
  const AddingElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<CoinBloc, CoinListState>(
      listener: (context, state) {
        if (state is CoinListError) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is CoinListLoading) {
          return buildLoading(size.height * 0.1, size.width * 0.2);
        } else if (state is CoinListLoaded) {
          return buildInputWidgets(state.coinList, size);
        }
        return const Center(
          child: Text('Error loading Coin List.'),
        );
      },
    );
  }

  Widget buildInputWidgets(final coinList, Size size) {
    return InputWidgets(
      coins: coinList,
    );
  }

  Center buildLoading(double height, double width) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: kLoadingIndecator,
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
}
