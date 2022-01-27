import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/home/pages/views/home/page/views/completes_tasks/page/views/task_completed_datails/view.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ExpandableNotifier(
            child: Column(
              children: [
                Card(
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
                                      children:  [
                                        const  Text(
                                          'اليوم',
                                          style: TextStyle(
                                              fontFamily: 'Cairo',
                                              fontSize: 13,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: width*0.03,
                                        ),
                                        const   Text(
                                          '(3)',
                                          style: TextStyle(color: kTextColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  collapsed: const Text(
                                    "",
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  expanded: Container(
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        primary: false,
                                        itemBuilder: (context, index) => InkWell(
                                          onTap: () {
                                            Get.to(()=>TasksCompletedDetails());
                                          },
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons.circle_outlined,
                                                        color: Colors.blue,
                                                        size: 20,
                                                      ),
                                                    ),
                                                    SizedBox(width: width*0.03),

                                                    const Text(
                                                      'إجتماع مناقشة العرض المقدم من العميل',
                                                      style:  TextStyle(
                                                          fontFamily: 'Cairo',
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    //  : Container(),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height*0.01,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 25),
                                                  height: height*0.044,
                                                  width: width*0.5,
                                                  decoration: BoxDecoration(color: kBackgroundColor, borderRadius: BorderRadius.circular(15),),
                                                  child: Row (
                                                    children:const [
                                                      Text(
                                                        '\t\t أ / أحمد علي \t\t\t',
                                                        style:  TextStyle(
                                                            fontFamily: 'Cairo',
                                                            fontSize: 12,

                                                            color: Colors.black),
                                                      ),
                                                      Text(
                                                        '01097758516 ',
                                                        style:  TextStyle(
                                                            fontFamily: 'Cairo',
                                                            fontSize: 12,
                                                            color: Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: height*0.01,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 25),
                                                  child: Row(

                                                    children:const [
                                                      Icon(
                                                        Icons.alarm,
                                                        color: kPrimaryColor,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        '15 Sep',
                                                        style: TextStyle(
                                                            fontFamily: "Cairo,",
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.red),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),

                                                      Text(
                                                        '9:00 am',
                                                        style: TextStyle(
                                                            fontFamily: "Cairo,",
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.red),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        separatorBuilder: (context, index) =>
                                            customDivider(5),
                                        itemCount: 1),
                                  )))
                        ])),

              ],
            )),
        ExpandableNotifier(
          child: Column(
            children: [
              Card(
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
                                    children:  [
                                      const  Text(
                                        'مهام متأخرة ',
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: width*0.03,
                                      ),
                                      const   Text(
                                        '(5)',
                                        style: TextStyle(color: kTextColor),
                                      ),
                                    ],
                                  ),
                                ),
                                collapsed: const Text(
                                  "",
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                expanded: Container(
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          Get.to(()=>TasksCompletedDetails());

                                        },
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {},
                                                    child: const Icon(
                                                      Icons.circle_outlined,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  SizedBox(width: width*0.03),

                                                  const Text(
                                                    'إجتماع مناقشة العرض المقدم من العميل',
                                                    style:  TextStyle(
                                                        fontFamily: 'Cairo',
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  //  : Container(),
                                                ],
                                              ),
                                              SizedBox(
                                                height: height*0.01,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 25),
                                                height: height*0.044,
                                                width: width*0.5,
                                                decoration: BoxDecoration(color: kBackgroundColor, borderRadius: BorderRadius.circular(15),),
                                                child: Row (
                                                  children:const [
                                                    Text(
                                                      '\t\t أ / أحمد علي \t\t\t',
                                                      style:  TextStyle(
                                                          fontFamily: 'Cairo',
                                                          fontSize: 12,

                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      '01097758516 ',
                                                      style:  TextStyle(
                                                          fontFamily: 'Cairo',
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: height*0.01,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 25),
                                                child: Row(

                                                  children:const [
                                                    Icon(
                                                      Icons.alarm,
                                                      color: kPrimaryColor,
                                                      size: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      '15 Sep',
                                                      style: TextStyle(
                                                          fontFamily: "Cairo,",
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.red),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),

                                                    Text(
                                                      '9:00 am',
                                                      style: TextStyle(
                                                          fontFamily: "Cairo,",
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.red),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      separatorBuilder: (context, index) =>
                                          customDivider(5),
                                      itemCount: 2),
                                )))
                      ])),
            ],
          ),
        ),


      ],
    );
  }
}
