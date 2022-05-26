import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/navigation_button_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            child: GetBuilder<AuthController>(
              init: AuthController(),
              builder: (controller) => Container(
                padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Registration",
                      style: TextStyle(
                          color: AppColors.unSelectedTextColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Your Full Name",
                      style: TextStyle(
                          color: AppColors.unSelectedTextColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),

                    const SizedBox(height: 10),

                    /// Ful name TextField
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.activeColor,
                        borderRadius: BorderRadius.circular(12),
                        //  border: Border.all(width: 1, color: Colors.red),
                      ),
                      child: TextField(
                        controller: AuthController.fullNameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Fulname",
                          contentPadding: EdgeInsets.only(left: 8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 42),

                    const Text("Phone Number", style: TextStyle(fontSize: 13)),
                    const SizedBox(height: 10),

                    /// Phone Field
                    Container(
                      alignment: Alignment.center,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.activeColor,
                        borderRadius: BorderRadius.circular(12),
                        //  border: Border.all(width: 1, color: Colors.red),
                      ),
                      child: IntlPhoneField(
                        controller: AuthController.phoneController,
                        disableLengthCheck: false,
                        flagsButtonPadding:
                            const EdgeInsets.only(left: 8, top: 18),
                        dropdownIconPosition: IconPosition.trailing,
                        invalidNumberMessage: "",
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(top: 27),
                            border: InputBorder.none),
                        initialCountryCode: 'UZ',
                      ),
                    ),
                    const SizedBox(height: 12),

                    /// Information Text
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    "By using the application,  you accept the termsin the \n ",
                                style: TextStyle(color: AppColors.borderColor),
                              ),
                              TextSpan(
                                text: " agreements",
                                style: TextStyle(
                                    color: AppColors.unSelectedTextColor),
                              ),
                              TextSpan(
                                  text: ' and agree to receiveadvertising ',
                                  style: TextStyle(
                                    color: AppColors.borderColor,
                                  )),
                              TextSpan(
                                text: 'and information messages',
                                style: TextStyle(color: AppColors.borderColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    /// Next Button
                    const NavigationButton(text: "Next")
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