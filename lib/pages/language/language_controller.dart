import 'package:chayxana/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController controllerLogo;
  late AnimationController controllerList;
  late Animation<double> animationFadeLogo;
  late Animation<double> animationFadeList;
  late Animation<Offset> animationSlide;

  int selected = 0;
  List<String> languages = ['English', 'Русский', "O'zbek"];

  @override
  void onInit() {
    animationFunction();
    super.onInit();
  }

  void animationFunction() {
    controllerLogo = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    controllerList = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animationFadeLogo =
        CurvedAnimation(parent: controllerLogo, curve: Curves.easeIn);
    animationFadeList =
        CurvedAnimation(parent: controllerList, curve: Curves.easeIn);
    animationSlide = Tween<Offset>(
            begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
        .animate(
            CurvedAnimation(parent: controllerLogo, curve: Curves.elasticIn));
    controllerLogo.forward().whenComplete(() => controllerList.forward());
  }

  void langChangeWithAnimation(int index) {
    selected = index;

    update();
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
    //TODO: open intro page
  }

  void _changeLanguage(var value1, var value2) {
    var locale = Locale(value1, value2);
    Get.updateLocale(locale);
  }
}
