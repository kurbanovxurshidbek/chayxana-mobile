import 'package:chayxana/pages/main/home/filter_page/filter_controller.dart';
import 'package:chayxana/services/constants/app_assets.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPage extends StatelessWidget {
  static const String id = "/filter_page";
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
        init: FilterController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: Get.height / 5,
              centerTitle: true,
              title: const Text(
                "Филтьтр",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "poppins",
                  color: Colors.white,
                ),
              ),
              elevation: 0.0,
              backgroundColor: const Color(0xff191919),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: Get.width,
                  decoration: const BoxDecoration(
                      color: AppColors.dashboardRowButtonIsNotPressed,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: AppColors.activeColor,
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        child: TextField(
                            onEditingComplete: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            //  controller: searchController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.search),
                              hintText: "Поиск",
                              hintStyle: TextStyle(
                                  color: AppColors.grey,
                                  fontFamily: "inter",
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Сервисы Чайхана",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "poppins",
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChooseComfort(
                    function: () {
                      controller.onTab(0);
                    },
                    textOfButton: "Забронировать комната",
                    iconsPath: AppAssets.calendar,
                    number: 1,
                    isTab: controller.isTabs[0],
                    widthOfIT: 300,
                  ),
                  ChooseComfort(
                    function: () {
                      controller.onTab(1);
                    },
                    textOfButton: "Бонусная программа",
                    iconsPath: AppAssets.gift,
                    number: 1,
                    isTab: controller.isTabs[1],
                    widthOfIT: 270,
                  ),
                  ChooseComfort(
                    function: () {
                      controller.onTab(2);
                    },
                    textOfButton: "Оплата счёта",
                    iconsPath: AppAssets.total,
                    number: 1,
                    isTab: controller.isTabs[2],
                    widthOfIT: 230,
                  ),
                  ChooseComfort(
                    function: () {
                      controller.onTab(3);
                    },
                    textOfButton: "Предзаказ",
                    iconsPath: AppAssets.glass,
                    number: 1,
                    isTab: controller.isTabs[3],
                    widthOfIT: 200,
                  ),
                  const Text(
                    "Сервисы Чайхана",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "poppins",
                      color: AppColors.unSelectedTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChooseComfort(
                        function: () {
                          controller.onTab(4);
                        },
                        textOfButton: "Веранды",
                        iconsPath: AppAssets.calendar,
                        number: 1,
                        isTab: controller.isTabs[4],
                        widthOfIT: Get.width / 2.2,
                      ),
                      ChooseComfort(
                        function: () {
                          controller.onTab(5);
                        },
                        textOfButton: "Парковка",
                        iconsPath: AppAssets.calendar,
                        number: 1,
                        isTab: controller.isTabs[5],
                        widthOfIT: Get.width / 2.2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChooseComfort(
                        function: () {
                          controller.onTab(6);
                        },
                        textOfButton: "Веранды",
                        iconsPath: AppAssets.calendar,
                        number: 1,
                        isTab: controller.isTabs[6],
                        widthOfIT: Get.width / 2.2,
                      ),
                      ChooseComfort(
                        function: () {
                          controller.onTab(7);
                        },
                        textOfButton: "Парковка",
                        iconsPath: AppAssets.calendar,
                        number: 1,
                        isTab: controller.isTabs[7],
                        widthOfIT: Get.width / 2.2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            )),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: !controller.isClean
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 52,
                          width: Get.width / 2 - 20,
                          decoration: BoxDecoration(
                              color: const Color(0xffededed),
                              borderRadius: BorderRadius.circular(12)),
                          child: MaterialButton(
                            onPressed: () {
                              controller.clearTabs();
                            },
                            child: const Text("Очистить"),
                          )),
                      Container(
                          height: 52,
                          width: Get.width / 2 - 20,
                          decoration: BoxDecoration(
                              color: const Color(0xff17B700),
                              borderRadius: BorderRadius.circular(12)),
                          child: MaterialButton(
                            onPressed: () {
                              controller.selectTabs();
                              Navigator.pop(context);
                            },
                            child: const Text("Применить"),
                          ))
                    ],
                  ),
          );
        });
  }
}

// ignore: must_be_immutable
class ChooseComfort extends StatelessWidget {
  final int number;
  final String textOfButton;
  final String iconsPath;
  final bool isTab;
  final double widthOfIT;
  final Function? function;

  const ChooseComfort(
      {Key? key,
      this.function,
      required this.textOfButton,
      required this.number,
      required this.iconsPath,
      required this.isTab,
      required this.widthOfIT})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: widthOfIT,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isTab ? const Color(0xff17B700) : const Color(0xffFFFFFF),
        ),
        child: MaterialButton(
            minWidth: 50,
            onPressed: () {
              function!();
            },
            child: Row(
              children: [
                Image.asset(
                  iconsPath,
                  width: 25,
                  height: 25,
                  color: AppColors.colorShayxanaItemCalendar,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  textOfButton,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: "inter",
                      fontSize: 16,
                      color: AppColors.colorShayxanaItemCalendar),
                ),
              ],
            )));
  }
}
