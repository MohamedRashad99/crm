import 'package:crm/config/keys.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:flutter/material.dart';
class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: const Text(KeysConfig.kMessageToKnow,
          style: TextStyle(
              fontSize: 14,
              color: kTextColor,
              fontFamily: "Cairo")),
    );
  }
}
