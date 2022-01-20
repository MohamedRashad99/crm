import 'package:flutter/material.dart';
class TitleView extends StatelessWidget {
  const TitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Phone Number Verification',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          fontFamily: 'Cairo'),
      textAlign: TextAlign.center,
    );
  }
}
