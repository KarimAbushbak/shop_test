import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/features/home/data/data_source/home_api_controller.dart';

import '../../../../core/routes.dart';
import '../../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../../../settings/presentation/controller/theme_controller.dart';
import '../model/home_model.dart';

class HomeController extends GetxController {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();

  ThemeController themeController = ThemeController();
  var currentPageIndex = 0.obs; // Observable for PageView index.
  var currentPage2Index = 0.obs; // Observable for PageView index.
  HomeModel homeModel = HomeModel(data: [], success: true, status: 200);
  HomeApiController homeApiController = HomeApiController();
  var isUnderwaySelected = false.obs; // Make it reactive
  var isFavorite = false.obs;
  var quantity = 1.obs;

  @override
  void onInit() {
    super.onInit();
    readHome();
  }

  Color getPageIndicatorColor(
    int pageIndex,
    Color activeColor,
    Color inactiveColor,
  ) {
    return currentPage2Index.value == pageIndex ? activeColor : inactiveColor;
  }

  void onBottomNavItemTapped(int index, BuildContext context) {
    currentPage2Index.value = index;

    const List<String> routes = [
      Routes.homeView, // Index 0
      Routes.profileView, // Index 1
      Routes.localeView // Index 2
    ];
    if (index >= 0 && index < routes.length) {
      Navigator.pushNamed(context, routes[index]);
    }

    // Add any other logic for navigation or handling the selected index.
  }

  void toggleSelection() {
    isUnderwaySelected.value = !isUnderwaySelected.value;
  }

  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  readHome() async {
    homeModel = await homeApiController.home(context: Get.context!);
    update();
  }

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void increaseQuantity() {
    quantity.value++;
    print('${quantity.value}');
    update();
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
      print('Decreased quantity to: ${quantity.value}');
      update();
    }
  }

  productDetails(
      BuildContext context,
      int productId,
      String productImg,
      String productName,
      double productPrice,
      List<String> photos,
      String unit) {
    homeModel.data.first.id = productId;
    homeModel.data.first.thumbnailImage = productImg;
    homeModel.data.first.name = productName;
    homeModel.data.first.basePrice = productPrice;
    homeModel.data.first.photos = photos;
    homeModel.data.first.unit = unit;
    Navigator.pushNamed(context, Routes.detailsView);
  }

  String productPrice(String price, String unit) {
    return ' \$ $price \\$unit'.toUpperCase();
  }

  String productRating(String rate) {
    return '($rate)';
  }
}
