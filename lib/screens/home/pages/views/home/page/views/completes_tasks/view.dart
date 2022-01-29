import 'package:crm/screens/components/constants.dart';
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
         physics: BouncingScrollPhysics(),
         itemBuilder: (context ,int index){
           return InkWell(
             onTap: (){
Get.to(()=> TasksCompletedDetails());
             },
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: 8),

               color: Colors.white,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:  [
                   SizedBox(height: height*0.01,),
                   Text(
                     'إجتماع مناقشة العرض المقدم من العميل',
                     style:  TextStyle(
                         fontFamily: 'Cairo',
                         fontSize: 12,
                         fontWeight: FontWeight.bold,
                         color: Colors.black),
                   ),
                   SizedBox(height: height*0.01,),
                   Container(
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
                   SizedBox(height: height*0.01,),
                   Row (
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Icon(Icons.alarm_add_sharp,color: kPrimaryColor,),
                       Text(
                         ' Due-date ',
                         style:  TextStyle(
                             fontFamily: 'Cairo',
                             fontSize: 12,

                             color: Colors.black),
                       ),
                       SizedBox(width: width*0.05,),
                       Text(
                         '11 :am ',
                         style:  TextStyle(
                             fontFamily: 'Cairo',
                             fontSize: 12,

                             color: Colors.black),
                       ),
                       SizedBox(width: width*0.15,),

                       Icon(Icons.check_circle,color: kTextColor,size: 18,),
                       Text(
                         'اليوم ',
                         style:  TextStyle(
                             fontFamily: 'Cairo',
                             fontSize: 12,
                             color: Colors.black),
                       ),
                       SizedBox(width: width*0.05,),

                       Text(
                         'am 12 :00  ',
                         style:  TextStyle(
                             fontFamily: 'Cairo',
                             fontSize: 12,
                             color: Colors.black),
                       ),
                     ],
                   ),
                   SizedBox(height: height*0.01,),

                 ],
               ),

             ),
           );
         },
        ),
      ),
    );
  }
}
