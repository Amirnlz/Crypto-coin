import 'package:flutter/material.dart';

import 'constant/constans.dart';
import 'ui/components/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
          secondary: blueColor,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: blackColor,
          ),
        ),
        fontFamily: 'Cairo',
      ),
      home: const BottomNavBar(),
    );
  }
}
