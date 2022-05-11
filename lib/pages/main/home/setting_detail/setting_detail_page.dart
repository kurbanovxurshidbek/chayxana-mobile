import 'package:chayxana/pages/main/home/setting_detail/setting_detail_controller.dart';
import 'package:chayxana/services/const_service.dart';
import 'package:chayxana/services/db_service.dart';
import 'package:chayxana/views/half_width_btn.dart';
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
                  color: AppColors.unSelectedTextColor,
                )),
            elevation: 0,
            backgroundColor: AppColors.activeColor,
            centerTitle: true,
            title: Text(
              getWeekday(DateTime.now().weekday) + '. '+
              getMonth(DateTime.now().month) +
                  ' ' +
                  DateTime.now().day.toString(),
              style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  color: AppColors.unSelectedTextColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
          body: SizedBox(
            width: Get.width,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 70,
                  decoration:  BoxDecoration(
                      border: Border.symmetric(
                          horizontal:
                              BorderSide(color: AppColors.borderColor.withOpacity(0.5), width: 1))),
                  child: Row(
                    children: [
                      Text(
                        "str_guests".tr,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: AppColors.unSelectedTextColor,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Container(
                        width: Get.width * .47,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                                color: AppColors.borderColor.withOpacity(0.5), width: 1)),
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
                                    color: AppColors.unSelectedTextColor,
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
                  height: Get.height * .22,
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.borderColor.withOpacity(0.5), width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        ' ' + "str_choose_date".tr,
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            color: AppColors.unSelectedTextColor,
                            fontWeight: FontWeight.w600),
                      ),
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
                        deactivatedColor: AppColors.borderColor,
                        onDateChange: (date) {},
                        inactiveDates: [DateTime(2022, 05, 9)],
                      ),
                    ],
                  ),
                ),
                customDivider(),

                //freeRooms
                chooseItem(
                    text: "str_choose_room",
                    controller: controller,
                    items: controller.rooms,
                    selectedItem: controller.selectedRoom),
                customDivider(),

                //timeOfWork
                chooseItem(
                    text: "str_choose_time",
                    controller: controller,
                    items: controller.workTime,
                    selectedItem: controller.selectedHour),

                customDivider(),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InternalButton(
                      text: "str_clear",
                      function: () {},
                      textColor: AppColors.unSelectedTextColor,
                      btnColor: AppColors.btnColor,
                    ),
                    const SizedBox(width: 9),
                    InternalButton(text: "str_next", function: () {}),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }

  Container customDivider() {
    return Container(
                  height: 1, width: Get.width, color: AppColors.borderColor.withOpacity(0.5));
  }

  Widget chooseItem<T>(
      {required SettingDetailController controller,
      required String text,
      required List<T> items,
      required int? selectedItem}) {
    return Container(
      height: Get.height * .023 * items.length + 60,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 9),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           ' ' + text.tr,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 24,
                color: AppColors.unSelectedTextColor,
                fontWeight: FontWeight.w600),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 4,
                crossAxisCount: 3,
                childAspectRatio: 2.5,
                mainAxisSpacing: 4),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => items == controller.rooms
                    ? controller.chooseRoom(index)
                    : controller.chooseHour(index),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                  decoration: BoxDecoration(
                      color: index == selectedItem
                          ? AppColors.mainColor
                          : AppColors.activeColor,
                      border: Border.all(color: AppColors.borderColor.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    items[index].toString(),
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        color: index == selectedItem
                            ? AppColors.activeColor
                            : AppColors.unSelectedTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              );
            },
          ),
        ],
      ),
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
