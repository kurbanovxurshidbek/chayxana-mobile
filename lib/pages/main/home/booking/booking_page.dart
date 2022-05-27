import 'package:chayxana/views/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'booking_controller.dart';

class BookingPage extends StatelessWidget {
  static const String id = "/booking_page";
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE-dMMMM – kk:mm').format(now);
    return GetBuilder(
      init: BookingController(),
      builder: (BookingController controller) =>
          Scaffold(
            /// AppBar
            appBar: appbar(
                title: "My booking",
                centerTitle: true,
                leading: true,
                actions: true,
                leadingFunction: null,
                actionsFunction: null),
            /// Body
            body: ListView(
              padding:
              EdgeInsets.only(top: Get.height / 26.35, right: 15, left: 15),
              children: [

                Text(
                  "Your booking",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFA6A6A6)),
                ),
                SizedBox(height: 8,),
                Container(
                  height:  controller.send == false ?  Get.height / 1.91 : Get.height / 3.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFFFFFFF)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Get.height / 14,
                        child: ListTile(

                          /// UserName
                          leading: Text(
                            "Nassriddinov",
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          /// Phone Number
                          trailing: Text(
                            "+99899989966",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Color(0xFFB3B3B3),
                      ),

                      /// Date time
                      Container(
                          padding: EdgeInsets.only(left: 15),

                          height: Get.height / 11.63,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "date Time",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFFA6A6A6)),
                              ),
                              Text(
                                formattedDate,
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF000000)),
                              ),
                            ],
                          )
                      ),

                      Divider(
                        height: 1,
                        color: Color(0xFFB3B3B3),
                      ),

                      Container(
                          padding: EdgeInsets.only(
                            left: 15,
                          ),
                          alignment: Alignment.bottomLeft,
                          height: Get.height / 11.63,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Number of people",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFFA6A6A6)),
                              ),
                              Text(
                                formattedDate,
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF000000)),
                              ),
                            ],
                          )
                      ),

                      controller.send ?   SizedBox.shrink()
                          : Divider(
                        height: 1,
                        color: Color(0xFFB3B3B3),
                      ) ,

                      controller.send ?
                      Container():
                      TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Send a message to the teahouse",
                          hintStyle: TextStyle(
                              fontSize: 14, color: Color(0xFFA6A6A6)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 15, top: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                controller.send
                    ? Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                          "The secret code will be sent to your \n  phone within a couple of minutes"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.only(left: 10),
                      height: 50,
                      width: 150,
                      child: TextField(
                        autofocus: true,
                        maxLength: 5,
                        cursorColor: Color(0xFF000000),
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF000000),
                            letterSpacing: 10),
                        decoration: InputDecoration(
                          hintText: "Enter sms code",
                          hintStyle:
                          TextStyle(fontSize: 18, letterSpacing: 0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                )
                    : SizedBox.shrink(),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    controller.send ;
                    controller.update();
                  },
                  child: controller.send
                      ? SizedBox.shrink()
                      : Container(
                    alignment: Alignment.center,
                    height: Get.height / 14.9,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF17B700)),
                    child: Text(
                      "Send",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
    );
  }
}
