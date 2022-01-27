import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/home/pages/views/home/page/views/sub_tab_bar_content.dart';
import '../../../../drawer/view.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kBackgroundButton,
      key: _scaffoldKey,
      drawer: drawer(context: context),

      appBar: customAppbar(
          title: "المهام",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context
      ),
      body: SubTabBar()
    );
  }
}
