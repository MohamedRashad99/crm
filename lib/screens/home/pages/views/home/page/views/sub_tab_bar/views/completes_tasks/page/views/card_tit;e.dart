// ignore_for_file: file_names

import 'package:flutter/material.dart';
class CardTitle extends StatelessWidget {
  final String cardTitle;
  const CardTitle({Key? key,required this.cardTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     cardTitle,
      style: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black),
    );
  }

}
