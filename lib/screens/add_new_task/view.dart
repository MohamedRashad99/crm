import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
class AddNewTask extends StatelessWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      key:_oFormKey ,
      body: Center(),
    );
  }
}


