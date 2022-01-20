import 'package:crm/screens/components/cach_helper.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/mediaButton.dart';
import 'package:crm/screens/sign_in_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'page/views/custom_content.dart';
import 'page/views/data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  var boardController = PageController();

  Content content = Content();

  void submit() {

    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        Get.off(() => const SignInScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kLightText,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == content.boarding.length - 1) {
                    setState(() {
                      isLast = true;
                      //Get.offAll(()=> const SignInScreen());
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    ShowContent(model: content.boarding[index]),
                itemCount: content.boarding.length,
              ),
            ),
            isLast
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: MediaButton(
                        color: kPrimaryColor,
                        onPressed: () => Get.offAll(() => const SignInScreen()),
                        title: 'تسجيل الدخول'),
                  )
                : const SizedBox(),
            SmoothPageIndicator(
              controller: boardController,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: kPrimaryColor,
                dotHeight: 10,
                expansionFactor: 2,
                dotWidth: 10,
                spacing: 5.0,
              ),
              count: content.boarding.length,
            ),
          ],
        ),
      ),
    );
  }
}
