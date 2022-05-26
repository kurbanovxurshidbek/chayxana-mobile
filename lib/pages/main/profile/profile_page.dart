import 'package:chayxana/services/constants/app_assets.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  static const String id = "/profile_page";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.activeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: Get.height / 2.58,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height / 7.46,
                    ),
                    Center(
                      child: Container(
                        width: Get.width / 3.76,
                        height: Get.height / 8.14,
                        child: InkWell(
                          onTap: () {},
                        ),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(AppAssets.personIC),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 14.9,
                    ),
                    const Text(
                      "Абдуллох",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    )
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Мои кошельки",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: Get.height / 14.9,
                        ),
                        const Center(
                          child: Text(
                              "С каждой оплаты вы получаете кешбек на бонусыйсчёт. Здес будет заведения с вашими бонуснымбалансом",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff888A87),
                              )),
                        ),
                        SizedBox(height: Get.height / 11.2),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: Get.height / 11.2,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: AppColors.starColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const ImageIcon(
                                  AssetImage(AppAssets.arrowBackIC),
                                  color: AppColors.activeColor,
                                  size: 26,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Используйте бонусы в заведении",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.activeColor),
                                  ),
                                  Text(
                                    "Используйте бонусы в заведении",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.activeColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                      ])),
              Container(
                  height: 168,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.activeColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(children: [
                    forPersonalInformation(
                      "Город",
                      "assets/icons/img_14.png",
                      "Ташкент",
                    ),
                    const Divider(
                        height: 1, color: AppColors.unSelectedTextColor),
                    forPersonalInformation(
                      "Город",
                      "assets/icons/img_14.png",
                      "Ташкент",
                    ),
                    const Divider(
                        height: 1, color: AppColors.unSelectedTextColor),
                    forPersonalInformation(
                      "Город",
                      "assets/icons/img_14.png",
                      "Ташкент",
                    ),
                  ])),
              const SizedBox(height: 15),
              Container(
                height: 112,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.activeColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    forPersonalInformation(
                      "Город",
                      "assets/icons/img_14.png",
                      "Ташкент",
                    ),
                    const Divider(
                        height: 1, color: AppColors.unSelectedTextColor),
                    forPersonalInformation(
                      "Город",
                      "assets/icons/img_14.png",
                      "Ташкент",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.activeColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    forPersonalInformation(
                      "Город",
                      "assets/icons/img_14.png",
                      "Ташкент",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Expanded forPersonalInformation(
      String whatInfo, String icons, String additional) {
    return Expanded(
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(whatInfo, style: const TextStyle(fontSize: 16)),
              Row(
                children: [
                  Text(additional,
                      style: const TextStyle(
                          fontSize: 14, color: AppColors.subTextColor)),
                  IconButton(
                      onPressed: () {}, icon: ImageIcon(AssetImage(icons)))
                ],
              )
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
