import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/features/authntication/presntaion/view/login_view.dart';
import 'package:shop_test/features/authntication/presntaion/view/register_view.dart';
import 'package:shop_test/features/home/presntation/view/home_view.dart';
import 'package:shop_test/features/language_page/presntation/view/language_page.dart';
import 'package:shop_test/features/out_boarding/presntation/view/out_boarding.dart';
import 'package:shop_test/features/product_destails/presntation/product_details_view.dart';
import 'package:shop_test/features/profile/presentaion/view/profile_view.dart';
import 'package:shop_test/features/settings/presentation/view/screen/locale_view.dart';
import 'package:shop_test/features/splash/presntaion/view/splash_screen.dart';

import '../config/dependancy_injection.dart';

class Routes {
  static const String splashScreen = '/splash_screen';
  static const String languagePage = '/language_page';
  static const String homeView = '/homeView';
  static const String outBoarding = '/outBoarding';
  static const String loginView = '/loginView';
  static const String registerView = '/registerView';
  static const String profileView = '/profileView';
  static const String localeView = '/localeView';
  static const String detailsView = '/detailsView';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.languagePage:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
      case Routes.outBoarding:
        return MaterialPageRoute(builder: (_) => const OutBoarding());
      case Routes.loginView:
        initAuth();
        return MaterialPageRoute(builder: (_) =>  LoginView());
      case Routes.registerView:
        initAuth();
        return MaterialPageRoute(builder: (_) =>  RegisterView());
      case Routes.homeView:
        initHome();
        return MaterialPageRoute(builder: (_) =>  HomeView());
      case Routes.profileView:
        initHome();
        return MaterialPageRoute(builder: (_) =>  ProfileView());
        case Routes.detailsView:
          initHome();
        return MaterialPageRoute(builder: (_) =>  DetailsView());
      case Routes.localeView:
        initLocale();

        return MaterialPageRoute(builder: (_) =>  LocaleView());



      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body:  Center(
          child: Text(ManagerStrings.notFoundRoute),
        ),
      ),
    );
  }
}
