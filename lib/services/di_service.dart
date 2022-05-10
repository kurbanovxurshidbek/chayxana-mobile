import 'package:chayxana/pages/intro_page/intro_controller.dart';
import 'package:chayxana/pages/splash/splash_contoller.dart';
import 'package:chayxana/pages/test/test_controller.dart';
import 'package:get/get.dart';

class DIService {
  static Future<void> init() async {
    // Services

    // Controllers
    Get.lazyPut<TestController>(() => TestController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<IntroController>(() => IntroController(), fenix: true);
  }
}