
import 'package:chayxana/views/svg_widget.dart';
import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../constants/app_colors.dart';

AppBar appbar({ required String title, required Function()? leadingFunction, required Function()? actionsFunction, required bool centerTitle, required bool leading, bool? actions}) {
  return AppBar(
    leadingWidth: 30,
    elevation: 0,
    leading: leading
        ? Container(
      margin: EdgeInsets.only(left: 8),
      child: OpenSVG(
        path: AppAssets.arrowBackIC,
      ),
    )
        : SizedBox.shrink(),
    // backgroundColor: AppColors.activeColor,
    centerTitle: centerTitle,
    title: Text(
      title,
      style: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          color: AppColors.unSelectedTextColor,
          fontWeight: FontWeight.w700),
    ),
    actions: [
      actions == null
          ? SizedBox.shrink()
          : actions
          ? IconButton(
          onPressed: actionsFunction,
          icon: OpenSVG(
            height: 23,
            width: 20,
            path: AppAssets.closeIC,
          ))
          : Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 15),
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment(3.4, -2.3),
          children: [
            Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            CircleAvatar(
              backgroundColor: Color(0xFFF44336),
              radius: 7,
            )
          ],
        ),
      ),
    ],
  );
}
