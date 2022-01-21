import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/vcode_forget/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SendCode extends StatelessWidget {
  const SendCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Container(
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

              Get.to(() => const VCodeForgetScreen());
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
    );
  }
}
