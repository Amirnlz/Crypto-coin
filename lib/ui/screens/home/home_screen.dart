import 'package:flutter/material.dart';

import 'assets/coins/asset_coins.dart';
import 'assets/statistics/assets_statistics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFD0043A1), Color(0xFF0567f4)],
              begin: Alignment.topRight,
              end: Alignment.topLeft,
            ),
          ),
          child: Column(
            children: const [
              AssetsStatistics(),
              AssetCoin(),
            ],
          ),
        ),
      ),
    );
  }
}
