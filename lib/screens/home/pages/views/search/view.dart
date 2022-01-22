import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/drawer.dart';
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
    return  Scaffold(
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar( title: "البحث",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context
      ),
      body: const Center(
        child: Text(
          'Index 4: Search',
          style:  TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
