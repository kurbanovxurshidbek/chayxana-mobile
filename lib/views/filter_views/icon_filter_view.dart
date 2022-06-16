import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/services/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class IconFilter extends StatelessWidget {
  String childIcon;
  String label;
  bool isChacked;
  Color? iconColor;
  Color? backgrounColor;
  double sizeWidth;
  IconFilter(
      {Key? key,
      this.backgrounColor,
      required this.sizeWidth,
      this.iconColor,
      required this.childIcon,
      required this.label,
      this.isChacked = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 60, end: isChacked ? sizeWidth : 60),
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 700),
        builder: (context, width, _) {
          return Container(
            margin: EdgeInsets.all(5),
            width: width,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isChacked ? iconColor : backgrounColor,
              borderRadius: BorderRadius.circular(12313),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  childIcon,
                  width: 25,
                  height: 25,
                  color: isChacked ? AppColors.activeColor : iconColor,
                  fit: BoxFit.fill,
                ),
                isChacked
                    ? TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 800),
                        tween: Tween(begin: 0, end: 18),
                        curve: Curves.easeIn,
                        builder: (context, size, _) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              label,
                              style: AppFonts.poppinsBlackItalic(
                                  color: AppColors.activeColor, fontSize: size),
                            ),
                          );
                        })
                    : Container()
              ],
            ),
          );
        });
  }
}
