import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import '../drawer/view.dart';
import 'package:flutter/material.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<ProjectsScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundButton,
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
          isIcons: true,
          icons: Icons.arrow_forward_ios,
          title: "المشروعات",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: const Center(
        child: Text(
          'Index 0: Projects',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
