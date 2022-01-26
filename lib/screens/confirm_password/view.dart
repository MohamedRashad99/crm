import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/customTextFeildCrmPassword.dart';
import 'package:crm/screens/components/smallButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_validators/queen_validators.dart';

import 'page/views/title.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Form(
        key:_globalKey ,
        child: Stack(
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
                    const TitleResetPassword(),
                    spacer(height),
                    CustomTextFieldCRM(
                     // label: true,
                      hint: 'Enter New Password ..! ',
                      icon: Icons.lock_outline,
                      dIcon: Icons.lock_outline,
                      type: TextInputType.number,
                      validator: qValidator([
                        const IsRequired(),
                        const Match('Not Matched'),
                        const IsEmail('Your Email Not Valid Try Again ..!  '),
                        const MinLength(8),
                      ]),
                    ),
                   // spacer(height),
                    CustomTextFieldCRM(
                      //label: true,
                      hint: 'Confirm Password ..! ',
                      icon: Icons.lock_outline,
                      dIcon: Icons.lock_outline,
                      type: TextInputType.number,
                      validator: qValidator([
                       const Match('Not Matched'),
                        const IsRequired(),

                        const IsEmail('Your Email Not Valid Try Again ..!  '),
                        const MinLength(8),
                      ]),
                    ),
                    spacer(height),
                   Center(child: SmallButton(onPressed: (){
                    // Get.off(() => const HomeScreen());
                   }, title: 'Sign in',color: kPrimaryColor,)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox spacer(double height) {
    return SizedBox(
      height: height * 0.06,
    );
  }
}

