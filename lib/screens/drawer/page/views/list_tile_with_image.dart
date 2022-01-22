import 'package:crm/screens/components/constants.dart';
import 'package:flutter/material.dart';
class ListTileWithImage extends StatelessWidget {


final String imagePath ;
final String title ;
final VoidCallback onTap;
  const ListTileWithImage({Key? key, required this.imagePath,required this.title,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Image.asset(
            imagePath,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),

        ],
      ),
      onTap:onTap,
    );
  }
}
