import 'package:chayxana/pages/splash/splash_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/svg_widget.dart';

class SplashPage extends StatelessWidget {
  static const String id = '/splash_page';

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  openSvg('logo'),
                  const SizedBox(height: 10),
                  const Text("CHAYXANA",
                      style: TextStyle(color: Colors.red, fontSize: 33))
                ],
              ),
            ),
          );
        });
  }


}
