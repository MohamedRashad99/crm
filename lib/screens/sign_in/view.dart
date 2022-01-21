import 'package:crm/screens/components/CustomTextFeildCrmEmail.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/customTextFeildCrmPassword.dart';
import 'package:crm/screens/components/donotHave.dart';
import 'package:crm/screens/components/smallButton.dart';
import 'package:crm/screens/forget_password/view.dart';
import 'package:crm/screens/home/view.dart';
import 'package:crm/screens/sign_up/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_validators/queen_validators.dart';

class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/Sign In (1).png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 320),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFieldCrmEmail(
                      dIcon: Icons.email,
                      label: true,
                      hint: 'Enter Your Phone Please ..? ',
                      validator: qValidator([
                        const IsRequired(),
                        const IsEmail('Your Email Not Valid Try Again ..! '),
                        const MinLength(8),
                      ]),
                    ),
                    buildSizedBox(height),
                    CustomTextFieldCRM(
                      label: true,
                      hint: 'Password ..! ',
                      icon: Icons.lock_outline,
                      dIcon: Icons.lock_outline,
                      type: TextInputType.number,
                      validator: qValidator([
                        const IsRequired(),
                        const IsEmail('Your Email Not Valid Try Again ..!  '),
                        const MinLength(8),
                      ]),
                    ),
                    buildSizedBox(height),
                    InkWell(
                      onTap: () => Get.to(() => const ForgetPasswordScreen()),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: const Text("Forget Password ?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: kBlackText,
                                fontFamily: "Cairo")),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Center(
                        child: SmallButton(
                      onPressed: () {
                        Get.to(() => const HomeScreen());
                      },
                      title: 'Sign in ',
                      color: kPrimaryColor,
                    )),
                    Center(
                        child: DoNotHave(
                      have: 'Don`t have an account? ',
                      text: 'Sign up',
                      route: () => Get.to(() => const SignUpScreen()),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
                  height: height * 0.01,
                );
  }
}
