import 'package:crm/screens/components/constants.dart';
import 'package:flutter/material.dart';

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
          child: Container(
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
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.home,
                    size: 20,
                    color: HexColor('#2972B7'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'الرئيسية',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: HexColor('#2972B7'),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute<void>(
                //       builder: (BuildContext context) => CrmAppLayout(
                //         index: 0,
                //       ),
                //     ));
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.notifications,
                    size: 20,
                    color: HexColor('#2972B7'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'الاشعارات',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: HexColor('#2972B7'),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute<void>(
                //       builder: (BuildContext context) => CrmAppLayout(
                //         index: 1,
                //       ),
                //     ));
              },
            ),

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
                // Navigator.push(
                //     context,
                //     MaterialPageRoute<void>(
                //       builder: (BuildContext context) => ProjectScreen(),
                //     ));
              },
            ),

            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.bubble_chart,
                    size: 20,
                    color: HexColor('#2972B7'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'الوحدات',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: HexColor('#2972B7'),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => AllUnitScreen(
                //         priceFrom: '',
                //         priceto: '',
                //         spaceFrom: '',
                //         spaceTo: '',
                //       ),
                //     ));
              },
            ),

            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 20,
                    color: HexColor('#2972B7'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'التقويم',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: HexColor('#2972B7'),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute<void>(
                //       builder: (BuildContext context) =>
                //           CrmAppLayout(index: 3),
                //     ));
                // ...
              },
            ),
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
                // Navigator.push(
                //     context,
                //     MaterialPageRoute<void>(
                //       builder: (BuildContext context) =>
                //           CustomerManagement(),
                //     ));
              },
            ),
            const SizedBox(
              height: 120,
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
                  Text(
                    'V 1.0',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#626262')),
                  ),
                  const Spacer(),
                  Text(
                    'Powered by Technomasr',
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#626262')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
