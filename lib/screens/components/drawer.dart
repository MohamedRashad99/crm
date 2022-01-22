import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/home/pages/views/calendars/view.dart';
import 'package:crm/screens/home/pages/views/home/view.dart';
import 'package:crm/screens/home/pages/views/notifications/view.dart';
import 'package:crm/screens/management_clients/view.dart';
import 'package:crm/screens/projects/view.dart';
import 'package:crm/screens/unites/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget drawer({required context}) => Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("assets/image/menu1.png"),
                      fit: BoxFit.cover)),
              child: SizedBox(
                width: double.infinity,
                height: 350,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 122,
                    width: 122,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                        'assets/image/3.png',
                      )),
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 3,
                            offset: const Offset(0, 3))
                      ],
                    ),

                    // child: Center(child: Text('Logo',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: "Cairo"),)),
                  ),
                ),
              )),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                listTile(
                    title: 'الرئيسية',
                    icon: Icons.home,
                    onTap: () => Get.to(() => const MainScreen())),
                listTile(
                    title: 'الاشعارات',
                    icon: Icons.notifications,
                    onTap: () => Get.to(() => const NotificationScreen())),
                ListTile(
                  title: Row(
                    children: [
                      Image.asset(
                        'assets/image/trending_up.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'المشروعات',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: HexColor('#2972B7'),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.to(() => const ProjectsScreen());
                  },
                ),
                listTile(
                    title: 'الوحدات',
                    icon: Icons.bubble_chart,
                    onTap: () => Get.to(() => const UnitesScreen())),
                listTile(
                    title: 'التقويم',
                    icon: Icons.calendar_today,
                    onTap: () => Get.to(() => const CalendarScreen())),
                ListTile(
                  title: Row(
                    children: [
                      // Icon(Icons.,size: 20,color: HexColor('#2972B7'),),
                      Image.asset(
                        'assets/image/Vector111.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'ادارة العملاء',
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: HexColor('#2972B7'),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    ],
                  ),
                  onTap: () {
                    Get.to(() => const ManagementClientsScreen());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    // AppCubit.get(context).isSignIn = false;
                    // SharedPreferences shared =
                    // await SharedPreferences.getInstance();
                    // shared.clear();
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Splash()));
                  },
                  child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 133,
                    height: 40,
                    decoration: BoxDecoration(
                        color: HexColor('#2972B7'),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                        child: Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      textDescriptions(text: 'V 1.0'),
                      const Spacer(),
                      textDescriptions(
                        text: 'Powered by Technomasr',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Text textDescriptions({String? text}) {
  return Text(
    text!,
    style: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: HexColor('#626262')),
  );
}

ListTile listTile({String? title, IconData? icon, VoidCallback? onTap}) {
  return ListTile(
    title: Row(
      children: [
        Icon(
          icon,
          //Icons.home,
          size: 20,
          color: HexColor('#2972B7'),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          title!,
          style: TextStyle(
              fontFamily: 'Cairo',
              color: HexColor('#2972B7'),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        )
      ],
    ),
    //  onTap: () {
    // Get.to(()=>const MainScreen());
    //  },
    onTap: onTap,
  );
}
