import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/home/pages/views/buttons_naviagtion_bar.dart';
import 'package:crm/screens/home/pages/views/calendars/view.dart';
import 'package:crm/screens/home/pages/views/home/view.dart';
import 'package:crm/screens/home/pages/views/search/view.dart';
import 'package:crm/screens/home/pages/views/tasks/view.dart';
import 'package:flutter/material.dart';
import 'pages/views/speed_dial.dart';
class MainScreen extends StatefulWidget {
   final int index;
   const MainScreen({Key? key, this.index =0 }) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  static const List<Widget> _widgetOptions = <Widget>[
   HomeScreen(),
   // NotificationScreen(),
    TasksScreen(),
    CalendarScreen(),
    SearchScreen(),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
   _selectedIndex = widget.index;
    super.initState();}
  final ItemsBar _itemsBar = ItemsBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
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
