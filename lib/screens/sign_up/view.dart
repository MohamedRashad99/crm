import 'package:crm/config/keys.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/customTextFieldCrmPhone.dart';
import 'package:crm/screens/vcode/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_validators/queen_validators.dart';

import 'page/views/title.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/Forgot password.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleSignUp(),
                  spacer(height),
                  CustomTextFieldCrmPhone(
                    dIcon: Icons.phone,
                    label: true,
                    hint: 'Please enter your phone number ..? ',
                    validator: qValidator([
                      const IsRequired(),
                      const IsEmail('Something Error please Try Again ..! '),
                      const MinLength(8),
                    ]),
                  ),
                  spacer(height),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: const Text(KeysConfig.kMessageToKnow,
                        style: TextStyle(
                            fontSize: 14,
                            color: kTextColor,
                            fontFamily: "Cairo")),
                  ),
                  spacer(height),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      children: [
                        const Text(
                          'Send Code',
                          maxLines: 3,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              height: 1.1,
                              color: kBlackText,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: width * 0.4,
                        ),
                        InkWell(
                          onTap: () {

                            Get.to(() => const VCodeScreen());
                          },
                          child: Image.asset(
                            'assets/image/Group.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox spacer(double height) {
    return SizedBox(
      height: height * 0.06,
    );
  }
}

