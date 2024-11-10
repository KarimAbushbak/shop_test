import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/features/authntication/presntaion/controller/auth_controller.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_font_sizes.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_raduis.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_width.dart';
import '../../../../core/routes.dart';
import '../../../../core/widgets/base_button.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 58),
                  width: ManagerWidth.w132,
                  height: ManagerHeight.h40,
                  child: Text(
                    ManagerStrings.register,
                    style: TextStyle(
                        fontSize: ManagerFontSizes.s26,
                        fontWeight: ManagerFontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                SizedBox(
                  width: ManagerWidth.w320,
                  height: ManagerHeight.h56,
                  child: Text(
                    ManagerStrings.loginSubTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ManagerColors.loginSubTitleColor,
                        fontWeight: ManagerFontWeight.regular,
                        fontSize: ManagerFontSizes.s14),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: ManagerWidth.w16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // Aligning text to the right
                    children: [
                      Text(
                        ManagerStrings.name,
                        style: TextStyle(
                            fontSize: ManagerFontSizes.s16,
                            fontWeight: ManagerFontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: TextField(
                    controller: controller.userNameTextEditingController,
                    cursorColor: ManagerColors.primaryColor,
                    decoration: InputDecoration(
                        errorText: controller.nameError,
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.errorColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: Icon(Icons.hot_tub),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor),
                          // Border color when not focused
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor),
                          // Border color when focused
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: ManagerStrings.nameLabelText,
                        labelStyle:
                            TextStyle(color: ManagerColors.labelTextColor)),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: ManagerWidth.w16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // Aligning text to the right
                    children: [
                      Text(
                        ManagerStrings.password,
                        style: TextStyle(
                            fontSize: ManagerFontSizes.s16,
                            fontWeight: ManagerFontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: TextField(
                    obscureText: controller.showPassword,
                    controller: controller.passwordTextEditingController,
                    cursorColor: ManagerColors.primaryColor,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => controller.changePasswordVisibility(),
                          icon: controller.showPassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(
                            Icons.visibility,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        errorText: controller.passwordError,
                        errorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.errorColor),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor),
                          // Border color when not focused
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor),
                          // Border color when focused
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: ManagerStrings.passwordLabelText,
                        labelStyle:
                            TextStyle(color: ManagerColors.labelTextColor)),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: ManagerWidth.w16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // Aligning text to the right
                    children: [
                      Text(
                        ManagerStrings.confirmPassword,
                        style: TextStyle(
                            fontSize: ManagerFontSizes.s16,
                            fontWeight: ManagerFontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: TextField(
                    obscureText: controller.showConfirmPassword,
                    controller: controller.confirmPasswordTextEditingController,
                    cursorColor: ManagerColors.primaryColor,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => controller.changeConfirmPasswordVisibility(),
                          icon: controller.showConfirmPassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(
                            Icons.visibility,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        errorText: controller.confirmPasswordError,
                        errorBorder:  OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.errorColor),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor),
                          // Border color when not focused
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor),
                          // Border color when focused
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: ManagerStrings.confirmPasswordLabelText,
                        labelStyle:
                            TextStyle(color: ManagerColors.labelTextColor)),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: ManagerWidth.w16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // Aligning text to the right
                    children: [
                      Text(
                        ManagerStrings.email,
                        style: TextStyle(
                            fontSize: ManagerFontSizes.s16,
                            fontWeight: ManagerFontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: TextField(
                    controller: controller.emailTextEditingController,
                    cursorColor: ManagerColors.primaryColor,
                    decoration: InputDecoration(
                        errorText: controller.emailError,
                        errorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.errorColor),
                        ),
                        suffixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor),
                          // Border color when not focused
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor),
                          // Border color when focused
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: ManagerStrings.emailLabelText,
                        labelStyle:
                            TextStyle(color: ManagerColors.labelTextColor)),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: ManagerWidth.w16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // Aligning text to the right
                    children: [
                      Text(
                        ManagerStrings.phone,
                        style: TextStyle(
                            fontSize: ManagerFontSizes.s16,
                            fontWeight: ManagerFontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: TextField(
                    controller: controller.phoneTextEditingController,
                    cursorColor: ManagerColors.primaryColor,
                    decoration: InputDecoration(
                        errorText: controller.phoneError,
                        errorBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.errorColor),
                        ),
                        suffixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor),
                          // Border color when not focused
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ManagerColors.primaryColor),
                          // Border color when focused
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: ManagerStrings.phoneLabelText,
                        labelStyle:
                            TextStyle(color: ManagerColors.labelTextColor)),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                BaseButton(
                  onPressed: () {
                    controller.performRegister(context);
                  },
                  title: ManagerStrings.login,
                ),
                SizedBox(
                  height: ManagerHeight.h16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Aligning text to the right
                  children: [
                    Text(
                      ManagerStrings.or,
                      style: TextStyle(
                          fontSize: ManagerFontSizes.s16,
                          fontWeight: ManagerFontWeight.regular),
                    ),
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                Container(
                  width: ManagerWidth.w388,
                  height: ManagerHeight.h64,
                  decoration: BoxDecoration(
                      border: Border.all(color: ManagerColors.borderColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: ManagerWidth.w50,
                        height: ManagerHeight.h34,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                // fit: BoxFit.fill,
                                image: AssetImage(ManagerAssets.facebook))),
                      ),
                      Text(ManagerStrings.facebook,
                          style: TextStyle(
                              fontSize: ManagerFontSizes.s16,
                              fontWeight: ManagerFontWeight.w600)),
                    ],
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                Container(
                  width: ManagerWidth.w388,
                  height: ManagerHeight.h64,
                  decoration: BoxDecoration(
                      border: Border.all(color: ManagerColors.borderColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: ManagerWidth.w50,
                        height: ManagerHeight.h34,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(ManagerAssets.gmail))),
                      ),
                      Text(ManagerStrings.gmail,
                          style: TextStyle(
                              fontSize: ManagerFontSizes.s16,
                              fontWeight: ManagerFontWeight.w600)),
                    ],
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ManagerStrings.dontHave,
                      style: TextStyle(
                        fontSize: ManagerFontSizes.s16,
                        fontWeight: ManagerFontWeight.regular,
                      ),
                    ),
                    SizedBox(
                      width: ManagerWidth.w8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.loginView);
                      },
                      child: Text(
                        ManagerStrings.signUp,
                        style: TextStyle(
                          color: ManagerColors.primaryColor,
                          fontSize: ManagerFontSizes.s16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
