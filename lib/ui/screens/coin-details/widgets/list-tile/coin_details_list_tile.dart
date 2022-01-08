import 'package:flutter/material.dart';

import '../../../../../../constant/extension/extension.dart';

class CoinDetailsListTile extends StatelessWidget {
  const CoinDetailsListTile({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentChange,
  }) : super(key: key);
  final String imageUrl;
  final String name;
  final String symbol;
  final double price;
  final double percentChange;

  Color get getColor => isOnProfit ? Colors.green : Colors.red;

  bool get isOnProfit => percentChange >= 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingWidget(),
      title: titleWidget(),
      subtitle: subtitleWidget(),
    );
  }

  CircleAvatar leadingWidget() {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      backgroundColor: Colors.transparent,
      radius: 30,
    );
  }

  Row titleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          '\$' + price.divideWithComma,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Row subtitleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          symbol.toUpperCase(),
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          percentChange.toStringAsFixed(2) + '%',
          style: TextStyle(
            fontSize: 16,
            color: getColor,
          ),
        ),
      ],
    );
  }
}
