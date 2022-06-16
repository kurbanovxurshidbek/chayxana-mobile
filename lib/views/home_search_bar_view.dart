import 'package:chayxana/pages/main/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/constants/app_colors.dart';

class HomeSearchBarView extends StatelessWidget {
  HomeController controller;
  HomeSearchBarView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          color: AppColors.colorHomeBottomViewBack,
          height: controller.hight,
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: Get.width * 0.7,
                height: 50,
                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: controller.splashRadius),
                    ],
                    color: AppColors.activeColor,
                    borderRadius: BorderRadius.circular(200)),
                child: TextField(
                  controller: controller.searchTextController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: AppColors.unSelectedTextColor,
                      )),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: controller.splashRadius),
                      ],
                      color: AppColors.activeColor,
                      borderRadius: BorderRadius.circular(4324)),
                  child: Icon(
                    controller.isRisen
                        ? Icons.location_on
                        : Icons.list_alt_outlined,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
