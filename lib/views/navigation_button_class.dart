import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationButton extends StatelessWidget {
  final String text ;
  NavigationButton({Key? key,  this.text = ''}) : super(key: key, );

  @override
  Widget build(BuildContext context) {
    return Container(

      height: Get.height / 14.93,
      width: Get.width / 1.52,
      margin: EdgeInsets.only(left: Get.width / 5.83, right: Get.width / 5.83, bottom: 45),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFF17B700)
      ),
      child: MaterialButton(
        onPressed: (){},
        child: Text( text.tr, style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18, fontWeight: FontWeight.w600),),
      ),
    );
  }
}