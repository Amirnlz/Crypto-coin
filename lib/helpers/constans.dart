// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const Color greyColor = Color(0xFFF5F4F5);
const Color blackColor = Color(0xFF232222);
const Color blueColor = Color(0xFF0567F6);
const Color profitGreen = Color(0xFF50C88B);
const Color lossRed = Color(0xFFFE6366);

 enum ProfileType {
  Main_Portfolio,
  Experimental,
  Top_10_coins,
}

extension ParseToStringMediType on ProfileType {
  String toShortString() {
    return toString().split('.').last.replaceAll('_', ' ');
  }
}
