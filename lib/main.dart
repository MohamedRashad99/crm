
import 'package:crm/screens/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'config/bloc_observer.dart';
import 'generated/tr.dart';
import 'local_storage/local_storage.dart';
import 'screens/splash/view.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // MobileAds.instance.initialize();
  Bloc.observer = MyBlocObserver();
  await Nations.boot();
  await LocalStorage.boot();

  runApp( const CRM());
}

class CRM extends StatelessWidget{
  const CRM({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      );

  }
}
