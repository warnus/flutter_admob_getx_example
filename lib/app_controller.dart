import 'dart:io';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppController extends GetxService {
  static AppController get to => Get.find();
  // TEST ADMOB
  final String androidTestUnitId = 'ca-app-pub-3940256099942544/6300978111';

  late BannerAd banner;
  RxBool isBannerReady = false.obs;

  @override
  void onInit() {
    super.onInit();
    initBanner();
  }

  void initBanner() {
    print("initBanner");
    print(Platform.isIOS ? androidTestUnitId : androidTestUnitId);
    BannerAd _banner = BannerAd(
      size: AdSize.banner,
      // adUnitId: Platform.isIOS ? androidTestUnitId : androidTestUnitId,
      adUnitId: androidTestUnitId,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isBannerReady(true);
          print("ready true");
        },
        onAdFailedToLoad: (ad, error) {
          isBannerReady(false);
          print("ready false");
        },
      ),
    )..load();
    banner = _banner;
  }
}
