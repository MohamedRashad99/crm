// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:crm/screens/add_new_client/page/views/drop_down_items.dart';
import 'package:crm/screens/add_new_client/view.dart';
import 'package:crm/screens/add_new_task/page/views/search/search.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/customTextFeild.dart';
import 'package:crm/screens/components/new_client_textfield.dart';
import 'package:crm/screens/components/notes_textformfield.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingActionView extends StatefulWidget {
  @override
  State<FloatingActionView> createState() => _FloatingActionViewState();
}

class _FloatingActionViewState extends State<FloatingActionView> {
  String dropdownValue = 'Class A';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4,right: 10),
      child: SpeedDial(
        foregroundColor: Colors.white,
        overlayColor: kBackgroundButton,
        backgroundColor: kRoundColor,
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 3,
        openCloseDial: isDialOpen,
        childPadding: const EdgeInsets.all(10),
        spaceBetweenChildren: 4,
        dialRoot: customDialRoot
            ? (ctx, open, toggleChildren) {
                return ElevatedButton(
                  onPressed: toggleChildren,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 18),
                  ),
                  child: const Text(
                    "Custom Dial Root",
                    style: TextStyle(fontSize: 17),
                  ),
                );
              }
            : null,
        buttonSize: buttonSize,
        label: extend ? const Text("Open") : null,
        activeLabel: extend ? const Text("Close") : null,
        childrenButtonSize: buttonSize,
        visible: visible,
        direction: speedDialDirection,
        switchLabelPosition: switchLabelPosition,
        closeManually: closeManually,
        renderOverlay: renderOverlay,
        useRotationAnimation: useRAnimation,
        tooltip: 'Open Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        elevation: 0.0,
        isOpenOnStart: false,
        animationSpeed: 200,
        childMargin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          SpeedDialChild(
            labelStyle: const TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white),
            child: const Icon(Icons.check_circle_outline_outlined),
            backgroundColor: Colors.white,
            labelBackgroundColor: HexColor('#2972B7'),
            foregroundColor: HexColor('#2972B7'),
            label: 'مهمة جديدة',
            onTap: () {
              addNewTaskShowModalBottomSheet(context ,height,width);
            },
          ),
          SpeedDialChild(
            labelStyle: const TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white),
            child: Image.asset(
              'assets/image/Vector111.png',
            ),
            backgroundColor: Colors.white,
            labelBackgroundColor: HexColor('#2972B7'),
            foregroundColor: HexColor('#2972B7'),
            label: 'عميل جديد',
            onTap: () {

              addNewClientShowModalBottomSheet(context ,height,width);
            },
          ),
        ],
      ),
    );
  }



  var renderOverlay = true;

  var visible = true;

  var switchLabelPosition = false;

  var extend = false;

  var rmIcons = false;

  var customDialRoot = false;

  var closeManually = false;

  var useRAnimation = true;

  var buttonSize = const Size(56.0, 56.0);

  var isDialOpen = ValueNotifier<bool>(false);

  var speedDialDirection = SpeedDialDirection.up;

  var selectLocation = FloatingActionButtonLocation.endDocked;

  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];
  void addNewClientShowModalBottomSheet(BuildContext context , double height ,double width , ) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: height * 0.9,
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
            child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: ListView(
                        children: [
                          SizedBox(height: height*0.02,),
                          const Text(
                            'إضافة عميل جديد',
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
                  );
                }),
          ),
        );
      },
    );
  }


  void addNewTaskShowModalBottomSheet(BuildContext context , double height ,double width , ) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: height * 0.4,
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
            child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView(

                      children: [
                        SizedBox(height: height*0.02,),
                        const Center(
                          child: Text(
                            'إضافة مهمة جديدة',
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(height: height*0.02,),
                        NotesCustomTextField(onTap: (){},hint: 'ملاحظات',),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: ()async{

                               await showDialog<String>(
                                  context: context,

                                  builder: (BuildContext context) =>  CupertinoAlertDialog(
                                      title:    const Card(
                                      shape:RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                         Radius.circular(10),),),
                                        child:  Directionality(textDirection: TextDirection.rtl,child: SearchOnClient(hintText: 'البحث',)),
                                      ),
                                      content: Card(
                                        child: SizedBox(
                                          height: height*0.6,
                                          child: ListView.builder(
                                              itemCount: 9,
                                              itemBuilder: (context ,int index){
                                            return ListTile(  onTap: (){},trailing: titleOfTextField(title: 'عميل - 1'),leading: titleOfTextField(title: '01097758516'),
                                            );
                                          }),
                                        ),
                                      ),

                                    ),
                                  );





                              },
                              child: Container(
                                height: height*0.05,
                                width: width*0.2,
                                decoration: BoxDecoration(
                                  color: kBackgroundButton,
                                  borderRadius: BorderRadius.circular(8),
                              ),
                                child:const  Center(child: Text('أختر العميل' , style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color:kTextColor),)),
                              ),
                            ),
                            InkWell(onTap: ()async{

                              await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2021, 1, 1),
                                  lastDate: DateTime(2030, 1, 1),
                              //     if(picked != null && picked != selectedDate){
                              //   setState(() {
                              //     selectedDate = picked;
                              //   });
                              // }

                                );

                            },child:const Icon(Icons.date_range_outlined ,color: kPrimaryColor,)),
                            Container(
                              height: height*0.05,
                              width: width*0.2,
                              decoration: BoxDecoration(
                                color: kBackgroundButton,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child:const  Center(child: Text('عرض التاريخ' , style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color:kTextColor),)),
                            ),
                            InkWell(onTap: ()async{

                              await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                confirmText: 'Ok',
                                cancelText: 'Cancel',


                                // builder: (BuildContext context, Widget child) {
                                //   return Directionality(
                                //     textDirection: TextDirection.rtl,
                                //     child: child,
                                //   );
                                // },
                              );

                            },child:const Icon(Icons.access_alarm_outlined ,color: kPrimaryColor,)),
                            Container(
                              height: height*0.05,
                              width: width*0.2,
                              decoration: BoxDecoration(
                                color: kBackgroundButton,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child:const  Center(child: Text('عرض الساعه' , style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color:kTextColor),)),
                            ),
                          ],
                        ),
                        SizedBox(height: height*0.02,),
                        InkWell(onTap: ()=>Navigator.of(context).pop(),child: Align(alignment: AlignmentDirectional.bottomEnd,child: Image.asset('assets/image/submit.png',height: 40,width: 40,))),
                      ],
                    ),
                  );
                }),
          ),
        );
      },
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
