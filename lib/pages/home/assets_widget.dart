import 'package:animate_do/animate_do.dart';
import 'package:crypto_coin/helpers/extension.dart';
import 'package:flutter/material.dart';

class AssetsWidget extends StatelessWidget {
  const AssetsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeInUp(
        delay: const Duration(milliseconds: 300),
        duration: const Duration(seconds: 1),
        child: Container(
          width: context.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(context.width * 0.05),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Assets',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.add_outlined,
                      size: context.width * 0.07,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
