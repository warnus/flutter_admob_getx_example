import 'package:admob_example/app.dart';
import 'package:admob_example/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialRoute: "/", getPages: [
      GetPage(
          name: "/",
          page: () => App(),
          transition: Transition.fade,
          binding: BindingsBuilder(() {
            Get.put(AppController());
          })),
    ]);
  }
}
