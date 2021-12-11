import 'package:crypto_coin/helpers/constans.dart';
import 'package:crypto_coin/pages/home/home_page.dart';
import 'package:crypto_coin/pages/exchange/exchange_page.dart';
import 'package:crypto_coin/pages/coin_list/coin_list_page.dart';
import 'package:crypto_coin/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
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
          children: const <Widget>[
            HomePage(),
            CoinListPage(),
            ExchangePage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: blueColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: onTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Iconsax.home_1,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.buy_crypto),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Iconsax.arrow_swap_horizontal,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
