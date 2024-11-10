import 'package:flutter/material.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/core/resources/manager_font_sizes.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_height.dart';
import 'package:shop_test/core/resources/manager_strings.dart';

import '../../../../core/resources/manager_assets.dart';

class OutBoardingContent extends StatelessWidget {
  final String image;
  final String? title;
  final String? subTitle;

  const OutBoardingContent({
    super.key,
    this.image = ManagerAssets.outBoarding1,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 310,
          height: 275,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image))),
        ),
        SizedBox(height: ManagerHeight.h64,),
        Text(
          title ?? ManagerStrings.outBoardingTitle1,
          style: TextStyle(
            fontSize: ManagerFontSizes.s34,
            fontWeight: ManagerFontWeight.bold
          ),

        ),
        Container(
          width: 301,
          height: 78,
          child: Text(
            subTitle ?? ManagerStrings.outBoardingSubTitle11,
            style: TextStyle(
              fontWeight: ManagerFontWeight.regular,
              fontSize: ManagerFontSizes.s16,
              color: Colors.grey
            ),
            textAlign: TextAlign.center,
          ),
        )

      ],
    );
  }
}
