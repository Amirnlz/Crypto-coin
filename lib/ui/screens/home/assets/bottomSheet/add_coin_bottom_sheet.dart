import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/coin/coins_bloc.dart';
import 'adding_elements.dart';

class AddCoinBottomSheet extends StatelessWidget {
  const AddCoinBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: size.height * 0.4,
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BlocProvider(
          create: (context) => CoinBloc()..add(GetMarketCoin()),
          child: const AddingElements(),
        ),
      ),
    );
  }
}
