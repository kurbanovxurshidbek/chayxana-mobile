import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IntroController extends GetxController{
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  String text1 = "Боле 2 00 заведений с акциями и бонусами";
  String tex2 = "Получайте подарки, скидки и боеусны";
  List <String> images = ['assets/images/img_2.png',"assets/images/img_1.png","assets/images/img.png"];
  int page = 0;
  void directSmooth(int index){
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
          index + 1, duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }
}