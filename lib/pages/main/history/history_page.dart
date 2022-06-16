// Khusanboev, [16.06.2022 15:28]
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chayxana/models/scroll_behavior.dart';
import 'package:chayxana/pages/main/history/notification/notification_page.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'history_controller.dart';
import 'package:lottie/lottie.dart';
import 'history_controller.dart';
class HistoryPage extends StatelessWidget {
  HistoryController controller = Get.put(HistoryController());
  static const String id = "/history_page";


  HistoryPage({Key? key}) : super(key: key);

  openNot() {
    Get.to(const NotificationPage());
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d-MMMM').format(now);

    return GetBuilder(
        init: HistoryController(),
        builder: (HistoryController controller) => Scaffold(
          appBar: appbar(
              title: "History Booking",
              leadingFunction: null,
              actionsFunction: openNot,
              centerTitle: false,
              leading: true,
              actions: false),
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                controller.data.isNotEmpty
                    ? ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    /// All Container
                    return Container(
                      padding: EdgeInsets.only(top: Get.height / 64),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 167,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: AppColors.activeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              /// Image Container

                              Container(
                                margin: const EdgeInsets.only(
                                    left: 15, right: 8),
                                height: 95,
                                width: Get.width / 3.9,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(8),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                  "https://media-cdn.tripadvisor.com/media/photo-s/15/7d/d1/67/caption.jpg",
                                  imageBuilder:
                                      (context, imageProvider) =>
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                        ),
                                      ),
                                  alignment: Alignment.topLeft,
                                ),
                              ),

                              Flexible(
                                  flex: 2,
                                  child: SizedBox(
                                    height: 95,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        /// Name Tea Hause
                                        Text(
                                          controller.limitedText(
                                              "Tea House Vostok"),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: "Poppins",
                                              height: 1,
                                              fontWeight:
                                              FontWeight.w500),
                                        ),
                                        const SizedBox(height: 4),

                                        /// Location Tea House
                                        Flexible(
                                          child: Text(
                                            controller.limitedText(
                                              " Location: Street Darxon 45",
                                            ),
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.w500,
                                                fontFamily: "Poppins"),
                                            maxLines: 1,
                                          ),
                                        ),
                                        const SizedBox(height: 12),

                                        /// Order date time  room number
                                        Row(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: Get.width / 1.682,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(10),
                                                  color: index.isOdd
                                                      ? AppColors.btnColor
                                                      : AppColors
                                                      .mainColor
                                                      .withOpacity(.7)
                                                //Color.fromRGBO(23, 183, 0, 0.7),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                .center,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(
                                                      formattedDate,
                                                      style: index.isOdd
                                                          ? const TextStyle(
                                                          fontSize:
                                                          13,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontFamily:
                                                          "Poppins")
                                                          : const TextStyle(
                                                          fontSize:
                                                          13,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          fontFamily:
                                                          "Poppins",
                                                          color: AppColors
                                                              .activeColor),
                                                      textAlign: TextAlign
                                                          .center,
                                                    ),
                                                  ),
                                                  //  SizedBox(width:5,),

                                                  Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.symmetric(
                                                            vertical: BorderSide(
                                                                color: index.isOdd
                                                                    ? AppColors
                                                                    .unSelectedTextColor
                                                                    : AppColors
                                                                    .activeColor,
                                                                width:
                                                                1))),
                                                    width: 45,
                                                    height: Get.height *
                                                        0.061,
                                                    alignment:
                                                    Alignment.center,
                                                    child: Text("20:30",
                                                        style: index.isOdd
                                                            ? const TextStyle(
                                                            fontSize:
                                                            13,

                                                            // Khusanboev, [16.06.2022 15:28]
                                                            fontWeight:
                                                            FontWeight
                                                            .w500,
                                                            fontFamily:
                                                            "Poppins")
                                                            : const TextStyle(
                                                            fontSize:
                                                            13,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            fontFamily:
                                                            "Poppins",
                                                            color: AppColors
                                                                .activeColor),
                                                        textAlign:
                                                        TextAlign
                                                            .center),
                                                  ),
                                                  //  SizedBox(width: 5,),

                                                  Expanded(
                                                    flex: 2,
                                                    child: Text("3-room",
                                                        style: index.isOdd
                                                            ? const TextStyle(
                                                            fontSize:
                                                            13,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            fontFamily:
                                                            "Poppins")
                                                            : const TextStyle(
                                                            fontSize:
                                                            13,
                                                            color: AppColors
                                                                .activeColor,
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            fontFamily:
                                                            "Poppins"),
                                                        textAlign:
                                                        TextAlign
                                                            .center),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),

                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Divider(
                              height: 1, color: AppColors.borderColor),
                          SizedBox(
                            height: 45,
                            width: Get.mediaQuery.size.width,
                            child: index.isOdd

                            /// Order Completed

                                ? MaterialButton(
                              child: const Text("Order completed",
                                  style: TextStyle(
                                      color: AppColors.grey,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)),
                              onPressed: () => orderBottomSheet(),
                            )

                            /// Cancel Order Button
                                : MaterialButton(
                              child: const Text("Cancel order",
                                  style: TextStyle(
                                      color: AppColors.red,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)),
                              onPressed: () =>
                                  orderBottomSheetCancel(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )

                ///   Center No orders
                    : Center(
                  heightFactor: Get.height / 25.6,
                  child: const Text(
                    "No orders yet",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.notFoundText),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  /// Order BottomSheet Method
  orderBottomSheet() {
    return Get.bottomSheet(Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: EdgeInsets.only(bottom: Get.height / 14.93),
      height: Get.height / 4.81,
      width: Get.height,
      decoration: BoxDecoration(
        color: AppColors.activeColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Book again",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  height: 1),
            ),
            Divider(
              height: 1,
              color: AppColors.borderColor,
            ),
            Text("Call",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins",
                    height: 1)),
            Divider(
              height: 1,
              color: AppColors.borderColor,
            ),
            Text("Abaut teahouse",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Poppins",
                    height: 1)),
          ],

      ),
    ));
  }

  /// Order BottomSheet Method for cancel
  orderBottomSheetCancel() {
    return Get.bottomSheet(Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: EdgeInsets.only(bottom: Get.height / 14.93),
      height: Get.height / 4.81,
      width: Get.height,
      decoration: BoxDecoration(
        color: AppColors.activeColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // Get.defaultDialog(
              //     content: Column(
              //       children: [
              //         Container(
              //           height: 50,
              //             width: 50,
              //             child: Lottie.asset("assets/lotties/lottie_succes.json",reverse: false, repeat: false)),
              //       ],
              //     ),
              //     actions: [
              //       ElevatedButton(
              //           onPressed: () {},
              //           child: const Text(
              //             'No',
              //           ),
              //       ),
              //       ElevatedButton(
              //           onPressed: () {},
              //           child: const Text(
              //             'Yes',
              //           ),
              //         style: ElevatedButton.styleFrom(
              //           primary: Colors.green,
              //         ),
              //       ),
              //     ],
              //     backgroundColor: AppColors.activeColor,
              //     titleStyle: const TextStyle(color: Colors.white),
              //    // middleTextStyle: TextStyle(color: Colors.white),
              //     radius: 30
              // );
              Get.bottomSheet(Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                margin: EdgeInsets.only(bottom: Get.height / 14.93),
                height: 336,
                width: Get.height,
                decoration: BoxDecoration(
                  color: AppColors.activeColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      child:Obx(()=> controller.isNull1.value
                          ? SizedBox(
                          height: 150,
                          width: 150,
                          child: Lottie.asset(
                              "assets/lotties/lottie_question.json",
                              reverse: false,
                              repeat: true))
                          : Container(
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.symmetric(vertical: 29),
                        child: controller.isLottie.value
                            ? Lottie.asset("assets/lotties/close.json",
                            reverse: false, repeat: true)
                            : Lottie.asset("assets/lotties/success.json",
                            reverse: false, repeat: true),
                      ),
                      ),),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Have you come to teahouse ?",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins"),
                    ),
                    const SizedBox(
                      height:

                      14,
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.borderColor,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){
                              controller.yourIsNull1();
                              controller.yourIsLottie();

                            },

                            // controller.isNull1.value = true;
                            // controller.isLottie.value = true;

                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(187, 52),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              primary: AppColors.btnColor,
                            ),
                            child: const Text(
                              "No",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){
                              controller.yourIsNull1();
                              controller.yourIsLottieFalse();
                            },

                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(187, 52),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              primary: AppColors.mainColor,
                            ),
                            child: const Text(
                              "Yes",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ));
            },
            child: const Text(
              "Cancel order",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  height: 1),
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.borderColor,
          ),
          const Text("Call",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  height: 1)),
          const Divider(
            height: 1,
            color: AppColors.borderColor,
          ),
          const Text("Abaut teahouse",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  height: 1)),
        ],
      ),
    ));
  }

///dialogLottie

}