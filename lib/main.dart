
import 'package:crm/screens/home/view.dart';
import 'package:crm/screens/servies_details/view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/bloc_observer.dart';
import 'generated/tr.dart';
import 'local_storage/local_storage.dart';
import 'screens/sign_in/view.dart';
import 'screens/splash/view.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // MobileAds.instance.initialize();
  Bloc.observer = MyBlocObserver();
  await Nations.boot();
  await LocalStorage.boot();
/* DevicePreview(
      enabled: true,
      builder: (context) => */
  runApp(  const CRM());
}

class CRM extends StatelessWidget{
  const CRM({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  const   GetMaterialApp(
      popGesture: true,
        defaultTransition: g.Transition.zoom,
        debugShowCheckedModeBanner: false,
        home:SplashScreen()
        //HomeTabScreen(),
      );

  }
}
