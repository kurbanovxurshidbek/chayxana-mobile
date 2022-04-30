import 'package:get/get.dart';

class IntroController extends GetxController{
  String text1 = "Боле 2 00 заведений с акциями и бонусами";
  String tex2 = "Получайте подарки, скидки и боеусны";
  List <String> images = ['assets/images/img_2.png',"assets/images/img_1.png","assets/images/img.png"];
  int page = 0;
  void directSmooth(int index){
    page = index;
    update();
  }
}
