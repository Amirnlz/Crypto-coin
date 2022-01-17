import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/swap-coin/swap_coin_bloc.dart';
import '../../../../constant/extension/extension.dart';
import '../../../../models/coin/coin.dart';
import '../../../widget/common_widgets.dart';

class TargetCoin extends StatefulWidget {
  const TargetCoin(
      {required this.coinList,
      required this.coin,
      required this.coinAmount,
      required this.priceValue,
      Key? key})
      : super(key: key);
  final List<Coin> coinList;
  final Coin? coin;
  final double coinAmount;
  final double priceValue;

  @override
  State<TargetCoin> createState() => _TargetCoinState();
}

class _TargetCoinState extends State<TargetCoin> {
  late String _value = widget.coin?.id ?? 'ethereum';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topInfoWidgets(),
          SizedBox(height: size.height * 0.01),
          mainWidegets(),
        ],
      ),
    );
  }

  Row topInfoWidgets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'I want ${_value.capitalize}',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        Text(
          '\$' + widget.priceValue.divideWithComma,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Row mainWidegets() {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CommonWidgets(imageUrl: widget.coin?.image).coinImage,
            SizedBox(width: width * 0.02),
            dropDownButton(),
          ],
        ),
        coinAmountText(),
      ],
    );
  }

  Widget dropDownButton() {
    return Container(
      width: 140,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton(
        value: _value,
        items: CommonWidgets().getDropDownMenuItems(widget.coinList),
        onChanged: onChangedCoin,
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        borderRadius: BorderRadius.circular(15),
        dropdownColor: Colors.grey[100],
      ),
    );
  }

  Widget coinAmountText() {
    return Text(
      widget.coinAmount.toStringAsFixed(2),
      style: const TextStyle(
        fontSize: 17,
        color: Colors.grey,
      ),
    );
  }

  void onChangedCoin(String? value) {
    debugPrint('onChanged: $value');

    setState(() {
      _value = value!;
    });
    updateBloc();
  }

  void updateBloc() {
    final bloc = BlocProvider.of<SwapCoinBloc>(context);
    bloc.add(
      DoSwapEvent(
        targetCoinId: _value,
        sourceCoinId: bloc.state.sourceCoin?.id ?? widget.coinList.first.id,
        sourceCoinAmount: bloc.state.sourceAmount,
      ),
    );
  }
}
