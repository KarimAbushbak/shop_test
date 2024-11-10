import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_test/core/resources/manager_colors.dart';
import 'package:shop_test/core/resources/manager_font_sizes.dart';
import 'package:shop_test/core/resources/manager_font_weight.dart';
import 'package:shop_test/core/resources/manager_strings.dart';
import 'package:shop_test/features/home/presntation/controller/home_controller.dart';

import '../../../core/resources/manager_height.dart';

class DetailsView extends StatelessWidget {
  bool isUnderwaySelected = true;

  DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ManagerStrings.byCreating),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!controller.isUnderwaySelected.value)
                          controller.toggleSelection();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Text(
                          'Hint',
                          style: TextStyle(
                            color: controller.isUnderwaySelected.value
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    if (controller.isUnderwaySelected.value)
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        height: 5,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.isUnderwaySelected.value)
                          controller.toggleSelection();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Text(
                          'Previous',
                          style: TextStyle(
                            color:
                                isUnderwaySelected ? Colors.grey : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    if (!isUnderwaySelected)
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        height: 5,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Add spacing between buttons and containers
            if (isUnderwaySelected)
              // Display a single blue container when "Hint" is selected
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 600,
                    height: 400,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(controller
                                .homeModel.data.first.thumbnailImage))),
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.homeModel.data.first.name,
                            style: TextStyle(
                                fontSize: ManagerFontSizes.s20,
                                fontWeight: ManagerFontWeight.w600),
                          ),
                          Text(
                            controller.productPrice(
                                controller.homeModel.data.first.basePrice
                                    .toString(),
                                controller.homeModel.data.first.unit),
                            style: TextStyle(
                                color: ManagerColors.gray,
                                fontSize: ManagerFontSizes.s20,
                                fontWeight: ManagerFontWeight.w600),
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.star,
                            color: Colors.yellow.shade800, size: 20),
                        Text(
                          '(${controller.homeModel.data.first.rating.toString()}) ',
                          style: TextStyle(
                              fontSize: ManagerFontSizes.s20,
                              fontWeight: ManagerFontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quantity",
                          style: TextStyle(
                              color: ManagerColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: ManagerFontSizes.s20),
                        ),
                        Container(
                          height: ManagerHeight.h34,
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  controller.decreaseQuantity();
                                },
                                icon: const Icon(
                                  Icons.remove_circle_outline,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                controller.quantity.value.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  controller.increaseQuantity();
                                },
                                icon: const Icon(
                                  Icons.add_circle_outline,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            else
              // Display two green containers when "Previous" is selected
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: Text(
                      'Green Container 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Spacing between the two green containers
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: Text(
                      'Green Container 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
          ],
        );
      }),
    );
  }
}
