import 'package:crm/screens/components/constants.dart';
import 'package:flutter/material.dart';
class ListTitleNormal extends StatelessWidget {
  const ListTitleNormal({Key? key ,required this.title,required this.icon,required this.onTap}) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            icon,
            //Icons.home,
            size: 20,
            color: HexColor('#2972B7'),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Cairo',
                color: HexColor('#2972B7'),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )
        ],
      ),
      //  onTap: () {
      // Get.to(()=>const MainScreen());
      //  },
      onTap: onTap,
    );
  }
}
