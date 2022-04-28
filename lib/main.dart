import 'package:chayxana/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services/init_service.dart';
import 'services/lang_service.dart';

void main() async{
  await InitService.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
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
    );
  }
}
