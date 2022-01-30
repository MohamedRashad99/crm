import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/home/pages/views/home/page/views/sub_tab_bar/views/tasks_list/view.dart';
import 'package:flutter/material.dart';

import 'views/completes_tasks/view.dart';


class SubTabBar extends StatefulWidget {
  const SubTabBar({Key? key}) : super(key: key);

  @override
  _SubTabBarState createState() => _SubTabBarState();
}

class _SubTabBarState extends State<SubTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        controller: _tabController,
        labelColor: HexColor('#2972B7'),
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
          // first tab [you can add an icon using the icon property]
          Tab(
            text: 'مهام مكتمله',
          ),
          Tab(
            text: 'قائمة المهام',
          ),
        ],
      ),
      body: TabBarView(controller: _tabController, children: const [
        CompletedTasks(),
        TasksList(),
      ]),
    );
  }
}
