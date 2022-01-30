import 'dart:async';
import 'package:crm/local_storage/local_storage.dart';
import 'package:crm/screens/home/view.dart';
import 'package:crm/screens/onboarding/view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      bool isBoarding = LocalStorage.getBool('onBoarding');
      if (isBoarding) {
        Get.offAll(() => const HomeTabScreen());
      } else {
        Timer(const Duration(seconds: 2),
            () => Get.offAll(() => const OnBoardingScreen()));
      }
    });
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/image/splash.png",
          fit: BoxFit.fill,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                    'assets/image/3.png',
                  )),
                  shape: BoxShape.circle,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    ));
  }
}
