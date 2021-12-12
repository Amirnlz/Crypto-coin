import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto_coin/helpers/constans.dart';
import 'package:crypto_coin/helpers/extension.dart';
import 'package:crypto_coin/pages/home/assets_widget.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CategoryType selectedCategory = CategoryType.Main_Portfolio;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFD0043A1), Color(0xFF0567f4)],
              begin: Alignment.topRight,
              end: Alignment.topLeft,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.27,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: context.height * 0.01,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: FadeInRight(
                          duration: const Duration(seconds: 1),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                itemSelction(
                                  CategoryType.Main_Portfolio,
                                  selectedCategory ==
                                      CategoryType.Main_Portfolio,
                                ),
                                itemSelction(
                                  CategoryType.Top_10_coins,
                                  selectedCategory == CategoryType.Top_10_coins,
                                ),
                                itemSelction(
                                  CategoryType.Experimental,
                                  selectedCategory == CategoryType.Experimental,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: context.width * 0.05,
                      ),
                      child: ZoomIn(
                        delay: const Duration(milliseconds: 800),
                        duration: const Duration(seconds: 1),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AutoSizeText(
                                  '\$5,216.39',
                                  style: TextStyle(
                                    fontSize: 43,
                                    color: Colors.white,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: context.width * 0.06,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.15),
                                  child: Icon(
                                    Iconsax.activity,
                                    size: context.width * 0.07,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                )
                              ],
                            ),
                            const Align(
                              alignment: Alignment.bottomLeft,
                              child: AutoSizeText(
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
                    ),
                  ],
                ),
              ),
              const AssetsWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemSelction(CategoryType categoryType, bool isSelected) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white24,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () => setState(() {
          selectedCategory = categoryType;
        }),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white.withOpacity(0.15) : null,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: AutoSizeText(
            categoryType.name.replaceAll('_', ' '),
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFFcfcfce),
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
