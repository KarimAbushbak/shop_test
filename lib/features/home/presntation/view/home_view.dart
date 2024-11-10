import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/core/resources/manager_assets.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/core/resources/manager_font_sizes.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_height.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/core/resources/manager_width.dart';
import 'package:shop_test/features/home/presntation/controller/home_controller.dart';
import '../../../../core/resources/manager_raduis.dart';
import '../../../out_boarding/presntation/widget/progress_indicator.dart';

class HomeView extends StatelessWidget {
  PageController _pageController = PageController();
  final int _currentPageIndex = 0;

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.notification_add_outlined,
            size: 26,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ManagerWidth.w28,
                height: ManagerHeight.h28,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            controller.themeController.isDarkMode.value
                                ? ManagerAssets.home1White
                                : ManagerAssets.home1))),
              ),
              Text(
                ManagerStrings.appName,
                style: TextStyle(
                  fontWeight: ManagerFontWeight.bold,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w20, vertical: 12),
              child: Row(
                children: [
                  Text(
                    ManagerStrings.goodMorning,
                    style: TextStyle(
                        fontSize: ManagerFontSizes.s14,
                        fontWeight: ManagerFontWeight.w400),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    controller.appSettingsSharedPreferences.userName
                        .toUpperCase(),
                    style: TextStyle(
                        fontSize: ManagerFontSizes.s14,
                        fontWeight: ManagerFontWeight.w400,
                        color: ManagerColors.primaryColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: ManagerHeight.h34,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
              child: Text(
                ManagerStrings.homeSubTilte1,
                style: TextStyle(
                    fontSize: ManagerFontSizes.s24,
                    fontWeight: ManagerFontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
              child: Text(
                ManagerStrings.homeSubTilte2,
                style: TextStyle(
                    fontSize: ManagerFontSizes.s24,
                    fontWeight: ManagerFontWeight.bold),
              ),
            ),
            SizedBox(
              height: ManagerHeight.h28,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
                width: ManagerWidth.w380,
                height: ManagerHeight.h60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ManagerColors.homeViewBarColor),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ManagerAssets.home2))),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 14),
                          child: Text(
                            ManagerStrings.yourLocation,
                            style: TextStyle(
                                color: ManagerColors.gray,
                                fontSize: ManagerFontSizes.s10,
                                fontWeight: ManagerFontWeight.regular),
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h3,
                        ),
                        Text(
                          ManagerStrings.school,
                          style: TextStyle(
                              color: ManagerColors.white,
                              fontWeight: ManagerFontWeight.bold,
                              fontSize: ManagerFontSizes.s12),
                        )
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: ManagerHeight.h40,
            ),
            Container(
                height: ManagerHeight.h150,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: (int index) {
                    controller
                        .onPageChanged(index); // Update the current page index
                  },
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: ManagerWidth.w20),
                          width: ManagerWidth.w380,
                          height: ManagerHeight.h140,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ManagerAssets.home3))),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 43, vertical: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: ManagerWidth.w24,
                                      height: ManagerHeight.h24,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  ManagerAssets.home4))),
                                    ),
                                    SizedBox(
                                      width: ManagerWidth.w8,
                                    ),
                                    Text(
                                      ManagerStrings.appName,
                                      style: TextStyle(
                                          color: ManagerColors.white,
                                          fontWeight: ManagerFontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: ManagerHeight.h7,
                                ),
                                Text(
                                  ManagerStrings.allYou,
                                  style: TextStyle(
                                      color: ManagerColors.white,
                                      fontSize: ManagerFontSizes.s20,
                                      fontWeight: ManagerFontWeight.bold),
                                ),
                                Text(
                                  ManagerStrings.onePlace,
                                  style: TextStyle(
                                      color: ManagerColors.white,
                                      fontSize: ManagerFontSizes.s20,
                                      fontWeight: ManagerFontWeight.bold),
                                )
                              ],
                            )),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: ManagerWidth.w20),
                          width: ManagerWidth.w380,
                          height: ManagerHeight.h140,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ManagerAssets.home3))),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 43, vertical: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: ManagerWidth.w24,
                                      height: ManagerHeight.h24,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  ManagerAssets.home4))),
                                    ),
                                    SizedBox(
                                      width: ManagerWidth.w8,
                                    ),
                                    Text(
                                      ManagerStrings.appName,
                                      style: TextStyle(
                                          color: ManagerColors.white,
                                          fontWeight: ManagerFontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: ManagerHeight.h7,
                                ),
                                Text(
                                  ManagerStrings.allYou,
                                  style: TextStyle(
                                      color: ManagerColors.white,
                                      fontSize: ManagerFontSizes.s20,
                                      fontWeight: ManagerFontWeight.bold),
                                ),
                                Text(
                                  ManagerStrings.onePlace,
                                  style: TextStyle(
                                      color: ManagerColors.white,
                                      fontSize: ManagerFontSizes.s20,
                                      fontWeight: ManagerFontWeight.bold),
                                )
                              ],
                            )),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: ManagerWidth.w20),
                          width: ManagerWidth.w380,
                          height: ManagerHeight.h140,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ManagerAssets.home3))),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 43, vertical: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: ManagerWidth.w24,
                                      height: ManagerHeight.h24,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  ManagerAssets.home4))),
                                    ),
                                    SizedBox(
                                      width: ManagerWidth.w8,
                                    ),
                                    Text(
                                      ManagerStrings.appName,
                                      style: TextStyle(
                                          color: ManagerColors.white,
                                          fontWeight: ManagerFontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: ManagerHeight.h7,
                                ),
                                Text(
                                  ManagerStrings.allYou,
                                  style: TextStyle(
                                      color: ManagerColors.white,
                                      fontSize: ManagerFontSizes.s20,
                                      fontWeight: ManagerFontWeight.bold),
                                ),
                                Text(
                                  ManagerStrings.onePlace,
                                  style: TextStyle(
                                      color: ManagerColors.white,
                                      fontSize: ManagerFontSizes.s20,
                                      fontWeight: ManagerFontWeight.bold),
                                )
                              ],
                            )),
                      ],
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => progressIndicator(
                      color: controller.currentPageIndex.value == 0
                          ? ManagerColors.primaryColor
                          : ManagerColors.gray,
                    )),
                Obx(() => progressIndicator(
                      color: controller.currentPageIndex.value == 1
                          ? ManagerColors.primaryColor
                          : ManagerColors.gray,
                    )),
                Obx(() => progressIndicator(
                      color: controller.currentPageIndex.value == 2
                          ? ManagerColors.primaryColor
                          : ManagerColors.gray,
                    )),
              ],
            ),

            SizedBox(
              height: ManagerHeight.h16,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                ManagerStrings.ourProducts,
                style: TextStyle(
                    fontSize: ManagerFontSizes.s18,
                    fontWeight: ManagerFontWeight.bold),
              ),
            ),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 6,
                ),
                itemCount: controller.homeModel.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.productDetails(
                        context,
                        controller.homeModel.data[index].id,
                        controller.homeModel.data[index].thumbnailImage,
                        controller.homeModel.data[index].name,
                        controller.homeModel.data[index].basePrice,
                        controller.homeModel.data[index].photos,
                        controller.homeModel.data[index].unit,
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            ManagerRadius.r10,
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(controller.homeModel
                                        .data[index].thumbnailImage))),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                          child: Text(
                            controller.homeModel.data[index].name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                          child: Text(
                            controller.productPrice(
                                controller.homeModel.data[index].basePrice
                                    .toString(),
                                controller.homeModel.data[index].unit),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
            // SizedBox(height: 15,),
          ],
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "")
              ],
              currentIndex: controller.currentPage2Index.value,
              onTap: (index) =>
                  controller.onBottomNavItemTapped(index, context),
              selectedItemColor: ManagerColors.primaryColor,
              unselectedItemColor: ManagerColors.gray,
              iconSize: 30,
            )),
      );
    });
  }
}
