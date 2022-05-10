import 'package:chayxana/pages/language/language_page.dart';
import 'package:chayxana/pages/main/home/setting_detail/setting_detail_page.dart';
import 'package:chayxana/pages/main/main_page.dart';
import 'package:chayxana/pages/main/profile/faq/faq_page.dart';
import 'package:chayxana/pages/splash/splash_page.dart';
import 'package:chayxana/services/init_service.dart';
import 'package:chayxana/services/lang_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await InitService.init();


  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // statusBarBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  },);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chayxana Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const SplashPage(),
      // Localization
      translations: LangService(),
      locale: LangService.locale,
      fallbackLocale: LangService.fallbackLocale,
      getPages: [
        GetPage(name: SplashPage.id, page: () => const SplashPage()),
        GetPage(name: LanguagePage.id, page: () => const LanguagePage()),
        GetPage(name: MainPage.id, page: () => const MainPage()),
        GetPage(
            name: SettingDetailPage.id, page: () => const SettingDetailPage()),
        GetPage(name: FAQPage.id, page: () => const FAQPage()),
      ],
    );
  }
}
