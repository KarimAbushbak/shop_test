import 'package:get/get.dart';
import '../../../../core/constants.dart';
import '../../../../core/routes.dart';
import '../../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';

class SplashController extends GetxController {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();

  @override
  void onInit() {
    super.onInit();
    // appSettingsSharedPreferences.clear();
    Future.delayed(
        const Duration(
          seconds: Constants.splashTime,
        ), () {
          appSettingsSharedPreferences.clear();
      String route = appSettingsSharedPreferences.LoggedIn
          ? Routes.homeView
          : appSettingsSharedPreferences.outBoardingViewed ? Routes
          .loginView : Routes.outBoarding;

      Get.offAllNamed(route);

      Get.offAllNamed(route);
    });
  }
}
