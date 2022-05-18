import 'package:chayxana/views/navigation_button_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'auth_controller.dart';

class AuthPage extends StatelessWidget {
  static const String id = "/auth_page";
  const AuthPage({Key? key}) : super(key: key);

              /// Doniyor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: GetBuilder(
              init: AuthController(),
              builder: (AuthController controller) =>

                  Container(
                    padding: EdgeInsets.only(top: 60, left: 15, right: 15),
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Registration",
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),

                        SizedBox(
                          height: 30,
                        ),

                        Text("Your Full Name", style: TextStyle(color: Color(0xFF000000),fontSize: 13, fontWeight: FontWeight.w400),),

                        SizedBox(
                          height: 10,
                        ),

                        /// Ful name TextField

                        Container(

                          alignment: Alignment.center,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(12),
                            //  border: Border.all(width: 1, color: Colors.red),
                          ),
                          child: TextField(
                            controller: AuthController.fullNameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Fulname",
                              contentPadding: EdgeInsets.only(left: 8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 42,
                        ),

                        Text(
                          "Phone Number",
                          style: TextStyle(fontSize: 13),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        /// Phone Field
                        Container(
                          alignment: Alignment.center,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(12),
                            //  border: Border.all(width: 1, color: Colors.red),
                          ),

                          child: IntlPhoneField(

                            controller: AuthController.phoneController,
                            disableLengthCheck: false,
                            flagsButtonPadding: EdgeInsets.only(left: 8, top: 18),
                            dropdownIconPosition: IconPosition.trailing,
                            invalidNumberMessage: "",
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 27),
                                border: InputBorder.none
                            ),
                            initialCountryCode: 'UZ',


                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),

                        /// Information Text
                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                      "By using the application,  you accept the termsin the \n ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    TextSpan(
                                      text: " agreements",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                        text: ' and agree to receiveadvertising ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        )),
                                    TextSpan(
                                      text: 'and information messages',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 18,
                        ),
                          /// Next Button
                       NavigationButton(
                         text: "Next",
                       )
                      ],
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
