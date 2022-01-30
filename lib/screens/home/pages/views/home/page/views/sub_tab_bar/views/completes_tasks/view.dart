import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/home/pages/views/home/page/views/sub_tab_bar/views/completes_tasks/page/views/card_tit;e.dart';
import 'package:crm/screens/task_completed_datails/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: kBackgroundButton,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          // shrinkWrap: true,
          itemCount: 15,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, int index) {
            return InkWell(
              onTap: () {
                Get.to(() => TasksCompletedDetails());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSizedBox(height),
                    const CardTitle(
                      cardTitle: 'إجتماع مناقشة العرض المقدم من العميل',
                    ),
                    buildSizedBox(height),
                    Container(
                      height: height * 0.044,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          buildText(text: '\t\t أ / أحمد علي \t\t\t'),
                          buildText(
                            text: '01097758516 ',
                          ),
                        ],
                      ),
                    ),
                    buildSizedBox(height),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.alarm_add_sharp,
                          color: kPrimaryColor,
                        ),
                        buildText(
                          text: ' Due-date ',
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        buildText(
                          text: '11 :am ',
                        ),
                        SizedBox(
                          width: width * 0.15,
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: kTextColor,
                          size: 18,
                        ),
                        buildText(
                          text: 'اليوم ',
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                     buildText(text:   'am 12 :00  ',),
                      ],
                    ),
                    buildSizedBox(height),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
      height: height * 0.01,
    );
  }

  Text buildText({required String text}) {
    return Text(
      text,
      style: const TextStyle(
          fontFamily: 'Cairo', fontSize: 12, color: Colors.black),
    );
  }
}
