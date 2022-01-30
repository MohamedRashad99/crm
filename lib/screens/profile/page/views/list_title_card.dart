import 'package:crm/screens/components/constants.dart';
import 'package:flutter/material.dart';
class ListTitleCard extends StatelessWidget {

      final  double? height;
      final bool isFound;
      final IconData icon;
      final String title;
      final String subTitle;
      final IconData dIcon;
  const ListTitleCard({
    Key? key,
    this.height,
    required this.isFound,
    required this.icon, required
    this.title, required
    this.subTitle,
    required this.dIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListTile(

      contentPadding: EdgeInsets.zero,
      leading:  Icon(
        icon,
        color: kPrimaryColor,
      ),
      title:  Text(
        // 'الأسم',
        title,
        style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isFound
              ? Text(
            //  'Mohammed Rashad',
            subTitle,
            maxLines: 2,
            style: const TextStyle(
                fontFamily: 'Cairo',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: kTextColor),
          )
              : const SizedBox(),
          const SizedBox(width: 10,),

          Icon(
            //Icons.arrow_forward_ios,
            dIcon,
            size: 15,
          ),
        ],
      ),

    );
  }
}
