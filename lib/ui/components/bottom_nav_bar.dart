import '../screens/home/home_screen.dart';

import '../../blocs/coin/coins_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/coins/coins_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: [
            const HomeScreen(),
            BlocProvider(
              create: (context) => CoinsBloc()..add(GetMarketCoins()),
              child: const CoinsScreen(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: const Color(0xFF0567F6),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: onTapped,
          items: bottomNavIcons
              .map((item) => BottomNavigationBarItem(
                    icon: item,
                    label: '',
                  ))
              .toList(),
        ),
      ),
    );
  }
}

List<Icon> bottomNavIcons = const [
  Icon(Iconsax.home_1),
  Icon(Iconsax.buy_crypto),
  Icon(Iconsax.arrow_swap_horizontal),
  Icon(Iconsax.setting),
];
