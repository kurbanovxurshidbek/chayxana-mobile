import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const Text("CHAYXANA", style: TextStyle(color: Colors.red, fontSize: 33))
          ],
        ),
      ),
    );
  }

  Widget openSvg(String path,
      {Color color = Colors.red, double width = 150.0, double height = 162.0}) {
    return SvgPicture.asset(
      'assets/icons/ic_$path.svg',
      color: color,
      semanticsLabel: path,
      width: width,
      height: height,
    );
  }
}
