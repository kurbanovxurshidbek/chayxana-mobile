import 'package:chayxana/views/appBar_widget.dart';
import 'package:chayxana/views/mainButton_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'feedback_controller.dart';

class FeedBackPage extends StatelessWidget {
  static const String id = "/feedback_page";
  const FeedBackPage({Key? key}) : super(key: key);

                 /// Doniyor

  @override
  Widget build(BuildContext context) {
    Object? isRadioSelected = false;
    return Scaffold(
          /// AppBar
        appBar: appbar(title: "Feedback", leadingFunction: null, actionsFunction: null, centerTitle: false, leading: true, actions: true),
        body: GetBuilder(
          init: FeedbackController(),
          builder: (FeedbackController controller) =>

           ///   Body
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 12, ),
                      child: Text(
                        "Share your \napp opinion",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      )),

                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    padding: EdgeInsets.only( right: 15),
                    width: Get.width,
                    height: 260,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFFFFFFF)),
                    child: Column(
                      children: [
                        /// 1 RadioListTile
                        SizedBox(
                          height: 52,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Color(0xFF000000),
                                disabledColor: Colors.black),
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Name and Address'),
                              activeColor: Color(0xFF17B700),
                              selectedTileColor: Color(0xFF17B700),
                              value: 1,
                              groupValue: isRadioSelected,
                              onChanged: (v) {
                                isRadioSelected = v;
                                controller.changeButtonColor();
                              },
                            ),
                          ),
                        ),

                        Divider(
                          height: 1,
                          color: Color(0xFFB3B3B3),
                          indent: 10,
                        ),

                        /// 2 RadioListTile

                        SizedBox(
                          height: 52,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Color(0xFF000000),
                                disabledColor: Colors.black),
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Name and Address'),
                              activeColor: Color(0xFF17B700),
                              selectedTileColor: Color(0xFF17B700),
                              value: 2,
                              groupValue: isRadioSelected,
                              onChanged: (v) {
                                isRadioSelected = v;
                                controller.changeButtonColor();
                              },
                            ),
                          ),
                        ),

                        Divider(
                          height: 1,
                          color: Color(0xFFB3B3B3),
                          indent: 10,
                        ),

                        /// Email TextField
                        Container(
                          height: 52,
                          child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 12),
                              hintText: "The answer will be sent by mail",
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF848484)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        Divider(
                          height: 1,
                          color: Color(0xFFB3B3B3),
                          indent: 10,
                        ),

                        /// Comment TextField
                        Container(
                          height: 100,
                          width: Get.width,
                          child:  TextField(
                            maxLines: 4,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 12),
                              hintText: "Your comment",
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF848484)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  const Spacer(),

                  /// Send Button
                  MainButton(
                    color: controller.check == true
                        ? Color(0xFF17B700)
                        : Color(0xFFFFFFFF), onPressed: () {},
                    text: "Send",
                  ),

                  SizedBox(height: 20,)

                ],
              ),
        ));
  }
}
