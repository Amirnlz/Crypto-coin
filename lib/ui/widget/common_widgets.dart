import '../../constant/extension/extension.dart';
import '../../models/coin/coin.dart';
import 'package:flutter/material.dart';

class CommonWidgets {
  final String? imageUrl;

  CommonWidgets({this.imageUrl});

  CircleAvatar get coinImage =>
      imageUrl == null ? _loadCoinDefaultImage : _loadCoinNetworkImage;

  CircleAvatar get _loadCoinNetworkImage => CircleAvatar(
        backgroundImage: NetworkImage(imageUrl!),
        backgroundColor: Colors.transparent,
        radius: 20,
      );

  CircleAvatar get _loadCoinDefaultImage => const CircleAvatar(
        backgroundImage: AssetImage('assets/images/bitcoin.png'),
        backgroundColor: Colors.transparent,
        radius: 20,
      );

  List<DropdownMenuItem<String>> getDropDownMenuItems(List<Coin> coins) {
    return coins
        .map((coin) => DropdownMenuItem(
              value: coin.id,
              child: Text(
                coin.name.capitalize,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ))
        .toList();
  }
}
