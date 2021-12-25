import 'package:crypto_coin/bloc/supported-coin/supported_coin_bloc.dart';
import 'package:crypto_coin/constant/constans.dart';
import 'package:crypto_coin/ui/screens/home/assets/coins/bottomSheet/input_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingElements extends StatelessWidget {
  const AddingElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SupportedCoinBloc, SupportedCoinState>(
      listener: (context, state) {
        if (state is SupportedCoinError) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is SupportedCoinLoading) {
          return buildLoading(size.height * 0.1, size.width * 0.2);
        } else if (state is SupportedCoinLoaded) {
          return buildInputWidgets(state.supportedCoins, size);
        }
        return const Center(
          child: Text('Error loading Coin List.'),
        );
      },
    );
  }

  Column buildInputWidgets(final supportedCoins, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InputWidgets(
          height: size.height * 0.06,
          width: size.width * 0.45,
          coins: supportedCoins,
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        addButton(size.height * 0.06, size.width * 0.45),
      ],
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

  Widget addButton(double heigth, double width) {
    return SizedBox(
      height: heigth,
      width: width,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
        ),
        child: const Text(
          'Add to wallet',
        ),
      ),
    );
  }
}
