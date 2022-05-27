import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'intro_controller.dart';

class IntroPage extends StatelessWidget {
  static const String id = "/intro_page";

  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(
      init: IntroController(),
      builder: (_controller) {
        return Scaffold(
          backgroundColor: AppColors.introBackground,
          body: Stack(
            children: [
              PageView(
                controller: _controller.pageController,
                children: [
                  pageViewForm("intro_header_one".tr, "intro_content_one".tr,
                      _controller.images[0]),
                  pageViewForm('intro_header_one'.tr, "intro_content_one".tr,
                      _controller.images[1]),
                  pageViewForm('intro_header_one'.tr, "intro_content_one".tr,
                      _controller.images[2]),
                ],
                onPageChanged: (index) {
                  _controller.directSmooth(index);
                },
              ),

              ///### smooth indicator and inter button
              Positioned(
                left: Get.width / 5.078,
                top: Get.height / 1.251,
                bottom: Get.height / 20.36,
                child: Column(children: [
                  Row(
                    children: [
                      smoothIndicator(_controller, 0),
                      const SizedBox(width: 14),
                      smoothIndicator(_controller, 1),
                      const SizedBox(width: 14),
                      smoothIndicator(_controller, 2),
                    ],
                  ),
                  SizedBox(height: Get.height / 13.78),

                  ///### inter button
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        _controller.bottomTapped(_controller.page);
                      },
                      child: const Center(
                        child: Text(
                          "Начать",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.unSelectedTextColor),
                        ),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: MediaQuery.of(context).size.height / 16,
                    decoration: BoxDecoration(
                        color: AppColors.activeColor,
                        borderRadius: BorderRadius.circular(12)),
                  )
                ]),
              )
            ],
          ),
        );
      },
    );
  }

  CircleAvatar smoothIndicator(IntroController _controller, index) {
    return CircleAvatar(
      backgroundColor: _controller.page == index
          ? AppColors.unSelectedTextColor
          : AppColors.activeColor,
      radius: 7,
    );
  }

  Center pageViewForm(String text1, String text2, String image) {
    return Center(
      child: Column(children: [
        SizedBox(
            height: Get.height / 8.2,
          ),
          const Text(
            " Боле 2 00 заведений \nс акциями и бонусами",
            style: TextStyle(
                color: AppColors.activeColor,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Get.height / 9.8),
          OpenSVG(
            path: image,
            width: Get.width / 1.089,
            height: Get.height / 3.143,
          ),
          SizedBox(height: Get.height / 8),
          Text(
            text2,
            style: const TextStyle(
                fontSize: 16,
                color: AppColors.activeColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}