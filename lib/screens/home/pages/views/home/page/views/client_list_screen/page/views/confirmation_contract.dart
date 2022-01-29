import 'dart:html';

import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/smallButtonSizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox();
  }
  Future <void> showConfirmationDialog (BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return    showDialog<String> (
      context: context,

      builder: (BuildContext context) =>  CupertinoAlertDialog(
        title: Image.asset(
          'assets/image/icons8-handshake-100 1.png',
          width: width*2,
          height: height*0.15,
          fit: BoxFit.contain,),


        content:  Directionality(textDirection: TextDirection.rtl,
            child: SizedBox(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.02,),

                  const Text('هل انت متأكد من إتمام التعاقد ونقل العميل الى العملاء المتعاقدين!',

                    style:  TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: kBlackText),
                  ),
                  SizedBox(height: height*0.02,),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SmallButtonSizer(onPressed: (){
                          return ;
                        }, title: 'تاكيد',color: kTextColor,),
                        SmallButtonSizer(onPressed: (){
                          return ;
                        }, title: 'إلغاء',color: kButtonRedDark),

                      ],
                    ),
                  ),

                ],
              ),
            )),

      ),
    );
  }

}
