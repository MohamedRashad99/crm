// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:crm/screens/add_new_client/page/views/drop_down_items.dart';
import 'package:crm/screens/add_new_client/view.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/customTextFeild.dart';
import 'package:crm/screens/components/new_client_textfield.dart';
import 'package:crm/screens/components/notes_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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
    void addNewClientShowModalBottomSheet() {
      showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        builder: (_) {
          // Timer(Duration(seconds: 20), () {
          //   Navigator.of(context).pop();
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          // });
          return Container(
            height: height * 0.9,
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
            child: StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                        ],
                      ),
                    ),
                  );
                }),
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
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
              // modalBottomSheetMenuInTaskList(context);
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
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => AddLead()));
              //  Get.to(()=>const AddNewClient());
              addNewClientShowModalBottomSheet();
            },
          ),
        ],
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
}
