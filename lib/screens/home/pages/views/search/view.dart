import 'package:crm/screens/add_new_task/page/views/search/search.dart';
import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import '../../../../drawer/view.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(

      backgroundColor: kHomeColor,

      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
        icons: Icons.arrow_forward_ios,
          isIcons: true,
          title: "البحث",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context
      ),
      body: Directionality(
        textDirection:TextDirection.rtl ,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),

          child: Column(
            children: [
            const Center(
              child: Text(
                'عن ماذا تبحث',
                style:  TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: kBlackText),
              ),
            ),
            SizedBox(height: height*0.03,),
            const SearchOnClient(hintText: 'بحث مشروعات'),
              SizedBox(height: height*0.01,),
              const SearchOnClient(hintText: 'بحث عن العملاء'),

          ],),
        ),
      ),

    );
  }
}
