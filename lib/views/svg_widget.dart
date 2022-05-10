import 'package:chayxana/services/const_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';

Widget openSvg(String path,
    {Color? color,
    bool isGradient = true,
    double width = 150,
    double height = 162.0}) {
  Get.log(color.toString());
  return isGradient
      ? LinearGradientMask(
          child: SvgPicture.asset(
            'assets/icons/ic_$path.svg',
            semanticsLabel: path,
            width: width,
            cacheColorFilter: true,
            height: height,
          ),
        )
      : SvgPicture.asset(
          'assets/icons/ic_$path.svg',
          color: color,
          semanticsLabel: path,
          width: width,
          cacheColorFilter: true,
          height: height,
        );
}

class LinearGradientMask extends StatelessWidget {
  final Widget child;

  const LinearGradientMask({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const RadialGradient(
          center: Alignment.topLeft,
          radius: 1,
          colors: AppColors.gradientColor,
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}


