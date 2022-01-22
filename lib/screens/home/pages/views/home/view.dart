import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/drawer.dart';
import 'package:flutter/material.dart';

import '../buttons_naviagtion_bar.dart';
import '../speed_dial.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final ItemsBar _itemsBar = ItemsBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundButton,
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
          title: "الرئيسية",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: const Center(
        child: Text(
          'Index 0: Home',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionView(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _onItemTapped(index);
            });
          },
          items: _itemsBar.itemsBar,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: HexColor('#2972B7')),
          unselectedLabelStyle: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: HexColor('#626262')),
          iconSize: 25,
        ),
      ),
    );
  }
}
