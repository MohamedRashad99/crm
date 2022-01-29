import 'package:crm/screens/components/smallButtonSizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF2972B7);
const kSecondaryColor = Color(0xFF2972B7);
const Color kAccentColor = Color(0xFFFFAE48);
const Color kTextColor = Color(0xFF626262);
const kBackgroundColor = Color(0xFFB1C5D8);
const kBackgroundButton = Color(0xFFE6E6E6);
const kSkyButton = Color(0xFFDDEFFF);
const kRose = Color(0xFFFFC5B9);
const kButtonGreen = Color(0xFF29B784);
const kButtonGreenDark = Color(0xFF008000);
const kButtonRedDark = Color(0xFFC50B0B);
const Color kHomeColor = Color(0xFFF9F9F9);
const Color kRoundColor = Color(0xFFFEBD2F);
const Color kLightText = Color(0xFFE6E6E6);
const Color kBlackText = Color(0xFF000000);

const Color kRoundBorderColor = Color.fromRGBO(220, 220, 220, 1);

/*const kGreenColor = Color(0xFF03AB6A);
const kLightGreenColor = Color(0xFF099861);
const kGreyTextColor = Color(0xFF898A8D);
const kWhitecardColor = Color(0xFFF5F5F5);
const kprimaryLightColor = Color(0x5c0090CF);
const kFavouriteColor = Color(0xFFAB0D03);
const kPrimaryFDarkColor = Color(0xFF0A4E75);
const kPrimaryBlueColor = Color(0xFF3080D1);
const khTextColor = Color(0xFF323232);*/

Widget customDivider(double height) => Container(
      width: double.infinity,
      height: height,
      color: Colors.grey[300],
    );

Widget customDivider2(double height) => Container(
      width: double.infinity,
      height: height,
      color: Colors.white,
    );

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontFamily: '',
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

const subheadingStyle = TextStyle(
  fontFamily: 'Cairo',
  fontWeight: FontWeight.w400,
  color: Colors.grey,
);

spaceH(double height) {
  return SizedBox(height: height);
}

spaceW(double width) {
  return SizedBox(width: width);
}

Future <void> showConfirmationDialog (BuildContext context){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return    showDialog<String> (
    context: context,

    builder: (BuildContext context) =>  CupertinoAlertDialog(
      title: Image.asset(
        'assets/image/icons8-handshake-100 1.png',
        width: width*2,
        height: height*0.15,
        fit: BoxFit.contain,),


      content:  Directionality(textDirection: TextDirection.rtl,
          child: SizedBox(
           // width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height*0.02,),

                const Text('هل انت متأكد من إتمام التعاقد ونقل العميل الى العملاء المتعاقدين!',

                  style:  TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: kBlackText),
                ),
                SizedBox(height: height*0.02,),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmallButtonSizer(onPressed: (){
                        return ;
                      }, title: 'تاكيد',color: kTextColor,),
                      SmallButtonSizer(onPressed: (){
                        Navigator.pop(context);

                      }, title: 'إلغاء',color: kButtonRedDark),

                    ],
                  ),
                ),

              ],
            ),
          )),

    ),
  );
}

Future <void> showLoserDialog (BuildContext context){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return    showDialog<String> (
    context: context,

    builder: (BuildContext context) =>  CupertinoAlertDialog(
      title: Image.asset(
        'assets/image/icons8-trash-200 1.png',
        width: width*2,
        height: height*0.15,
        fit: BoxFit.contain,),


      content:  Directionality(textDirection: TextDirection.rtl,
          child: SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height*0.02,),

                const Text(
                  'هل انت متأكد من خسارة التعاقد ونقل العميل الي الارشيف؟',

                  style:  TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: kBlackText),
                ),
                SizedBox(height: height*0.02,),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmallButtonSizer(onPressed: (){
                        return ;
                      }, title: 'تاكيد',color: kTextColor,),
                      SmallButtonSizer(onPressed: (){
                        Navigator.pop(context);

                      }, title: 'إلغاء',color: kButtonRedDark),

                    ],
                  ),
                ),

              ],
            ),
          )),

    ),
  );
}

//constant functions
double sizeFromHeight(BuildContext context, double fraction,
    {bool removeAppBarSize = true}) {
  double deviceHeight = MediaQuery.of(context).size.height;
  fraction = (removeAppBarSize
          ? (deviceHeight - AppBar().preferredSize.height)
          : deviceHeight) /
      (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(BuildContext context, double fraction) {
  fraction = MediaQuery.of(context).size.width / (fraction == 0 ? 1 : fraction);
  return fraction;
}

class SizeConfig {
  static double screenHeight = 0.0;
  static double screenWidth = 0.0;

  void init(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

