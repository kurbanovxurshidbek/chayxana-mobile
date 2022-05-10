import 'dart:async';

import 'package:chayxana/services/db_service.dart';
import 'package:get/get.dart';

import '../language/language_page.dart';
import '../main/main_page.dart';

class SplashController extends GetxController {
  bool firstVisit() {
    return DBService.to.getData(StorageKeys.language) == null;
  }

  void openNextPage() {
    Get.log('66', isError: false);
    Timer(const Duration(seconds: 2), () {
      Get.off(() => firstVisit() ? const LanguagePage() : const MainPage());

      Get.log('666', isError: true);
    });
  }

  @override
  void onInit() {
    openNextPage();
    super.onInit();
  }
}
