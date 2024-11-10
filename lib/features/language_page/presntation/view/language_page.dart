import 'package:flutter/material.dart';
import 'package:shop_test/core/resources/manager_assets.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/core/resources/manager_font_sizes.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_fonts.dart';
import 'package:shop_test/core/resources/manager_height.dart';
import 'package:shop_test/core/resources/manager_raduis.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/core/resources/manager_width.dart';
import 'package:shop_test/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:shop_test/core/widgets/base_button.dart';

import '../../../../core/routes.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: ManagerWidth.w20),
        // Applying left margin to the whole Container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Aligning items to the left
          children: [
            Container(
              margin: EdgeInsets.only(top: ManagerHeight.h113),
              // Top margin for the image container
              width: ManagerWidth.w140,
              height: ManagerHeight.h140,
              decoration: BoxDecoration(
                  color: ManagerColors.primaryColor,
                  image:
                      DecorationImage(image: AssetImage(ManagerAssets.splash1)),
                  borderRadius: BorderRadius.circular(ManagerRadius.r15)),
            ),
            SizedBox(
              height: ManagerHeight.h20,
            ),
            Text(
              ManagerStrings.languageScreen1,
              style: TextStyle(
                fontWeight: ManagerFontWeight.bold,
                fontSize: ManagerFontSizes.s48,
              ),
            ),
            Text(
              ManagerStrings.languageScreen2,
              style: TextStyle(
                  fontWeight: ManagerFontWeight.bold,
                  fontSize: ManagerFontSizes.s48,
                  height: 0.5),
            ),
            SizedBox(
              height: ManagerHeight.h78,
            ),
            Text(ManagerStrings.selectLanguage,
                style: TextStyle(
                    fontWeight: ManagerFontWeight.bold,
                    fontSize: ManagerFontSizes.s20)),
            const SizedBox(
              height: ManagerHeight.h18,
            ),
            Row(children: [
               Text(
                ManagerStrings.english,
                style: TextStyle(
                    fontSize: ManagerFontSizes.s16,
                    fontWeight: ManagerFontWeight.w600),
              ),
              const SizedBox(
                width: ManagerWidth.w250,
              ),
              Radio(
                value: 1,
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = 1;
                  });
                },
                activeColor: ManagerColors.primaryColor,
              ),
            ]),
            Divider(
              thickness: 1,
              color: ManagerColors.black,
            ),
            Row(
              children: [
                Text(
                  ManagerStrings.arabic,
                  style: TextStyle(
                      fontSize: ManagerFontSizes.s16,
                      fontWeight: ManagerFontWeight.w600),
                ),
                SizedBox(
                  width: 264,
                ),
                Radio(
                  value: 2,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = 2;
                    });
                  },
                  activeColor: ManagerColors.primaryColor,
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: ManagerColors.black,
            ),
            SizedBox(
              height: ManagerHeight.h28,
            ),
            Text(
              ManagerStrings.byCreating,
              style: TextStyle(
                  fontSize: ManagerFontSizes.s12,
                  fontWeight: ManagerFontWeight.bold),
            ),
            Text(
              ManagerStrings.terms,
              style: TextStyle(
                fontSize: ManagerFontSizes.s12,
                fontWeight: ManagerFontWeight.bold,
                color: ManagerColors.primaryColor,
              ),
            ),
            SizedBox(
              height: ManagerHeight.h28,
            ),
            BaseButton(onPressed: () {
              AppSettingsSharedPreferences().outBoardingViewed
                  ? Navigator.pushReplacementNamed(context, Routes.loginView)
                  : Navigator.pushReplacementNamed(context, Routes.outBoarding);
            })
          ],
        ),
      ),
    );
  }
}
