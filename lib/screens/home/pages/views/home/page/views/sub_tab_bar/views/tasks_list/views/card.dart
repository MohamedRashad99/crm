import 'package:crm/screens/add_new_task/page/views/search/search.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/notes_textformfield.dart';
import 'package:crm/screens/components/smallButtonSizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOfCard extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback circleOnTap;
  final String headTitle;
  final String clientName;
  final String clientPhone;
  final String date;
  final String time;

  const ListOfCard(
      {Key? key,
      required this.onTap,
      required this.circleOnTap,
      required this.headTitle,
      required this.clientName,
      required this.clientPhone,
      required this.date,
      required this.time})
      : super(key: key);

  @override
  State<ListOfCard> createState() => _ListOfCardState();
}

class _ListOfCardState extends State<ListOfCard> {
  @override
  Widget build(BuildContext context) {
    String _value = "";
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (ctx, index) => InkWell(
                onTap: widget.onTap,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: widget.circleOnTap,
                            child: const Icon(
                              Icons.circle_outlined,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ),
                          buildSizedBox(width),
//'إجتماع مناقشة العرض المقدم من العميل'
                          buildHeadExpandableTitle(headTitle: widget.headTitle),
                          //  : Container(),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            height: height * 0.044,
                            width: width * 0.5,
                            decoration: BoxDecoration(
                              color: kBackgroundColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  //أ / أحمد علي
                                  '\t\t ${widget.clientName} \t\t\t',
                                  style: const TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 12,
                                      color: Colors.black),
                                ),
                                Text(
                                  // '01097758516 ',
                                  widget.clientPhone,
                                  style: const TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 12,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuButton(
                            color: kHomeColor,

                            /// TODO: OverFlow
                            padding: const EdgeInsets.only(right: 40),
                            enabled: true,

                            onSelected: (value) {
                              setState(() {
                                _value = value.toString();
                              });
                            },
                            itemBuilder: (ctx) => [
                              PopupMenuItem(
                                onTap: () =>
                                    _modifyingDeletingClientTaskBottomSheetModelSheet(
                                  context,
                                  height,
                                  width,
                                ),
                                child: const Text(
                                  "تعديل",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                value: "first",
                              ),
                              PopupMenuItem(
                                onTap: () async {
                                  await showConfirmationDialog(
                                    context,
                                    done: SmallButtonSizer(
                                      onPressed: () async {
                                        // Navigator.pop(context);
                                        await showConfirmationDialog(context,
                                            title: 'رسالة نجاح متغيرة',
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
                                child:const  Text(
                                  "حذف",
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 12,
                                      color: kButtonRedDark,
                                      fontWeight: FontWeight.bold),
                                ),
                                value: "Second",
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.alarm,
                              color: kPrimaryColor,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            //'15 Sep'
                            buildTextDate(dateTime: widget.date),
                            const SizedBox(
                              width: 20,
                            ),
                            // '9:00 am'
                            buildTextDate(
                              dateTime: widget.time,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => customDivider2(5),
          itemCount: 7),
    );
  }

  Text buildTextDate({required String dateTime}) {
    return Text(
      dateTime,
      style: const TextStyle(
          fontFamily: "Cairo,",
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.red),
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

//Deleting and modifying the client assignment
  Future<void> _modifyingDeletingClientTaskBottomSheetModelSheet(
    BuildContext context,
    double height,
    double width,
  ) async {
    Scaffold.of(context).showBottomSheet(
      (_) {
        // Timer(Duration(seconds: 20), () {
        //   Navigator.of(context).pop();
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        // });

        return Container(
          height: height * 0.4,
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
                        SizedBox(
                          height: height * 0.02,
                        ),
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
                        SizedBox(
                          height: height * 0.02,
                        ),
                        NotesCustomTextField(
                          onTap: () {},
                          hint: 'ملاحظات',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                await showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                    title: const Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: SearchOnClient(
                                            hintText: 'البحث',
                                          )),
                                    ),
                                    content: Card(
                                      child: SizedBox(
                                        height: height * 0.6,
                                        child: ListView.builder(
                                            itemCount: 9,
                                            itemBuilder: (context, int index) {
                                              return ListTile(
                                                onTap: () {},
                                                trailing: titleOfTextField(
                                                    title: 'عميل - 1'),
                                                leading: titleOfTextField(
                                                    title: '01097758516'),
                                              );
                                            }),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: height * 0.05,
                                width: width * 0.2,
                                decoration: BoxDecoration(
                                  color: kBackgroundButton,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                    child: Text(
                                  'أختر العميل',
                                  style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: kTextColor),
                                )),
                              ),
                            ),
                            InkWell(
                                onTap: () async {
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
                                },
                                child: const Icon(
                                  Icons.date_range_outlined,
                                  color: kPrimaryColor,
                                )),
                            Container(
                              height: height * 0.05,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                color: kBackgroundButton,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                  child: Text(
                                'عرض التاريخ',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: kTextColor),
                              )),
                            ),
                            InkWell(
                                onTap: () async {
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
                                },
                                child: const Icon(
                                  Icons.access_alarm_outlined,
                                  color: kPrimaryColor,
                                )),
                            Container(
                              height: height * 0.05,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                color: kBackgroundButton,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                  child: Text(
                                'عرض الساعه',
                                style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: kTextColor),
                              )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: Image.asset(
                                  'assets/image/submit.png',
                                  height: 40,
                                  width: 40,
                                ))),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
      // isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // context: context,
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
