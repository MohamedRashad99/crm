import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/drawer.dart';
import 'package:flutter/material.dart';

class ManagementClientsScreen extends StatefulWidget {
  const ManagementClientsScreen({Key? key}) : super(key: key);

  @override
  State<ManagementClientsScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<ManagementClientsScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundButton,
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
          title: "إدارة العملاء",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: const Center(
        child: Text(
          'Management Clients',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
