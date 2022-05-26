import 'package:chayxana/pages/language/language_controller.dart';
import 'package:chayxana/services/const_service.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {
  static const String id = '/lang_page';

  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LanguageController>(
        init: LanguageController(),
        builder: (controller) {
          Get.log(controller.focusedItem.toString());
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * .1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: Get.width * .285),
                      child: Text('str_choose_lang'.tr,
                          style: const TextStyle(
                              fontSize: 24,
                              color: AppColors.unSelectedTextColor,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  IconButton(
                      onPressed: () => controller.openIntroPage(),
                      icon: const Icon(Icons.navigate_next))
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  child: FadeTransition(
                    opacity: controller.animationFadeList,
                    child: SizedBox(
                      height: 165,
                      child: CupertinoPicker(
                        backgroundColor: AppColors.activeColor,
                        squeeze: 1,
                        useMagnifier: true,
                        magnification: 1,
                        diameterRatio: 10,
                        itemExtent: 60,
                        onSelectedItemChanged: (index) =>
                            controller.langChangeWithAnimation(index),
                        // physics: const FixedExtentScrollPhysics(),
                        children: [
                          getLanguage("English", 0, controller.selected),
                          getLanguage("Russian", 1, controller.selected),
                          getLanguage("Uzbek", 2, controller.selected),
                        ],
                        looping: true,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget getLanguage(String language, int index, int selected) {
    return ListTile(
      title: InkWell(
        child: Text(language,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 22,
                color: AppColors.unSelectedTextColor,
                fontWeight: FontWeight.w700)),
        onTap: () {},
      ),
    );
  }
}
