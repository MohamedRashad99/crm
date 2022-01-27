import 'dart:developer';

import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/new_client_textfield.dart';
import 'package:crm/screens/components/profileTextFiledWithoutBoder.dart';
import 'package:crm/screens/components/smallButton.dart';
import 'package:crm/screens/drawer/view.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late String textField;

  late String confirmPassword;
  String name = '' ;
  String phoneNumber = '';
  String email = '';

  String password = '';




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
          isIcons: true,
          icons: Icons.arrow_forward_ios,
          title: "الملف الشخصي",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  bottomSheetUserProfile(
                      context: context,
                      title: 'الأسم',
                      subTitle: name,
                      typeOfTextField: TextInputType.name);
                },
                child: buildContainer(
                  isFound: true,
                  height: height * 0.9,
                  icon: Icons.account_circle_rounded,
                  title: 'الأسم',
                  subTitle:name,
                  dIcon: Icons.arrow_forward_ios,
                ),
              ),
              InkWell(
                onTap: () {
                  bottomSheetUserProfile(
                      context: context,
                      title: 'رقم الهاتف',
                      subTitle: phoneNumber,
                      typeOfTextField: TextInputType.phone);
                },
                child: buildContainer(
                  isFound: true,
                  height: height * 0.9,
                  icon: Icons.phone,
                  title: 'رقم الهاتف',
                  subTitle: phoneNumber,
                  dIcon: Icons.arrow_forward_ios,
                ),
              ),
              InkWell(
                onTap: () {
                  bottomSheetUserProfile(
                      context: context,
                      title: 'البريد الالكتروني',
                      subTitle: email,
                      typeOfTextField: TextInputType.emailAddress);
                },
                child: buildContainer(
                  isFound: true,
                  height: height * 0.9,
                  icon: Icons.mail,
                  title: 'البريد الالكتروني',
                  // subTitle:  'Mohamedrashad@gmail.com',
                  subTitle: email,
                  dIcon: Icons.arrow_forward_ios,
                ),
              ),
              InkWell(
                onTap: () {
                  bottomSheetUserProfile(
                    secandTextFile: true,
                      context: context,
                      title: 'كلمة المرور',
                      subTitle: password,
                      subTitle2: password,
                      typeOfTextField: TextInputType.name);

                },
                child: buildContainer(
                  isFound: true,
                  height: height * 0.9,
                  icon: Icons.lock,
                  title: 'كلمة المرور',
                  subTitle: password,
                  dIcon: Icons.arrow_forward_ios,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  void bottomSheetUserProfile({
    @required context,
    required String title,
    required String subTitle,
     String? subTitle2,
    required TextInputType typeOfTextField,
     bool secandTextFile =false,
    bool isVisableIcon =false,

  }) {
    final  _controller = TextEditingController();
    final  _controller2 = TextEditingController();

    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              primary: true,
              shrinkWrap: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.shrink(),
                        Text(
                          title,
                          style: TextStyle(
                              color: HexColor('#3E5481'),
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),

                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.clear,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    ProfileWithoutBorderTextField(
                      controller: _controller,
                      dIcon: Icons.edit,
                      icon: secandTextFile ? Icons.lock_outline :null ,
                      hint: subTitle,onTap: (){},),
                    secandTextFile ?  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ProfileWithoutBorderTextField(
                        controller: _controller2,
                        dIcon: Icons.edit,
                        icon: Icons.lock_outline,
                      //  dIcon: Icons.lock_outline,
                        hint: subTitle,
                        onTap: (){},),
                    ):SizedBox(),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: SmallButton(
                            onPressed: () {
                              setState(() {
                               switch (title){
                                 case 'الأسم':
                                   name = _controller.text;
                                   Navigator.pop(context);
                                   break;
                                 case 'رقم الهاتف':
                                   phoneNumber = _controller.text;
                                   Navigator.pop(context);
                                   break;
                                 case 'البريد الالكتروني':
                                   email = _controller.text;
                                   Navigator.pop(context);
                                   break;
                                 case 'كلمة المرور':
                                   if(_controller2.text == _controller.text){
                                     password = _controller.text;
                                     Navigator.pop(context);
                                   }else{
                                     log('Not validted');
                                   }
                                   break;
                               }
                              });

                            },
                            color: kPrimaryColor,
                            title: 'تاكيد'))
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget buildContainer({
    double? height,
    required bool isFound,
    required IconData icon,
    required String title,
    required String subTitle,
    required IconData dIcon,
  }) {
    return  ListTile(

    contentPadding: EdgeInsets.zero,
      leading:  Icon(
        icon,
        color: kPrimaryColor,
      ),
      title:  Text(
        // 'الأسم',
        title,
        style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isFound
              ? Text(
            //  'Mohammed Rashad',
            subTitle,
            maxLines: 2,
            style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: kTextColor),
          )
              : SizedBox(),
          SizedBox(width: 10,),

          Icon(
            //Icons.arrow_forward_ios,
            dIcon,
            size: 15,
          ),
        ],
      ),

    );

  }

  Text title({String? title}) {
    return Text(
      title!,
      style: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: kTextColor),
    );
  }
}
