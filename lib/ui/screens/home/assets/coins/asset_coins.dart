import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'show_assets.dart';

class AssetCoin extends StatelessWidget {
  const AssetCoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeInUp(
        delay: const Duration(milliseconds: 300),
        duration: const Duration(seconds: 1),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: const ShowAssets(),
        ),
      ),
    );
  }
}
