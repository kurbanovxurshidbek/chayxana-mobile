import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainButton extends StatelessWidget {
  final Color color;
  void Function() onPressed;
  String text;

  MainButton({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: Get.height / 14.9,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(text, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          minWidth: Get.width,
          height: Get.height,

        )
    );
  }
}