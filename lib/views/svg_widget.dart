import 'package:chayxana/services/const_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';

Widget openSvg(String path,
    {Color color = Colors.white,
    bool isSelected = false,
    double width = 150.0,
    double height = 162.0}) {
  Get.log('isSelected'+isSelected.toString());

  return SvgPicture.asset(
    'assets/icons/ic_$path.svg',
    color: isSelected ? AppColors.activeColor : AppColors.unSelectedTextColor.withOpacity(0.6),
    semanticsLabel: path,
    width: width,
    height: height,
  );
}
