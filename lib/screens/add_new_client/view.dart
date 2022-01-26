import 'package:flutter/material.dart';
class AddNewClient extends StatelessWidget {
  const AddNewClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        height: height*0.8,
      ),
    );
  }
}


