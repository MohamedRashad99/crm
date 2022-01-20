import 'package:flutter/material.dart';
class BackgroundView extends StatelessWidget {
  const BackgroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/Forgot password.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
