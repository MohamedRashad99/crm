import 'dart:developer';

import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/customButton.dart';
import 'package:crm/screens/confirm_password/view.dart';
import 'package:crm/screens/vcode_forget/page/views/background.dart';
import 'package:crm/screens/vcode_forget/page/views/title.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
class VCodeForgetScreen extends StatefulWidget {
  const VCodeForgetScreen({Key? key}) : super(key: key);

  @override
  State<VCodeForgetScreen> createState() => _VCodeForgetScreenState();
}

class _VCodeForgetScreenState extends State<VCodeForgetScreen> {
  final TextEditingController  _pinFieldController = TextEditingController();
  int pinLength = 6;
  bool hasError = false;
  bool isLoading = false;
  bool isLoadingResend = false;
  String currentText = "";

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
 late String code;


  final CountdownController _countdownController = CountdownController(autoStart: true);

  void _handleConfirmCode() {
    final text = _pinFieldController.text;
    if (text.isNotEmpty) {
     // ConfirmCodeCubit.of(context).checkCode(_pinFieldController.text);
    }
  }

  @override
  void dispose() {

    //_pinFieldController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Form(
        key:_globalKey ,
        child: Stack(
          children: [
           const BackgroundView(),
            SizedBox(
              height: height,
              width: width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    SizedBox(
                      height: height*0.2,
                    ),
                    const TitleView(),
                    buildSizedBox(height),
                    buildRichText(),
                    buildSizedBox(height),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: buildPinCodeTextField(context),
                    ),
                    buildSizedBox(height),
                    hasError ? Text(
                      hasError ? "*Please fill up all the cells properly" : "",
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ):const SizedBox(),
                    buildRow(),
                    buildSizedBox(height),
                    CustomButton(onPressed: (){
                      Get.to(()=> ResetPasswordScreen());
                    },title: 'VERIFY',color: kPrimaryColor,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  PinCodeTextField buildPinCodeTextField(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      length: 6,
      obscureText: true,
      obscuringCharacter: '*',

      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: qValidator([
        const IsRequired(),
        // const IsEmail('Must be required to verify your number ..! '),
        const MinLength(6),
      ]),
      pinTheme: PinTheme(
        errorBorderColor: Colors.white,
        activeColor: Colors.white,
        selectedColor: Colors.white,
        inactiveColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      // errorAnimationController: errorController,
      controller: _pinFieldController,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset:  Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
      // onCompleted: (v) {
      //     log("Completed");
      //   },
      onCompleted: (_) => _handleConfirmCode(),
      onSubmitted: (_) {},
      onChanged: (_) {},
      // onChanged: (value) {
      //   log('value --------------- $value');
      //   setState(() {
      //    currentText = value;
      //   });
      // },
      beforeTextPaste: (text) {
        log("Allowing to paste $text");
        return true;
      },
    );
  }

  Row buildRow() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code? ",
                    style:  TextStyle(
                        color: Colors.black54, fontSize: 15, fontFamily: 'Cairo'),
                  ),
                  _buildResendCounter(),
                ],
              );
  }

  RichText buildRichText() {
    return RichText(
                text: const TextSpan(
                    text: "Enter the code sent to ",
                    children: [
                       TextSpan(
                          text: "${01097758516}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                              fontSize: 15)),
                    ],
                    style:  TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontFamily: 'Cairo')),
                textAlign: TextAlign.center,
              );
  }


  SizedBox buildSizedBox(double height) {
    return SizedBox(
            height: height*0.04,
          );
  }

  Widget _buildResendCounter() {
    return Countdown(
      seconds: 75,
      controller: _countdownController,
      onFinished: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
              'If you not sent an verification code please try again !',  style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
              fontSize: 12)),
        ),
      );
    },
      build: (context, time) {
        final showResetBottom = time.toInt() == 0;
        final minutes = time >= 60 ? (time / 60).round() : 0;
        final seconds = (time - minutes * 60).round();
        return GestureDetector(
          onTap: () {
            // _handleCodeResend();
            if (showResetBottom) {
              _countdownController.restart();
            }
          },
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'RESEND',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: showResetBottom ? Colors.black : kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$minutes:${seconds < 10 ? 0 : ''}${seconds.toInt()}',
                    style: TextStyle(
                      color: !showResetBottom ? Colors.black : Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
