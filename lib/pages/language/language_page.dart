import 'package:chayxana/pages/language/language_controller.dart';
import 'package:chayxana/services/const_service.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {
  static const String id = '/lang_page';

  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: Get.height * .1),
          Text('str_choose_lang'.tr,
              style: const TextStyle(
                  fontSize: 24,
                  color: AppColors.unSelectedTextColor,
                  fontWeight: FontWeight.w600)),
          Expanded(
            child: GetBuilder<LanguageController>(
              init: LanguageController(),
              builder: (controller) {
                Get.log(controller.focusedItem.toString());
                return Center(
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: controller.languages.length * 50,
                    child: ListView.builder(
                      controller: controller.controller,
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      physics: const BouncingScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return animatedBtn(
                          controller: controller,
                          index: index,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget animatedBtn(
      {required LanguageController controller, required int index}) {
    return GestureDetector(
      onTap: () => controller.changeLang(controller.languages[index % 3]),
      child: Container(
        height: 50,
        margin: EdgeInsets.zero,
        alignment: Alignment.center,
        child: Text(controller.languages[index % 3],
            style: TextStyle(
                fontSize: controller.focusedItem == index ? 22 : 20,
                color: controller.focusedItem == index
                    ? AppColors.unSelectedTextColor.withOpacity(1.0)
                    : AppColors.unSelectedTextColor.withOpacity(0.5))),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.symmetric(
              horizontal: controller.focusedItem == index
                  ? const BorderSide(color: AppColors.grey, width: 1)
                  : BorderSide.none),
        ),
      ),
    );
  }
}
