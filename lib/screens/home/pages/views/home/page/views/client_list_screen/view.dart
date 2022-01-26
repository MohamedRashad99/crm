import 'dart:io';

import 'package:crm/screens/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ClientListsScreen extends StatelessWidget {
  const ClientListsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: kBackgroundButton,
        child: ListView.builder(

          physics:  BouncingScrollPhysics(),
            itemCount: 15,
            itemBuilder: (context ,index){
         return  InkWell(
           onTap: (){},
           /// TODO::
           child: Container(
             margin:  EdgeInsets.symmetric(vertical: 3),
             color: Colors.white,
             //assets/image/Group 6865.png
               child: Row(
                 children: [
                   Padding(
                     padding:  EdgeInsets.only(left: 10),
                     child: CircleAvatar(maxRadius: 15,child: Image.asset('assets/image/Group 6865.png'),),
                   ),
                   SizedBox(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         buildRow(title: 'الاسم' , subTitle:': Ahmed Samir ', ),
                         buildRow(callPhone: (){
                          // launch(('tel://${item.mobile_no}'));
                         },title:'رقم الهاتف' , subTitle: ' : 01097758516', ),
                         buildRow(callPhone: (){
                           openWhatsApp(context);
                         },title:   'رقم الواتس أب', subTitle:  ' : 01097758516', ),
                         SizedBox(height: height*0.01,),
                         Row(
                           children:  [
                            buildContainer(background: kRoundColor,width: width*0.25 ,color:kTextColor ,title:'صفحة فيس بوك'  ),
                             SizedBox(width: width*0.1,),
                             buildContainer(background: kPrimaryColor,width: width*0.25 ,color:kTextColor ,title:  'عملاء المتابعات',  ),
                           ],
                         ),
                         SizedBox(height: height*0.01,),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
         );
        }),
      ),
    );
  }

  Container buildContainer({required double width
    ,required Color background,
    required Color color ,required String title }) {
    return Container(
                        color: background,
                        //width*0.25
                        width: width,
                      child:  Center(child: Text(

                        //'صفحة فيس بوك',
                        title,
                        style:  TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                           // color: kTextColor
                          color: color
        ),
                      ) ,),);
  }

  InkWell buildRow({
     VoidCallback? callPhone ,

    required String title ,
    required String subTitle ,}) {
    return InkWell(
      onTap: callPhone,
      child: Row(

                         children:  [
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
  openWhatsApp(BuildContext context) async{
    var whatsApp ="+919144040888";
    var whatsappURlAndroid = "whatsapp://send?phone="+whatsApp+"&text=hello";
    var whatappURLIos ="https://wa.me/$whatsApp?text=${Uri.parse("hello")}";
    if(Platform.isIOS){
      // for iOS phone only
      if( await canLaunch(whatappURLIos)){
        await launch(whatappURLIos, forceSafariVC: false);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    }else{
      // android , web
      if( await canLaunch(whatsappURlAndroid)){
        await launch(whatsappURlAndroid);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content:  Text("whatsapp no installed")));
      }
    }
  }
}