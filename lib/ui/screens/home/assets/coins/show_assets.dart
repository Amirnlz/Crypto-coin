import 'package:crypto_coin/ui/screens/home/assets/coins/bottomSheet/add_coin_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ShowAssets extends StatelessWidget {
  const ShowAssets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
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
              GestureDetector(
                onTap: () => showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (context) => const AddCoinBottomSheet()),
                child: Icon(
                  Icons.add_outlined,
                  size: size.width * 0.07,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
