import 'package:flutter/material.dart';

import 'model.dart';
class ShowContent extends StatelessWidget {
 final  BoardingModel model;
   const ShowContent({Key? key,required this.model }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
         SizedBox(
          height: height*0.2,
        ),
       // const Spacer(flex: 2),
        Image.asset(
          model.image,
        height: height*0.4,
          width: width*0.8,
        ),
        Text(
          model.title,
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
        ),
      ],
    );
  }
}
