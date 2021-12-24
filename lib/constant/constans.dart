import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

const String coinMarketRequiredUrl =
    'markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1'
    '&sparkline=true&price_change_percentage=1y';

const Color blackColor = Color(0xFF232222);
const Color blueColor = Color(0xFF0567F6);

enum CategoryType {
  Main_Portfolio,
  Experimental,
  Top_10_coins,
}

const kLoadingIndecator = LoadingIndicator(
  indicatorType: Indicator.ballClipRotateMultiple,
  backgroundColor: Colors.transparent,
  strokeWidth: 3.0,
  colors: [blueColor],
);
