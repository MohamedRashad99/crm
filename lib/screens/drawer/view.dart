import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/smallButton.dart';
import 'package:crm/screens/drawer/page/views/list_tile_with_image.dart';
import 'package:crm/screens/drawer/page/views/notifications/view.dart';
import 'package:crm/screens/drawer/page/views/services/view.dart';
import 'package:crm/screens/home/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'page/views/header.dart';
import 'page/views/list_title_normal.dart';
import 'page/views/management_clients/view.dart';
import 'page/views/projects/view.dart';
import 'page/views/unites/view.dart';

Widget drawer({required context}) => Drawer(

      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
         const  Header(),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                ListTitleNormal(
                    title: 'الرئيسية',
                    icon: Icons.home,
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => const HomeTabScreen(index: 0,));
                    }),
                ListTitleNormal(
                    title: 'الاشعارات',
                    icon: Icons.notifications,
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => const NotificationScreen());
                    }),
                ListTileWithImage(
                    title: 'الخدمات',
                    imagePath: 'assets/image/touch_app.png',
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => const ServicesScreen());
                    }),
                ListTileWithImage(
                    title: 'المشروعات',
                    imagePath: 'assets/image/trending_up.png',
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => const ProjectsScreen());
                    }),
                ListTitleNormal(
                    title: 'الوحدات',
                    icon: Icons.bubble_chart,
                    onTap: (){
                      Navigator.pop(context);
                      Get.to(() => const UnitesScreen());
                    }) ,
                ListTitleNormal(
                    title: 'التقويم',
                    icon: Icons.calendar_today,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const HomeTabScreen(index: 2,) ));
                      //Get.to(() => const HomeTabScreen(index: 2,));
                    }),
                  //  onTap: () => Get.to(() => const HomeTabScreen(index: 2,))),
                ListTileWithImage(
                    title: 'ادارة العملاء',
                    imagePath: 'assets/image/Vector111.png',
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => const ManagementClientsScreen());
                    }),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: ()  {
                  },
                  child: SmallButton(
                    onPressed: () {},
                    title: 'تسجيل خروج',
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      endTitle(endTitle: 'V 1.0'),
                      const Spacer(),
                      endTitle(endTitle: 'Powered by Technomasr'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Text endTitle({String? endTitle}) {
  return Text(
    endTitle!,
    style: const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: kTextColor),
  );
}

Text textDescriptions({String? text}) {
  return Text(
    text!,
    style: const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor),
  );
}


