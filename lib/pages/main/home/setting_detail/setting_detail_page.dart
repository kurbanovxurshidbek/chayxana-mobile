import 'package:chayxana/pages/main/home/setting_detail/setting_detail_controller.dart';
import 'package:chayxana/services/const_service.dart';
import 'package:chayxana/services/db_service.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingDetailPage extends StatelessWidget {
  static const String id = '/setting_detail_page';

  const SettingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingDetailController>(
      init: SettingDetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => controller.goBack(),
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Color(0xFF000000),
                )),
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              getMonth(DateTime.now().month) +
                  ' ' +
                  DateTime.now().day.toString(),
              style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w700),
            ),
          ),
          body: SizedBox(
            width: Get.width,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 25),
                  height: 70,
                  decoration: const BoxDecoration(
                      border: Border.symmetric(
                          horizontal:
                              BorderSide(color: Color(0xFFB3B3B3), width: 1))),
                  child: Row(
                    children: [
                      Text(
                        "str_guests".tr,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Container(
                        width: Get.width * .47,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.borderColor, width: 1)),
                        margin: const EdgeInsets.symmetric(vertical: 11),
                        padding: const EdgeInsets.symmetric(
                            vertical: 9, horizontal: 16),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                "People count".tr,
                                style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            PopupMenuButton(
                                offset: const Offset(15, 35),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.arrow_downward,
                                  color: Color(0xFFC2C2C2),
                                ),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      child: Row(
                                        children: [
                                          Text(
                                              '${controller.minNumberPeople[1]} - ${controller.maxNumberPeople[1]}')
                                        ],
                                      ),
                                      value: 1,
                                    ),
                                    PopupMenuItem(
                                      child: Row(
                                        children: [
                                          Text(
                                              '${controller.minNumberPeople[2]} - ${controller.maxNumberPeople[2]}')
                                        ],
                                      ),
                                      value: 2,
                                    ),
                                    PopupMenuItem(
                                      child: Row(
                                        children: [
                                          Text(
                                              '${controller.minNumberPeople[3]} - ${controller.maxNumberPeople[3]}')
                                        ],
                                      ),
                                      value: 3,
                                    ),
                                    PopupMenuItem(
                                      child: Row(
                                        children: [
                                          Text(
                                              '${controller.minNumberPeople[4]} - ${controller.maxNumberPeople[4]}')
                                        ],
                                      ),
                                      value: 4,
                                    ),
                                  ];
                                })
                          ],
                        ),
                      ),
                      const SizedBox(width: 25),
                    ],
                  ),
                ),

                // timeLine
                Container(
                  height: Get.height * .25,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor, width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      DatePicker(
                        DateTime.now(),
                        width: Get.width * .175,
                        height: Get.height * .14,
                        monthTextStyle: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            color: AppColors.unSelectedTextColor,
                            fontWeight: FontWeight.w400),
                        dateTextStyle: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 32,
                            color: AppColors.unSelectedTextColor,
                            fontWeight: FontWeight.w600),
                        dayTextStyle: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: AppColors.unSelectedTextColor,
                            fontWeight: FontWeight.w400),
                        locale:
                            DBService.to.getData(StorageKeys.language) ?? 'ru',

                        selectionColor: AppColors.mainColor,
                        selectedTextColor: AppColors.activeColor,
                        deactivatedColor: AppColors.deActiveColor,
                        onDateChange: (date) {},
                        inactiveDates: [DateTime(2022, 05, 9)],
                      ),
                    ],
                  ),
                ),
                Container(height: 1, width: Get.width, color: AppColors.borderColor),

                //timeOfWork
                Container(
                  height: Get.height * .27,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 9),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 4,
                            crossAxisCount: 3,
                            childAspectRatio: 2.5,
                            mainAxisSpacing: 4),
                    itemCount: controller.workTime.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 3),
                        decoration: BoxDecoration(
                            color: index == 3
                                ? AppColors.mainColor
                                : AppColors.activeColor,
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(controller.workTime[index]),
                      );
                    },
                  ),
                ),
                Container(height: 1, width: Get.width, color: AppColors.borderColor),
                Container(
                  height: Get.height * .023 * controller.rooms.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 9),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(12)),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 4,
                            crossAxisCount: 3,
                            childAspectRatio: 2.5,
                            mainAxisSpacing: 4),
                    itemCount: controller.rooms.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 3),
                        decoration: BoxDecoration(
                            color: index == 3
                                ? AppColors.mainColor
                                : AppColors.activeColor,
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(controller.rooms[index].toString()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Container ownDate(SettingDetailController controller) {
    return Container(
      alignment: Alignment.center,
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 500,
          itemBuilder: (context, index) {
            DateTime _date = DateTime.now().add(Duration(days: index));
            DateTime date = DateTime(_date.year, _date.month, _date.day);

            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: InkWell(
                onTap: () {
                  controller.selected = index;
                },
                child: Ink(
                  color: AppColors.mainColor,
                  width: 64,
                  height: 105,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        getMonth(date.month),
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        date.day.toString(),
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 32,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(getWeekday(date.weekday)),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  String getMonth(int index) {
    List<String> months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      "Jun",
      'Jul',
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return months[index];
  }

  String getWeekday(int index) {
    List<String> weekdays = [
      '',
      'Mon',
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat",
      "Sun"
    ];
    return weekdays[index];
  }
}
