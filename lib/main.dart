import 'package:chayxana/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'services/init_service.dart';

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
      // translations: LangService(),
      // locale: LangService.locale,
      // fallbackLocale: LangService.fallbackLocale,
    );
  }
}
