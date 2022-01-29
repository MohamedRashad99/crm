import 'dart:io';

import 'package:crm/screens/add_new_client/page/views/drop_down_items.dart';
import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/notes_textformfield.dart';
import 'package:crm/screens/drawer/view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewFollowUp extends StatefulWidget {
  const NewFollowUp({Key? key}) : super(key: key);

  @override
  State<NewFollowUp> createState() => _NewFollowUpState();
}

class _NewFollowUpState extends State<NewFollowUp> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
          isIcons: true,
          icons: Icons.arrow_forward_ios,
          title: "متابعة جديدة",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          color: kHomeColor,
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        maxRadius: 15,
                        child: Image.asset('assets/image/Group 6865.png'),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildRow(
                            title: 'الاسم',
                            subTitle: ': Ahmed Samir ',
                          ),
                          buildRow(
                            callPhone: () {
                              // launch(('tel://${item.mobile_no}'));
                            },
                            title: 'رقم الهاتف',
                            subTitle: ' : 01097758516',
                          ),
                          buildRow(
                            callPhone: () {
                              openWhatsApp(context);
                            },
                            title: 'رقم الواتس أب',
                            subTitle: ' : 01097758516',
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              buildContainer(
                                  background: kRoundColor,
                                  width: width * 0.25,
                                  color: kTextColor,
                                  title: 'صفحة فيس بوك'),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              buildContainer(
                                background: kPrimaryColor,
                                width: width * 0.25,
                                color: kTextColor,
                                title: 'عملاء المتابعات',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),

              buildText(title: ' * الاسم'),
              SizedBox(
                height: height * 0.015,
              ),
              DropDownList(width: width * 0.9),
              buildText(title: ' * الوحدات'),
              SizedBox(
                height: height * 0.015,
              ),
              DropDownList(width: width * 0.9),
              buildText(title: ' * تاريخ المكالمة'),
              SizedBox(
                height: height * 0.015,
              ),
              DropDownList(width: width * 0.9),
              buildText(title: ' * الملاحظات'),
              SizedBox(
                height: height * 0.015,
              ),
              NotesCustomTextField(
                onTap: () {},
                hint: 'ملاحظات',
              ),
              InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Image.asset(
                        'assets/image/submit.png',
                        height: 40,
                        width: 40,
                      ))),
            ],
          ),
        ),
      ),
    );
  }

  Text buildText({required String title}) {
    return Text(
      title,
      style: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: kTextColor),
    );
  }


  Container buildContainer(
      {required double width,
      required Color background,
      required Color color,
      required String title}) {
    return Container(
      color: background,
      //width*0.25
      width: width,
      child: Center(
        child: Text(
          //'صفحة فيس بوك',
          title,
          style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              // color: kTextColor
              color: color),
        ),
      ),
    );
  }

  InkWell buildRow({
    VoidCallback? callPhone,
    required String title,
    required String subTitle,
  }) {
    return InkWell(
      onTap: callPhone,
      child: Row(
        children: [
          Text(
            title,
            //'الاسم',
            style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: kTextColor),
          ),
          Text(
            // ': Ahmed Samir ',
            subTitle,
            style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: kTextColor),
          ),
        ],
      ),
    );
  }

  openWhatsApp(BuildContext context) async {
    var whatsApp = "+919144040888";
    var whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsApp + "&text=hello";
    var whatappURLIos = "https://wa.me/$whatsApp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    }
  }
}
