import 'package:crm/config/keys.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/customTextFieldCrmPhone.dart';
import 'package:crm/screens/forget_password/page/views/send_code.dart';
import 'package:crm/screens/forget_password/page/views/title.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';

import 'page/views/description.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

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
                    const TitleForgetPassword(),
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
                   const Description(),
                    spacer(height),
                   const  SendCode(),
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

