import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/services/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/constants/app_assets.dart';

class ChayxanaItem extends StatelessWidget {
  ChayxanaItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  child: Image.asset(
                    "assets/images/im_gallery_photo11.png",
                    height: Get.height * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: Get.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Дода Ош маркази",
                        style: AppFonts.chayxanaItemTitle(),
                      ),
                      Text(
                        "Локатся:Улица Дархан 45",
                        style: AppFonts.chayxanaItemTContent(),
                      ),
                      Text(
                        "Работает до 00:00",
                        style: AppFonts.chayxanaItemTContent(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "15 км",
                            style: AppFonts.chayxanaItemDistance(),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AppAssets.calendar,
                                fit: BoxFit.cover,
                                width: 20,
                                height: 20,
                                color: AppColors.colorShayxanaItemDistance,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                AppAssets.message,
                                width: 20,
                                fit: BoxFit.cover,
                                height: 20,
                                color: AppColors.colorShayxanaItemDistance,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                AppAssets.location,
                                width: 20,
                                fit: BoxFit.cover,
                                height: 20,
                                color: AppColors.colorShayxanaItemDistance,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.topRight,
          child: CircleAvatar(
            backgroundColor: AppColors.mainColor,
            child: Text(
              "7.5",
              style: AppFonts.chayxanaItemHour(),
            ),
          ),
        ),
      ],
    );
  }
}
