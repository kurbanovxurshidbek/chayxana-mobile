import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  /// #Otabek

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  List <String> images = [
    'assets/images/img_2.png',
    "assets/images/img_1.png",
    "assets/images/img.png"
  ];
  int page = 0;



  void directSmooth(int index) {
    page = index;
    update();
  }
  void bottomTapped(int index) {
    page = index;
    update();
    if (index == 2) {

      ///### for move to HomePage

    } else {
      pageController.animateToPage(
          index + 1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}