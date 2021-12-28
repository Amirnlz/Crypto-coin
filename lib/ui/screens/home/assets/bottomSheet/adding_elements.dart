import '../../../../../../bloc/supported-coin/supported_coin_bloc.dart';
import '../../../../../../constant/constans.dart';
import 'input_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingElements extends StatelessWidget {
  const AddingElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SupportedCoinBloc, SupportedCoinListState>(
      listener: (context, state) {
        if (state is SupportedCoinError) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is SupportedCoinLoading) {
          return buildLoading(size.height * 0.1, size.width * 0.2);
        } else if (state is SupportedCoinLoaded) {
          return buildInputWidgets(state.supportedCoin, size);
        }
        return const Center(
          child: Text('Error loading Coin List.'),
        );
      },
    );
  }

  Widget buildInputWidgets(final supportedCoin, Size size) {
    return InputWidgets(
      coins: supportedCoin,
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
