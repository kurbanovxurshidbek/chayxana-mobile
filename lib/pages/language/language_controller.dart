import 'package:chayxana/pages/intro/intro_page.dart';
import 'package:chayxana/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController
    with GetTickerProviderStateMixin {
  ScrollController controller = ScrollController();
  double curIndex = 0;

  ///for scrolling Languages
  int focusedItem = 1;

  List<String> languages = ['English', 'Русский', "O'zbek"];

  @override
  void onInit() {
    controller.addListener(() {
      focusedItem = (controller.position.pixels ~/ 50).ceil() + 1;

      update();
    });

    super.onInit();
  }

  void changeLang(String value) {
    Get.log(value);
    if (value == languages[0]) {
      _changeLanguage('en', 'EN');
      DBService.to.setData(StorageKeys.language, 'en');
    } else if (value == languages[1]) {
      _changeLanguage('ru', 'RU');
      DBService.to.setData(StorageKeys.language, 'ru');
    } else if (value == languages[2]) {
      _changeLanguage('uz', 'UZ');
      DBService.to.setData(StorageKeys.language, 'uz');
    }
    _openIntroPage();
  }

  void _changeLanguage(var value1, var value2) {
    var locale = Locale(value1, value2);
    Get.updateLocale(locale);
  }

  void langController(double index) {
    if (controller.offset == controller.position.maxScrollExtent / 2) {
      controller.positions.single.context.notificationContext;
    }
    curIndex = index;
    controller.animateTo(curIndex * 50.0,
        duration: const Duration(seconds: 2), curve: Curves.fastOutSlowIn);
    update();
  }

  void _openIntroPage() => Get.off(() => const IntroPage());
}
