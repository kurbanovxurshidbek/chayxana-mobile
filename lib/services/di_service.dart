import 'package:chayxana/pages/splash/splash_contoller.dart';
import 'package:get/get.dart';

class DIService {
  static Future<void> init() async {
    // Services

    // Controllers
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
  }
}