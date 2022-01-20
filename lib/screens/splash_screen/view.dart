import 'dart:async';
import 'dart:developer';

import 'package:crm/screens/components/cach_helper.dart';
import 'package:crm/screens/onboarding_screen/view.dart';
import 'package:crm/screens/sign_in_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Get.off(() => const OnBoardingScreen()));

/*    Widget widget;
    bool onBoarding = CacheHelper.getData(key: 'onBoarding');
    String token = CacheHelper.getData(key: 'token');
    log(token);

    // ignore: unnecessary_null_comparison
    if (onBoarding != null) {
      // ignore: unnecessary_null_comparison
      if (token != null) {
        /// TODO: Must Navigate to HOME PAGE
        widget = const SignInScreen();
      } else {
        widget = const SignInScreen();
      }
    } else {
      widget = const OnBoardingScreen();
    }*/
  }

  @override
  Widget build(BuildContext context) {
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
