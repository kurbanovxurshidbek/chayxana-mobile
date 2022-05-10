import 'package:chayxana/pages/language/language_controller.dart';
import 'package:chayxana/pages/main/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main/home/setting_detail/setting_detail_page.dart';

class LanguagePage extends StatelessWidget {
  static const String id = '/lang_page';

  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: Get.height * .1),
          Text('str_choose_lang'.tr,
              style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w600)),
          SizedBox(height: Get.height * .25),
          GetBuilder<LanguageController>(
            init: LanguageController(),
            builder: (controller) {
              Get.log(controller.initialized.toString());
              return FadeTransition(
                opacity: controller.animationFadeList,
                child: SizedBox(
                  height: Get.height * 0.15,
                  child: CupertinoPicker(
                    squeeze: 1,
                    useMagnifier: true,
                    magnification: 1,
                    diameterRatio: 10,
                    itemExtent: 60,
                    onSelectedItemChanged: (index) =>
                        controller.langChangeWithAnimation(index),
                    // physics: const FixedExtentScrollPhysics(),
                    children: [
                      getLanguage(controller, 0),
                      getLanguage(controller, 1),
                      getLanguage(controller, 2),
                    ],
                    looping: true,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: Get.height * .385),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                height: 30,
                color: Colors.green,
                onPressed: () => Get.to(() => const SettingDetailPage()),
                child: const Text('Setting Page')),
              SizedBox(width: 50),
              MaterialButton(
                height: 30,
                color: Colors.red,
                onPressed: () => Get.to(() => const MainPage()),
                child: const Text('Main Page'),
              )
            ],
          ),

        ],
      ),
    );
  }

  Widget getLanguage(LanguageController controller, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.log(controller.isClosed.toString());
        controller.changeLang(controller.languages[index]);
      },
      child: Container(
        alignment: Alignment.center,
        width: Get.width,
        child: Text(
          controller.languages[index],
          textAlign: TextAlign.center,
          style: controller.selected == index
              ? const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 22,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w800)
              : TextStyle(
                  fontSize: 20,
                  color: const Color(0xFF000000).withOpacity(0.5),
                  fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
