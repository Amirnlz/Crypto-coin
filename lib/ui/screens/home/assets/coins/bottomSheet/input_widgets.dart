import 'package:crypto_coin/constant/constans.dart';
import 'package:crypto_coin/constant/extension/extension.dart';
import 'package:crypto_coin/models/supported_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidgets extends StatelessWidget {
  InputWidgets(
      {required this.height,
      required this.width,
      required this.coins,
      Key? key})
      : super(key: key);
  final TextEditingController _controller = TextEditingController();
  final double height;
  final double width;
  final List<SupportedCoin> coins;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        amountInputWidget(),
        supportedCoinsDropDown(),
      ],
    );
  }

  SizedBox amountInputWidget() {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: _controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'),
              replacementString: ''),
        ],
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

  Container supportedCoinsDropDown() {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: Colors.grey.shade400, style: BorderStyle.solid, width: 1.0),
      ),
      child: DropdownButton(
        onChanged: (value) {},
        value: 'bitcoin',
        items: _dropdownMenuItem(),
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        borderRadius: BorderRadius.circular(10),
        dropdownColor: greyColor,
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropdownMenuItem() {
    return coins
        .map((value) => DropdownMenuItem<String>(
              value: value.id,
              child: Text(
                value.name.capitalize(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ))
        .toList();
  }
}
