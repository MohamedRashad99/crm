import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import '../../../../drawer/view.dart';
import 'package:flutter/material.dart';

import '../buttons_naviagtion_bar.dart';
import '../speed_dial.dart';
import 'page/views/client_list_screen/view.dart';
import 'page/views/sub_tab_bar/view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: kHomeColor,
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
          title: "الرئيسية",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              height: 63,
              decoration: BoxDecoration(
                  color: HexColor('#E6E6E6'),
                  borderRadius: BorderRadius.circular(10)),
              child: TabBar(
                controller: _tabController,
                // indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  color: Colors.white,
                  //E6E6E6
                ),
                labelColor: HexColor('#2972B7'),
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: HexColor('#626262'),
                tabs: const [
                  Tab(
                    text: 'قائمة العملاء',
                  ),
                  Tab(
                    text: 'مهامي',
                  ),
                ],
              ),
            ),
            Expanded(

              child: TabBarView(controller: _tabController, children: const [
                ClientListsScreen(),
                SubTabBar(),
              ]),
            ),
          ],
        ),
      ),

    );
  }
}
