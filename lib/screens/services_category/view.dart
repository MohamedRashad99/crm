import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/drawer/view.dart';
import 'package:crm/screens/home/pages/views/speed_dial.dart';
import 'package:crm/screens/servies_details/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesCategory extends StatelessWidget {
  ServicesCategory({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final data = [
      'مجلة ورد بريس',
      'اختيار ثاني',
      'تصميم مواقع',
      'تصميم موقع عقارات ',
      'موقع أكاديمية تدريب',
      'سته الا تلت',
      '#الحريه_لعادل_شكل',
    ];
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
          isIcons: true,
          icons: Icons.arrow_forward_ios,
          title: "تفاصيل الخدمات",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body:  Wrap(
         crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 5,
       textDirection:TextDirection.rtl ,
        children:data.map((item)=>
          InkWell(
            onTap: (){
              //serviceDetails: item,
              Get.to(()=> ServicesDetailsScreen());
              print(item);
            },
            child: Container(
              margin:const EdgeInsets.symmetric(
                vertical: 5,
              ),
              color: kRose,
              child:  Text(
              item,
                textAlign: TextAlign.center,
                softWrap: true,
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kBlackText),
              ),
            ),
          )).toList()
        ),

    floatingActionButton: FloatingActionView(),
    floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

    );
  }
   /*   Chip(
        elevation: 20,
       // padding: const EdgeInsets.all(8),
        backgroundColor: Colors.greenAccent[100],
        shadowColor: Colors.black,
        // avatar: const CircleAvatar(
        //   backgroundImage: const NetworkImage(
        //       "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetwordImage
        // ), //CircleAvatar
        label: const Text(
          'GeeksforGeeks',
          style: TextStyle(fontSize: 20),
        ),*/

}
