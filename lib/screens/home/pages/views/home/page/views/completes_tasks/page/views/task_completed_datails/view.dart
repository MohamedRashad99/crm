import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/notes_textformfield.dart';
import 'package:crm/screens/components/smallButton.dart';
import 'package:crm/screens/drawer/view.dart';
import 'package:flutter/material.dart';
class TasksCompletedDetails extends StatelessWidget {
   TasksCompletedDetails({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
        isIcons: true,
          icons: Icons.arrow_forward_ios,
          title: "تفاصيل المهام المكتملة",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: Directionality(
       textDirection:TextDirection.rtl ,
        child: Container(
padding: EdgeInsets.symmetric(horizontal: 12),
          color: kHomeColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.02,),
              Text(
                'إجتماع مناقشة العرض المقدم من العميل',
                style:  TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: height*0.02,),
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
                  ]

              ),
              SizedBox(height: height*0.02,),
              Row(
                children: [
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
                ],
              ),
              SizedBox(height: height*0.04,),
              Text(
                'ملاحظات',
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              NotesCustomTextField(onTap: (){},hint: 'كتابة ملاحظات',),
              Center(child: SmallButton(onPressed: (){}, title: 'حفظ',color: kPrimaryColor,)),


          ],),
        ),
      ),
    );
  }
}
