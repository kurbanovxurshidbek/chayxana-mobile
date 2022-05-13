import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'intro_controller.dart';

class IntroPage extends StatelessWidget {
  static const String id = "/intro_page";
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(
        init: IntroController(),
        builder: (_controller) {
          return Scaffold(
              backgroundColor: const Color(0xff40C244),
              body: Stack(children: [
                PageView(
                  controller: _controller.pageController,
                  children: [
                    page_view_form("intro_header_one".tr, "intro_content_one".tr,
                        _controller.images[0]),
                    page_view_form('intro_header_one'.tr,  "intro_content_one".tr,
                        _controller.images[1]),
                    page_view_form('intro_header_one'.tr,  "intro_content_one".tr,
                        _controller.images[2]),
                  ],
                  onPageChanged: (index) {
                    _controller.directSmooth(index);
                  },
                ),

                ///### smooth indicator and inter button
                Positioned(
                  left: Get.width / 5.078,
                  top: Get.height / 1.251,
                  bottom: Get.height / 20.36,
                  child: Column(children: [
                    Row(
                      children: [
                        smooth_indicator(_controller,0),
                        const SizedBox(
                          width: 14,
                        ),
                        smooth_indicator(_controller,1),
                        const SizedBox(
                          width: 14,
                        ),
                        smooth_indicator(_controller,2),
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 13.78,
                    ),

                    ///### inter button
                    Container(
                      child: MaterialButton(
                        onPressed: () {_controller.bottomTapped(_controller.page);},
                        child: const Center(
                          child: Text(
                            "Начать",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width / 1.6,
                      height: MediaQuery.of(context).size.height / 16,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                    )
                  ]),
                )
              ]));
        });
  }

  CircleAvatar smooth_indicator(IntroController _controller, index) {
    return CircleAvatar(
      backgroundColor: _controller.page == index
          ? Colors.black
          : Colors.white,
      radius: 7,
    );
  }

  Center page_view_form(String text1, String text2, String image) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: Get.height / 8.2,
        ),
        const Text(
          " Боле 2 00 заведений \nс акциями и бонусами",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: Get.height / 9.8,
        ),
        Image(
          image: AssetImage(image),
          width: Get.width / 1.089,
          height: Get.height / 3.143,
        ),
        SizedBox(
          height: Get.height / 8,
        ),
        Text(
          text2,
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
