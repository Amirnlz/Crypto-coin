import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import '../../constant/constans.dart';
import '../components/bottom_nav_bar.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<Slide> slides = [];
  final double imageHeight = 300;
  final double imageWidth = 400;

  @override
  void initState() {
    super.initState();
    createSlides();
  }

  void createSlides() {
    slides.add(
      Slide(
        title: 'Welcome to the app',
        styleTitle: titleStyle(),
        description:
            'This is a demo app to showcase the cryptocurrency market. Tap on the dots below to navigate through the slides.',
        styleDescription: descriptionStyle(),
        pathImage: 'assets/images/Bitcoin-pana.png',
        backgroundColor: Colors.white,
        widthImage: imageWidth,
        heightImage: imageHeight,
      ),
    );
    slides.add(
      Slide(
        title: 'Cryptocurrency',
        styleTitle: titleStyle(),
        description:
            'Cryptocurrency is a digital asset that is used to create, store, and transfer value. It is a digital currency that is used to pay for goods and services.',
        styleDescription: descriptionStyle(),
        pathImage: 'assets/images/Bitcoin P2P-cuate.png',
        backgroundColor: Colors.white,
        widthImage: imageWidth,
        heightImage: imageHeight,
      ),
    );
    slides.add(
      Slide(
        title: 'Portfolio',
        styleTitle: titleStyle(),
        description: 'Track your cryptocurrency portfolio in realtime.',
        styleDescription: descriptionStyle(),
        pathImage: 'assets/images/Crypto portfolio-rafiki.png',
        backgroundColor: Colors.white,
        widthImage: imageWidth,
        heightImage: imageHeight,
      ),
    );
  }

  TextStyle titleStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle descriptionStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 20.0,
    );
  }

  void onDonePress() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavBar()),
    );
  }

  Widget renderNextBtn() {
    return const Icon(
      Icons.navigate_next,
      color: blueColor,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return const Icon(
      Icons.done,
      color: blueColor,
    );
  }

  Widget renderSkipBtn() {
    return const Icon(
      Icons.skip_next,
      color: blueColor,
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(greyColor),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0x334481F1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroSlider(
        slides: slides,
        renderSkipBtn: renderSkipBtn(),
        skipButtonStyle: myButtonStyle(),
        renderNextBtn: renderNextBtn(),
        nextButtonStyle: myButtonStyle(),
        renderDoneBtn: renderDoneBtn(),
        onDonePress: onDonePress,
        doneButtonStyle: myButtonStyle(),
        colorDot: const Color(0x33FFA8B0),
        colorActiveDot: blueColor,
        sizeDot: 13.0,
      ),
    );
  }
}
