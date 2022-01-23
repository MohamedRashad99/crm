import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import '../../../../drawer/view.dart';
import 'package:flutter/material.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundButton,
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
          title: "التقويم",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: const Center(
        child: Text(
          'Index 2: Calenders',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),


    );
  }
}
