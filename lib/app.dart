import 'package:admob_example/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Test Admob",
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          child: Container(
            height: 50.0,
            color: Colors.grey,
            child: controller.isBannerReady.value == true
                ? AdWidget(ad: controller.banner)
                : Container(child: Text("Error to load admob")),
          ),
        ),
      ),
    );
  }
}
