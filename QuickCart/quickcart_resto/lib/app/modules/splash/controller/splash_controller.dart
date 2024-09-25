import 'package:get/get.dart';
import 'package:quickcart_resto/app/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/contains.dart';
import '../../../routes/routes.dart';

class SplashController extends BaseController {
  late final SharedPreferences _sharedPreferences;


  @override
  void onInit() async {
    super.onInit();
    checkFirstTimeInstallApp();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> checkFirstTimeInstallApp() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 2));
    final secondTimeOpenApp = _sharedPreferences.getBool(LocalStorageKey.secondTimeOpenApp);
    if (secondTimeOpenApp == null || secondTimeOpenApp == false) {
      _sharedPreferences.setBool(LocalStorageKey.secondTimeOpenApp, true);
      Get.offAndToNamed(AppRouteProvider.onboardScreen);
      return;
    }

    Get.offAndToNamed(AppRouteProvider.signInScreen);
  }
}