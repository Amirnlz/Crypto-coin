import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class StatisticsNumber extends StatelessWidget {
  const StatisticsNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ZoomIn(
      delay: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 1),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: size.width * 0.01,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '\$5,216.39',
                  style: TextStyle(
                    fontSize: 43,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  radius: size.width * 0.06,
                  backgroundColor: Colors.white.withOpacity(0.15),
                  child: Icon(
                    Iconsax.activity,
                    size: size.width * 0.07,
                    color: Colors.white.withOpacity(0.8),
                  ),
                )
              ],
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '+192% all time',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
