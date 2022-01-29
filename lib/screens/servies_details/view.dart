import 'package:crm/config/keys.dart';
import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/drawer/view.dart';
import 'package:crm/screens/home/pages/views/speed_dial.dart';
import 'package:crm/screens/services_category/view.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class ServicesDetailsScreen extends StatefulWidget {
  // final String serviceDetails;
  const ServicesDetailsScreen({
    Key? key,
  }) : super(key: key);

//required this.serviceDetails
  @override
  State<ServicesDetailsScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<ServicesDetailsScreen> {
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
          title: "تفاصيل الخدمة",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSizedBox(height: height * 0.04),
            Center(
              child: Container(
                color: kSkyButton,
                height: height * 0.069,
                width: width * 0.5,
                child: const Center(
                  child: Text(
                    'السعر يبدأ من 3000 ج',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kBlackText),
                  ),
                ),
              ),
            ),
            buildSizedBox(height: height * 0.04),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18),
              child: const Text(
                KeysConfig.kLoramText,
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: kBlackText),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionView(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  SizedBox buildSizedBox({required double height}) {
    return SizedBox(
            height: height,
          );
  }
}
