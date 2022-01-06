import 'package:flutter/material.dart';

class MarketBox extends StatelessWidget {
  const MarketBox(
      {required this.title,
      this.titleFontSize = 16,
      required this.subtitle,
      this.subTitleFontSize = 17,
      Key? key})
      : super(key: key);

  final String title;
  final double titleFontSize;
  final String subtitle;
  final double subTitleFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize,
            color: Colors.grey,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: subTitleFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
