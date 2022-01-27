import 'package:crm/screens/add_new_task/page/views/search/search.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/notes_textformfield.dart';
import 'package:crm/screens/home/pages/views/home/page/views/completes_tasks/page/views/task_completed_datails/view.dart';
import 'package:crm/screens/home/pages/views/home/page/views/tasks_list/views/card.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        ExpandableNotifier(
          child: Card(
            elevation: 0,
            clipBehavior: Clip.antiAlias,
            color: kRoundBorderColor,
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: true,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          buildHeadExpandableTitle(headTitle: 'اليوم'),
                          buildSizedBox(width),
                          buildTextNumber(textNumber:  '(3)'),

                        ],
                      ),
                    ),
                    collapsed: const Text(
                      "",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: SizedBox(
                      child: ListOfCard(
                          onTap: () => Get.to(() => TasksCompletedDetails()),
                          circleOnTap: () {},
                          headTitle: 'إجتماع مناقشة العرض المقدم من العميل',
                          clientName: 'أ / أحمد علي',
                          clientPhone: '01097758516 ',
                          date: '15 Sep',
                          time: '9:00 am'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ExpandableNotifier(
          child: Card(
            elevation: 0,
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: true,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          buildHeadExpandableTitle(headTitle: 'مهام متاخرة'),
                          buildSizedBox(width),
                          buildTextNumber(textNumber:  '(5)'),
                        ],
                      ),
                    ),
                    collapsed: const Text(
                      "",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: SizedBox(
                      child: ListOfCard(
                          onTap: () => Get.to(() => TasksCompletedDetails()),
                          circleOnTap: () {},
                          headTitle: 'إجتماع مناقشة العرض المقدم من العميل',
                          clientName: 'أ / أحمد علي',
                          clientPhone: '01097758516 ',
                          date: '15 Sep',
                          time: '9:00 am'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Text buildTextNumber({required String textNumber}) {
    return  Text(
                        textNumber ,
                          style: TextStyle(color: kTextColor),
                        );
  }

  SizedBox buildSizedBox(double width) {
    return SizedBox(
      width: width * 0.03,
    );
  }

  Text buildHeadExpandableTitle({
    required String headTitle,
  }) {
    return Text(
      headTitle,
      style: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.bold),
    );
  }
}
