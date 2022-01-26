import 'package:crm/screens/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
class SearchOnClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height *0.069,
      child: TextFormField(
        style: const TextStyle(fontSize: 14, color: kTextColor, fontFamily: "Khebrat Musamim"),
        keyboardType: TextInputType.text,
        keyboardAppearance: Brightness.light,
        textInputAction: TextInputAction.search,
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'البحث',

          prefixIcon: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                FontAwesomeIcons.angleLeft,
                color: kPrimaryColor,
                size: 22,
              )),

          suffixIcon: const Icon(
            FontAwesomeIcons.search,
            color: kPrimaryColor,
            size: 18,
          ),
          labelStyle: const TextStyle(
            fontSize: 16,
            color: kPrimaryColor,
            fontFamily: "Cairo",
          ),
          hintStyle: const TextStyle(fontSize: 14, color: kTextColor, fontFamily: "Cairo"),
          // filled: true,
          fillColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
         // SearchCubit.of(context).getSearchResult(words: value.toString());
        },
      ),
    );
  }
}
