import 'package:crm/screens/add_new_client/page/views/drop_down_items.dart';
import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/new_client_textfield.dart';
import 'package:crm/screens/components/notes_textformfield.dart';
import 'package:crm/screens/drawer/view.dart';
import 'package:flutter/material.dart';
class ClientData extends StatelessWidget {
   ClientData({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
          isIcons: true,
          icons: Icons.arrow_forward_ios,
          title: "بيانات العميل",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body:  Container(
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.02,),
              const Text(
                'تعديل بيانات العميل',
                style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              titleOfTextField(title: '* الإسم'),
              NewClientTextField(
                onTap: () {},
                hint: 'أضف أسم العميل ',
              ),
              titleOfTextField(title: '* رقم الهاتف'),
              NewClientTextField(
                onTap: () {},
                hint: 'أضف رقم الهاتف ',
              ),
              titleOfTextField(title: '* رقم هاتف اّخر'),
              NewClientTextField(
                onTap: () {},
                hint: 'أختياري',
              ),
              titleOfTextField(title: '* العنوان'),
              NewClientTextField(
                onTap: () {},
                hint: 'أضف العنوان ',
              ),
              titleOfTextField(title: '* البريد الإلكتروني'),
              NewClientTextField(
                onTap: () {},
                hint: 'أضف البريد الإلكتروني',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      titleOfTextField(title: '* فئة العميل'),
                      DropDownList(width: width*0.4,),
                    ],
                  ),
                  Column(
                    children: [
                      titleOfTextField(title: '* حالة العميل'),
                      DropDownList(width: width*0.4,),
                    ],
                  )
                ],
              ),
              titleOfTextField(title: '* مصدر العميل'),
              DropDownList(width: width*0.9,),
              SizedBox(height: height*0.02,),
              NotesCustomTextField(onTap: (){},hint: 'ملاحظات',),
              InkWell(onTap: ()=>Navigator.of(context).pop(),child: Align(alignment: AlignmentDirectional.bottomEnd,child: Image.asset('assets/image/submit.png',height: 40,width: 40,))),
            ],
          ),
        ),
      )
    ),
    );
  }
   Text titleOfTextField({String? title}) {
     return Text(
       title!,
       style: const TextStyle(
           fontFamily: 'Cairo',
           fontSize: 14,
           fontWeight: FontWeight.bold,
           color: kTextColor),
     );
   }
}
