import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/smallButtonSizer.dart';
import 'package:crm/screens/task_completed_datails/view.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/card.dart';
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
                          buildTextNumber(textNumber: '(3)'),
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
                          circleOnTap: () async {
                            await showConfirmationDialog(
                              context,
                              done: SmallButtonSizer(
                                onPressed: () async {
                                  // Navigator.pop(context);
                                  await showConfirmationDialog(context,
                                      title: 'تمت المهة بنجاح',
                                      image: 'assets/image/99 1.png',
                                      cancelled: const SizedBox(),
                                      done: const SizedBox());
                                  Navigator.pop(context);
                                },
                                title: 'تاكيد',
                                color: kTextColor,
                                loadingColor: kPrimaryColor,
                              ),
                              cancelled: SmallButtonSizer(
                                  onPressed: () => Navigator.pop(context),
                                  title: 'إلغاء',
                                  color: kButtonRedDark),
                              image: 'assets/image/99 1.png',
                              title: 'إتمام المهمة',
                            );
                          },
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
                          buildTextNumber(textNumber: '(5)'),
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
                          circleOnTap: () async {
                            await showConfirmationDialog(
                              context,
                              done: SmallButtonSizer(
                                onPressed: () async {
                                  // Navigator.pop(context);
                                  await showConfirmationDialog(context,
                                      title: 'تمت المهة بنجاح',
                                      image: 'assets/image/99 1.png',
                                      cancelled: const SizedBox(),
                                      done: const SizedBox());
                                  Navigator.pop(context);
                                },
                                title: 'تاكيد',
                                color: kTextColor,
                                loadingColor: kPrimaryColor,
                              ),
                              cancelled: SmallButtonSizer(
                                  onPressed: () => Navigator.pop(context),
                                  title: 'إلغاء',
                                  color: kButtonRedDark),
                              image: 'assets/image/99 1.png',
                              title: 'إتمام المهمة',
                            );
                          },
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
    return Text(
      textNumber,
      style: const TextStyle(color: kTextColor),
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
