import 'package:crm/screens/components/constants.dart';
import 'package:flutter/material.dart';
class TitleResetPassword extends StatelessWidget {
  const TitleResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28,),
      width: width*0.7,
      child: Text(
        'Confirm password?',
        maxLines: 3,
        style: TextStyle(
            fontFamily: 'Cairo',
            height: 1.1,
            color: HexColor('#2972B7'),
            fontSize: 40,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
