import 'dart:io';

import 'package:crm/screens/add_new_task/page/views/search/search.dart';
import 'package:crm/screens/archives/view.dart';
import 'package:crm/screens/client_data/view.dart';
import 'package:crm/screens/components/CustomButtonSizer.dart';
import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/components/smallButtonSizer.dart';
import 'package:crm/screens/drawer/page/views/management_clients/page/views/custom_dimissible.dart';
import 'package:crm/screens/home/pages/views/home/page/views/client_list_screen/view.dart';
import 'package:crm/screens/home/pages/views/speed_dial.dart';
import 'package:crm/screens/home/pages/views/tasks/view.dart';
import 'package:crm/screens/new_follow_up/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../view.dart';
import 'package:flutter/material.dart';

class ManagementClientsScreen extends StatefulWidget {
  const ManagementClientsScreen({Key? key}) : super(key: key);

  @override
  State<ManagementClientsScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<ManagementClientsScreen> {
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
          title: "إدارة العملاء",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                customSizedBox(height: height),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: width * 0.7,
                        child: const SearchOnClient(hintText: 'بحث')),
                    InkWell(
                      onTap: (){
                        archiveClients(context, height: height, width: width,
                            onTapCustomerCase: (){
                              archiveClientsActions(
                                  context, height: height, width: width,
                                  onTapToArchive: ()=> Get.off(()=>const  ArchiveClientsScreen()),
                                  onTapConnectedDone: (){},
                                  onTapNotRespond: (){});
                            },
                            onTapCustomerSource: (){
                              archiveClientsActions(
                                  context, height: height, width: width,
                                  onTapToArchive: (){},
                                  onTapConnectedDone: (){},
                                  onTapNotRespond: (){});
                            },
                            onTapCustomerClass: (){
                              archiveClientsActions(
                                  context, height: height, width: width,
                                  onTapToArchive: (){},
                                  onTapConnectedDone: (){},
                                  onTapNotRespond: (){});
                             // Navigator.pop(context);
                            },
                            onTapMonthlyRating: (){
                              archiveClientsActions(
                                  context, height: height, width: width,
                                  onTapToArchive: (){},
                                  onTapConnectedDone: (){},
                                  onTapNotRespond: (){});
                            },
                            onTapProjectRating: (){
                              archiveClientsActions(
                                  context, height: height, width: width,
                                  onTapToArchive: (){},
                                  onTapConnectedDone: (){},
                                  onTapNotRespond: (){});
                            });

                      },
                      child: Image.asset(
                        'assets/image/Filter.png',
                      ),
                    ),
                  ],
                ),
                customSizedBox(height: height),

                Container(
                  height: height * 0.7,
                  width: width,
                  color: kBackgroundButton,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  CupertinoAlertDialog(
                                content: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomButtonSizer(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Get.to(() => const NewFollowUp());
                                          },
                                          title: 'متابعة جديدة',
                                          color: kButtonGreen,
                                        ),
                                        CustomButtonSizer(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Get.to(() => ClientData());
                                          },
                                          title: 'بيانات العميل',
                                          color: kPrimaryColor,
                                        ),
                                        CustomButtonSizer(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Get.to(() =>
                                                const ManagementClientsScreen());
                                          },
                                          title: 'سجل المتابعة',
                                          color: kSecondaryColor,
                                        ),
                                        CustomButtonSizer(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Get.to(() => const TasksScreen());
                                          },
                                          title: 'المهام',
                                          color: kAccentColor,
                                        ),
                                        CustomButtonSizer(
                                          onPressed: ()async{
                                            await showConfirmationDialog(
                                                context,
                                                done: SmallButtonSizer(
                                                  onPressed: ()async {
                                                    // Navigator.pop(context);
                                                    await showConfirmationDialog(
                                                        context, title: 'تمت المهة بنجاح',
                                                        image: 'assets/image/99 1.png',
                                                        cancelled: SizedBox(),
                                                        done:  SizedBox()

                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                  title: 'تاكيد',
                                                  color: kTextColor,loadingColor: kPrimaryColor,),
                                                cancelled:  SmallButtonSizer(
                                                    onPressed: ()=> Navigator.pop(context),
                                                    title: 'إلغاء',color: kButtonRedDark),
                                                title: 'إتمام المهمة',
                                                image:  'assets/image/icons8-handshake-100 1.png'
                                            );
                                            Navigator.pop(context);
                                          }, title: 'إتمام التعاقد',color: kButtonGreenDark,),
                                        CustomButtonSizer(
                                          onPressed: ()async{
                                            await showConfirmationDialog(
                                                context,
                                                done: SmallButtonSizer(
                                                  onPressed: () async{
                                                    // Navigator.pop(context);
                                                    await showConfirmationDialog(
                                                        context, title: 'تمت الحذف بنجاح',
                                                        image: 'assets/image/icons8-delete-200 1.png',
                                                        cancelled: SizedBox(),
                                                        done:  SizedBox()

                                                    );
                                                    Navigator.pop(context);
                                                  },

                                                  title: 'تاكيد',
                                                  color: kTextColor,loadingColor: kPrimaryColor,),
                                                cancelled:  SmallButtonSizer(
                                                    onPressed: ()=> Navigator.pop(context),
                                                    title: 'إلغاء',color: kButtonRedDark),
                                                title: 'إتمام المهمة',
                                                image:  'assets/image/icons8-handshake-100 1.png'
                                            );
                                            Navigator.pop(context);
                                          },
                                          title: 'خسارة العقد',color: Colors.red,),
                                      ],
                                    )),
                              ),
                            );
                          },
                          child: CustomDismissible(
                              keyName:'item ${[index]}',
                              moveArchive: 'نقل للأرشيف',
                              titleDialog: 'نقل للأرشيف',
                              subTitleDialog: 'هل انت متاكد من نقل العميل إالي الأرشيف',
                              buttonDialogConfirmation: 'للأرشيف',
                              onTap: (){},
                              child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10,right: 8),

                                decoration:const  BoxDecoration(shape: BoxShape.circle),
                                child: Image.asset(
                                  'assets/image/Group 6865.png',

                                ),
                              ),
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildRow(
                                      title: 'الاسم',
                                      subTitle: ': Ahmed Samir ',
                                    ),
                                    buildRow(
                                      callPhone: () {
                                        // launch(('tel://${item.mobile_no}'));
                                      },
                                      title: 'رقم الهاتف',
                                      subTitle: ' : 01097758516',
                                    ),
                                    buildRow(
                                      callPhone: () {
                                        openWhatsApp(context);
                                      },
                                      title: 'رقم الواتس أب',
                                      subTitle: ' : 01097758516',
                                    ),
                                    customSizedBox(height: height),

                                    Row(
                                      children: [
                                        buildContainer(
                                            background: kSkyLightColor,
                                            width: width * 0.25,
                                            color: kBlackText,
                                            title: 'صفحة فيس بوك'),
                                        SizedBox(
                                          width: width * 0.1,
                                        ),
                                        buildContainer(
                                          background: kAccentColor,
                                          width: width * 0.25,
                                          color: kBlackText,
                                          title: 'عملاء المتابعات',
                                        ),
                                      ],
                                    ),
                                    customSizedBox(height: height),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                            ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionView(),
    );
  }






  SizedBox customSizedBox ({required height}){
    return  SizedBox(
      height: height * 0.01,
    );
  }
  Container buildContainer(
      {required double width,
      required Color background,
      required Color color,
      required String title}) {
    return Container(
      color: background,
      //width*0.25
      width: width,
      child: Center(
        child: Text(
          //'صفحة فيس بوك',
          title,
          style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              // color: kTextColor
              color: color),
        ),
      ),
    );
  }

  InkWell buildRow({
    VoidCallback? callPhone,
    required String title,
    required String subTitle,
  }) {
    return InkWell(
      onTap: callPhone,
      child: Row(
        children: [
          Text(
            title,
            //'الاسم',
            style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: kTextColor),
          ),
          Text(
            // ': Ahmed Samir ',
            subTitle,
            style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: kTextColor),
          ),
        ],
      ),
    );
  }

  openWhatsApp(BuildContext context) async {
    var whatsApp = "+919144040888";
    var whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsApp + "&text=hello";
    var whatappURLIos = "https://wa.me/$whatsApp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    }
  }
}
