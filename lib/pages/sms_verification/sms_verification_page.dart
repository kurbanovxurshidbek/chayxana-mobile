import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'sms_verification_controller.dart';

class SmsVerificationPage extends StatelessWidget {
  static const String id = "/sms_verification_page";
  const SmsVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SmsVerificationController>(
        init: SmsVerificationController(),

        builder: (_controller) {
          return Scaffold(
            backgroundColor: const Color(0xffEDEDED),
            body: ListView(
              children: [
                SizedBox(
                  height: Get.height / 19,
                ),
                /// First text for warning enter code to textfields
                Container(
                  margin: EdgeInsets.only(left: Get.width / 23),
                  child: const Text(
                    "Введите код из СМС",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 17.9,
                ),
                Center(
                  /// information for how to register sms code
                  child: Column(
                    children: [
                      const Text(
                        "Пожалуйста, введите 6-значный код",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      const Text(
                        "подтверждения,который мы вам отправили",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      /// picode fields
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          height: Get.height,
                          width: Get.width,
                          child: ListView(
                            children: <Widget>[
                              const SizedBox(height: 30),
                              Form(
                                key: _controller.formKey,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 30),
                                    child: PinCodeTextField(
                                      appContext: context,
                                      pastedTextStyle: TextStyle(
                                        color: Colors.green.shade600,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      length: 6,
                                      obscureText: true,
                                      obscuringCharacter: '*',
                                      blinkWhenObscuring: true,
                                      animationType: AnimationType.fade,
                                      validator: (v) {
                                        if (v!.length < 3) {
                                          return "Please full fill";
                                        } else {
                                          return null;
                                        }
                                      },
                                      pinTheme: PinTheme(
                                          shape: PinCodeFieldShape.box,
                                          borderRadius: BorderRadius.circular(10.12),
                                          fieldHeight: Get.height / 13.57,
                                          fieldWidth: Get.width / 8.26,
                                          activeFillColor: const Color(0xffF7F7F7),
                                          inactiveColor: const Color(0xffF7F7F7),
                                          inactiveFillColor: const Color(0xffF7F7F7)),
                                      cursorColor: Colors.black,
                                      animationDuration: const Duration(milliseconds: 300),
                                      enableActiveFill: true,
                                      controller: _controller.textEditingController,
                                      keyboardType: TextInputType.number,
                                      boxShadows: const [
                                        BoxShadow(
                                          offset: Offset(0, 1),
                                          color: Colors.black12,
                                          blurRadius: 10,
                                        )
                                      ],
                                      onCompleted: (v) {

                                      },
                                      onChanged: (value) {

                                      },
                                      beforeTextPaste: (text) {
                                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                        return true;
                                      },
                                    )),
                              ),
                              SizedBox(
                                height: Get.height / 12,
                              ),
                              /// timer calculator
                              Center(
                                child:
                                Text("Отправить код еще раз через ...00:${_controller.limitedTime}",style: const TextStyle(fontSize:13,color: Color(0xffC8C8C8) ),),
                              ),
                              SizedBox(
                                height: Get.height / 10,
                              ),
                              Container(
                                height: Get.height / 14.93,
                                width: Get.width / 1.07,
                                margin: EdgeInsets.only(
                                    left: Get.width / 23, right: Get.width / 23),
                                decoration: BoxDecoration(
                                  color: const Color(0xff17B700),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                /// Button for check pincode
                                child: MaterialButton(
                                  onPressed: () {
                                    _controller.calculateTime();
                                    _controller.formKey.currentState!.validate();
                                    // conditions for validating
                                    if (_controller.currentText.length != 6 ||
                                        _controller.currentText != _controller.keyOfVerifaction) {
                                      Get.snackbar("pincode", "notug'ri parol kiritildi");
                                    } else {}
                                  },
                                  child: Center(
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Подтверждать",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ])),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ); });
  }
}

