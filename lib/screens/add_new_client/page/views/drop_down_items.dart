import 'package:crm/screens/components/constants.dart';
import 'package:flutter/material.dart';
class DropDownList extends StatefulWidget {
  final double width;
  const DropDownList({Key? key,required this.width}) : super(key: key);

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String dropdownValue = 'One';

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: height*0.069,
        width:widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
            border: Border.all(color: kPrimaryColor)
        ),
        child: DropdownButton<String>(

          value: dropdownValue,
         // autofocus: true,
         // isDense: true,
          isExpanded: true,
          borderRadius: BorderRadius.circular(10),
          icon: const Icon(Icons.arrow_downward_rounded),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),

          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
