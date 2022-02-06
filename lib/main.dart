import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/coin-details/coin_details_bloc.dart';
import 'bloc/coin-wallet/coin_wallet_bloc.dart';
import 'bloc/coin/coins_bloc.dart';
import 'constant/constans.dart';
import 'ui/splash/splash_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CoinWalletBloc(),
        ),
        BlocProvider(
          create: (context) => CoinDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => CoinBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
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
        home: const SplashScreen(),
      ),
    );
  }
}
