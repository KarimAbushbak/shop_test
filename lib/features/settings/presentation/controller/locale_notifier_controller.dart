import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../../../../config/locale/locale_settings.dart';

class LocaleNotifierController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsPrefs =
  AppSettingsSharedPreferences();
  final languagesList = LocaleSettings.languages;
  var selectedValue = 1.obs; // Make it observable to reactively update UI

  @override
  void onInit() {
    super.onInit();
    _initializePreferences(); // Initialize preferences when the controller is created
  }

  Future<void> _initializePreferences() async {
    await _appSettingsPrefs.initPreferences();
    selectedValue.value = _appSettingsPrefs.selectedValue; // Load saved selection
  }

  String get currentLanguage => _appSettingsPrefs.defaultLocale;

  Future<void> changeLanguage(
      {required BuildContext context, required String languageCode}) async {
    _appSettingsPrefs.setDefaultLocale(languageCode);
    EasyLocalization.of(context)!.setLocale(Locale(languageCode));
    Get.updateLocale(Locale(languageCode));
    update();
  }

  var isDarkMode = false.obs;
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void saveSelectedValue(int value) {
    selectedValue.value = value;
    _appSettingsPrefs.saveSelectedValue(value); // Save to shared preferences
  }
}
