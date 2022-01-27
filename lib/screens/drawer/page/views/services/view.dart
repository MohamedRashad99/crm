import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/home/pages/views/speed_dial.dart';
import 'package:crm/screens/services_category/view.dart';
import 'package:get/get.dart';
import '../../../view.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<ServicesScreen> {
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
          title: "الخدمات",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: height,
          child: ListView.builder(
            //padding: EdgeInsets.symmetric(vertical: 5),
            itemCount: 50,
            physics: const BouncingScrollPhysics(),
           itemBuilder: (context ,int index){
             return  Container(
               color: Colors.white,
               padding: const EdgeInsets.symmetric(horizontal: 12),
               margin:const  EdgeInsets.symmetric(vertical: 3),
               child: buildContainer(onTap: (){
                 Get.to(()=>ServicesCategory());

               },title: 'تصميم مواقع', subTitle: '10 خدمات فرعية', ),
             );
           }
          ),
        ),
      ),
      floatingActionButton: FloatingActionView(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  Widget buildContainer({
    double? height,
    required String title,
    required VoidCallback onTap,
    required String subTitle,

  }) {
    return  ListTile(
      onTap: onTap,

      contentPadding: EdgeInsets.zero,
      leading:  Text(
        // 'الأسم',
        title,
        style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: kTextColor),
      ),

      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
         Text(
            //  'Mohammed Rashad',
            subTitle,
            maxLines: 2,
            style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: kTextColor),
          ),
          SizedBox(width: 10,),

          Icon(
            Icons.arrow_forward_ios,
           // dIcon,
            size: 15,
          ),
        ],
      ),

    );

  }
}
