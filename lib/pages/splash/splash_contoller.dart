import 'dart:async';

import 'package:chayxana/pages/language/language_page.dart';
import 'package:chayxana/pages/main/main_page.dart';
import 'package:chayxana/services/db_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  bool firstVisit() {
    return DBService().getData(StorageKeys.accessToken) == null ? true : false;
  }

  void openNextPage() {
    Timer(const Duration(seconds: 2), () {
      Get.off(() => firstVisit() ? const LanguagePage() : const MainPage());
    });
  }

  @override
  void onInit() {
    openNextPage();
    super.onInit();
  }
}
