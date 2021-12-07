import 'package:crypto_coin/helpers/constans.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

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
            fontWeight: FontWeight.w300,
            color: blackColor,
          ),
        ),
        fontFamily: 'Cairo',
      ),
      home: const HomePage(),
    );
  }
}
