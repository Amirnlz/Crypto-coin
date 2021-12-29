import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constant/constans.dart';
import '../../../../../../constant/extension/extension.dart';
import '../../../../../../models/coin/supported_coin.dart';
import '../../../../../bloc/coin-wallet/coin_wallet_bloc.dart';

class InputWidgets extends StatefulWidget {
  const InputWidgets({required this.coins, Key? key}) : super(key: key);
  final List<SupportedCoin> coins;

  @override
  State<InputWidgets> createState() => _InputWidgetsState();
}

class _InputWidgetsState extends State<InputWidgets> {
  final TextEditingController _controller = TextEditingController();
  String _selectedCoin = 'bitcoin';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height * 0.06;
    double width = size.width * 0.45;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            amountInputWidget(height, width),
            supportedCoinDropDown(height, width),
          ],
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        addButton(height, width, context),
      ],
    );
  }

  SizedBox amountInputWidget(double height, double width) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: _controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          enabledBorder: kTextFieldOutlineBorder,
          focusedBorder: kTextFieldOutlineBorder,
          contentPadding: const EdgeInsets.all(10),
          filled: true,
          labelText: 'Amount',
          hintText: '0.00',
          labelStyle: const TextStyle(
            color: blackColor,
          ),
          fillColor: greyColor,
        ),
      ),
    );
  }

  Container supportedCoinDropDown(double height, double width) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade400,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      child: DropdownButton(
        onChanged: (value) => setState(
          () => _selectedCoin = value.toString(),
        ),
        value: _selectedCoin,
        items: _dropdownMenuItem(),
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        borderRadius: BorderRadius.circular(10),
        dropdownColor: greyColor,
      ),
    );
  }

  Widget addButton(double heigth, double width, BuildContext context) {
    return SizedBox(
      height: heigth,
      width: width,
      child: Builder(
        builder: (context) {
          return ElevatedButton(
            onPressed: () {
              final alreadyCreatedList =
                  BlocProvider.of<CoinWalletBloc>(context).state.coinsWallet;

              BlocProvider.of<CoinWalletBloc>(context).add(
                AddCoinToWallet(
                  coinId: _selectedCoin,
                  amount: coinAmount,
                  coinWalletList: alreadyCreatedList,
                ),
              );
              Navigator.pop(context);
            },
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
          );
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropdownMenuItem() {
    return widget.coins
        .map(
          (value) => DropdownMenuItem<String>(
            value: value.id,
            child: Text(
              value.name.capitalize(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
        .toList();
  }

  double get coinAmount {
    try {
      return double.parse(_controller.text);
    } catch (e) {
      return 0.0;
    }
  }
}
