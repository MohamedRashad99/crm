import 'package:crm/config/keys.dart';
import 'package:crm/screens/components/appBar.dart';
import 'package:crm/screens/components/constants.dart';
import 'package:crm/screens/drawer/view.dart';
import 'package:crm/screens/project_details/page/views/banner_sliders.dart';
import 'package:flutter/material.dart';

class ProjectDetails extends StatelessWidget {
  ProjectDetails({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kHomeColor,
      drawer: drawer(context: context),
      key: _scaffoldKey,
      appBar: customAppbar(
          isIcons: true,
          icons: Icons.arrow_forward_ios,
          /// TODO: Don`t miss match your head of title => Id
          title: "مشروع العلا مصر",
          press: () => _scaffoldKey.currentState!.openDrawer(),
          context: context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: height * 0.26,
                margin: const EdgeInsets.symmetric(vertical: 2),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSpacer(
                      height: height * 0.02,
                    ),
                    buildText(
                        text: 'وحدة 4 مساحة 35 متر ع الشارع الرئيسي',
                        size: 14,
                        color: kBlackText),
                    buildSpacer(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        buildContainerUniteType(width, height,
                            text: 'سكني', color: kAccentColor),
                        buildContainerUniteType(width, height,
                            text: 'تجاري', color: kSecondaryColor),
                      ],
                    ),
                    buildSpacer(
                      height: height * 0.02,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        buildContainerShapeUnite(width, height,
                            image: 'assets/image/plans 1.png', text: ' 180 م'),
                        buildContainerShapeUnite(width, height,
                            image: 'assets/image/home (1) 1.png',
                            text: '4 غرف'),
                        buildContainerShapeUnite(width, height,
                            image: 'assets/image/bathtub 1.png',
                            text: '2 حمام'),
                        buildContainerShapeUnite(width, height,
                            image: 'assets/image/build (1) 1.png',
                            text: 'الطابق الرابع'),
                        buildContainerShapeUnite(width, height,
                            image: 'assets/image/build 1.png',
                            text: 'حمام سباحة'),
                      ],
                    ),
                    buildSpacer(
                      height: height * 0.02,
                    ),
                  ],
                ),
              ),
              const BannerSlider(),
              buildSizedBox(height: height * 0.04),
              Container(
                color: Colors.white,
              padding:const EdgeInsets.symmetric(horizontal: 18),
                child: const Text(
                  KeysConfig.kLoramText,
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: kBlackText),
                ),
              ),
              buildSizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox({required double height}) {
    return SizedBox(
      height: height,
    );
  }

  Container buildContainerShapeUnite(double width, double height,
      {required String image, required String text}) {
    return Container(
      width: width * 0.28,
      height: height * 0.044,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            width: width * 0.06,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: width * 0.01,
          ),
          SizedBox(
              width: width * 0.18,
              child: buildText(text: text, size: 10, color: kTextColor)),
        ],
      ),
    );
  }

  Container buildContainerUniteType(double width, double height,
      {required Color color, required String text}) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: width * 0.15,
      height: height * 0.044,
      //color: Colors.amber,
      color: color,
//text: 'سكني'
      child: Center(
        child: buildText(text: text, size: 10, color: Colors.white),
      ),
    );
  }

  Text buildText(
      {required String text, required double size, required Color color}) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Cairo',
          fontSize: size,
          // fontSize: 14,
          fontWeight: FontWeight.bold,
          //   color: kTextColor
          color: color),
    );
  }

  SizedBox buildSpacer({required double height}) {
    return SizedBox(
      height: height,
    );
  }
}
