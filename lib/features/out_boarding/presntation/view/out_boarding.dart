import 'package:flutter/material.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/core/resources/manager_font_sizes.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/core/widgets/base_button.dart';

import '../../../../core/constants.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_width.dart';
import '../../../../core/routes.dart';
import '../widget/out_boarding_content.dart';
import '../widget/progress_indicator.dart';

class OutBoarding extends StatefulWidget {
  const OutBoarding({super.key});

  @override
  State<OutBoarding> createState() => _OutBoardingState();
}

PageController _pageController = PageController();
int _currentPageIndex = 0;

class _OutBoardingState extends State<OutBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5, top: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0, // No elevation
                shadowColor: Colors.red, // Remove shadow
                side: BorderSide.none, // Remove border
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0), // Set rounded corners to 0 if needed
                ),
                splashFactory: NoSplash.splashFactory, // Disable splash effect
              ),
              child:  Text(
                ManagerStrings.skip,
                style: TextStyle(
                    color: ManagerColors.skipColor,
                    fontSize: ManagerFontSizes.s12,
                    fontWeight: ManagerFontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: (int value) {
              setState(() {
                _currentPageIndex = value;
              });
            },
            children:  [
              OutBoardingContent(
                image: ManagerAssets.outBoarding1,
                title: ManagerStrings.outBoardingTitle1,
                subTitle: ManagerStrings.outBoardingSubTitle11,
              ),
              OutBoardingContent(
                image: ManagerAssets.outBoarding2,
                title: ManagerStrings.outBoardingTitle2,
                subTitle: ManagerStrings.outBoardingSubTitle2,
              ),
              OutBoardingContent(
                image: ManagerAssets.outBoarding3,
                title: ManagerStrings.outBoardingTitle3,
                subTitle: ManagerStrings.outBoardingSubTitle3,
              ),
            ],
          )),
           SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              progressIndicator(
                color: isFirstPage()
                    ? ManagerColors.progressIndicatorColor
                    : ManagerColors.gray,
                width: isFirstPage() ? ManagerWidth.w20 : ManagerWidth.w8,
              ),
              progressIndicator(
                color: isSecondPage()
                    ? ManagerColors.progressIndicatorColor
                    : ManagerColors.gray,
                width: isSecondPage() ? ManagerWidth.w20 : ManagerWidth.w8,
              ),
              progressIndicator(
                color: isThirdPage()
                    ? ManagerColors.progressIndicatorColor
                    : ManagerColors.gray,
                width: isThirdPage() ? ManagerWidth.w20 : ManagerWidth.w8,
              ),
            ],
          ),
          const SizedBox(
            height: 52,
          ),
          Visibility(
            visible: isNotLastPage(),
            replacement: BaseButton(
              title: ManagerStrings.start,
              onPressed: () {

                Navigator.pushReplacementNamed(
                    context, Routes.loginView);
              },
            ),
            child: BaseButton(
              title: ManagerStrings.next,
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(
                    milliseconds: Constants.pageViewSliderDuration,
                  ),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  bool isNotFirstPage() {
    return _currentPageIndex != 0;
  }

  bool isFirstPage() {
    return _currentPageIndex == 0;
  }

  bool isSecondPage() {
    return _currentPageIndex == 1;
  }

  bool isThirdPage() {
    return _currentPageIndex == 2;
  }

  bool isLastPage() {
    return _currentPageIndex == 2;
  }

  bool isNotLastPage() {
    return _currentPageIndex != 2;
  }
}
