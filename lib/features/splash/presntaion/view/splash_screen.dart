import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/core/resources/manager_assets.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/core/resources/manager_height.dart';
import 'package:shop_test/core/resources/manager_width.dart';
import 'package:shop_test/features/splash/presntaion/controller/splash_controller.dart';

import '../../../../core/routes.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (context) {
        return Scaffold(
          backgroundColor: ManagerColors.primaryColor,
          body: Container(

            width: double.infinity,
            height: double.infinity,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  width: ManagerWidth.w80,
                  height: ManagerHeight.h100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        ManagerAssets.splash1

                      )
                    ),
                  ),

                )


              ],
            ),
          ),
        );
      }
    );
  }
}
