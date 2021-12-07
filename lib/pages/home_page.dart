import 'package:crypto_coin/helpers/constans.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProfileType selectedProfile = ProfileType.Main_Portfolio;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                height: size.height * 0.27,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 40,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: FadeInRight(
                          duration: const Duration(seconds: 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              itemSelction(
                                ProfileType.Main_Portfolio,
                                selectedProfile == ProfileType.Main_Portfolio,
                              ),
                              itemSelction(
                                ProfileType.Top_10_coins,
                                selectedProfile == ProfileType.Top_10_coins,
                              ),
                              itemSelction(
                                ProfileType.Experimental,
                                selectedProfile == ProfileType.Experimental,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15),
                      child: ZoomIn(
                        delay: const Duration(milliseconds: 800),
                        duration: const Duration(seconds: 1),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '\$5,216.39',
                                  style: TextStyle(
                                    fontSize: 43,
                                    color: Colors.white,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 23,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.15),
                                  child: Icon(
                                    Iconsax.activity,
                                    size: 27,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                )
                              ],
                            ),
                            const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
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
              Expanded(
                child: FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  duration: const Duration(seconds: 1),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 1,
                            width: size.width,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemSelction(ProfileType profileType, bool isSelected) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white24,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () => setState(() {
          selectedProfile = profileType;
        }),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white.withOpacity(0.15) : null,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(
            profileType.toShortString(),
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
