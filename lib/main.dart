import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/config/dependancy_injection.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'config/locale/locale_settings.dart';
import 'core/resources/manager_assets.dart';
import 'core/routes.dart';
import 'features/home/presntation/view/home_view.dart';
import 'features/settings/presentation/controller/theme_controller.dart';

main() async {
  await initModule();
  runApp(EasyLocalization(
      supportedLocales: LocaleSettings().locales,
      path: ManagerPaths.translationsPath,
      startLocale: localeSettings.defaultLocale,
      fallbackLocale: localeSettings.defaultLocale,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      themeMode:
          themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: ManagerColors.white,
          foregroundColor: ManagerColors.black, // AppBar text color in light mode
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: ManagerColors.transparent,
          foregroundColor: ManagerColors.white, // AppBar text color in dark mode
        ),
      ),
      initialRoute: Routes.homeView,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
