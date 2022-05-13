import 'package:cached_network_image/cached_network_image.dart';
import 'package:chayxana/pages/main/home/detail/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  static const String id = "/detail_page";
  const DetailPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        init: DetailController(),
        builder: (_controller) {
          return Scaffold(
              backgroundColor: const Color(0xffFFFFFF),
              body: SingleChildScrollView(
                  controller: _controller.scrollController,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///### Main image of detail Page and animation
                        Stack(
                          children: [
                            AnimatedContainer(
                                margin: EdgeInsets.only(
                                    left: _controller.marginOfContainer1,
                                    top: _controller.marginOfContainer2),
                                height: _controller.hight,
                                width: _controller.widthofContainer,
                                duration: const Duration(milliseconds: 100),

                                ///### Image Url
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      _controller.border.toDouble()),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                    "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                                colorFilter: const ColorFilter.mode(
                                                    Colors.red,
                                                    BlendMode.colorBurn)),
                                          ),
                                        ),
                                    placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                )),
                            Positioned(
                              child: _controller.needStack
                                  ? Container(
                                padding: const EdgeInsets.only(
                                    top: 30, right: 15, bottom: 15),
                                height: Get.height / 3.21,
                                width: Get.width,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.clear,
                                                color: Colors.white,
                                                size: 40,
                                              ),
                                              onPressed: () {},
                                            )),
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundColor:
                                          const Color(0x7400ccff),
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: const ImageIcon(
                                              AssetImage(
                                                  "assets/icons/img.png"),
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(),
                                        Container(
                                          height: Get.height / 22.4,
                                          width: Get.width / 5,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white,
                                                width: 1),
                                            borderRadius:
                                            BorderRadius.circular(18),
                                          ),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: const ImageIcon(
                                                  AssetImage(
                                                    "assets/icons/img_1.png",
                                                  ),
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const Text(
                                                "14",
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                                  : const SizedBox(),
                            )
                          ],
                        ),


                        Column(children: [

                          ///###chayxana name and rate
                          Container(
                              width: Get.width,
                              decoration: const BoxDecoration(
                                color: Color(0xffF5F5F5),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "chayxanaName",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: Get.height / 22.4,
                                      width: Get.width / 5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            "8.2",
                                            style: TextStyle(
                                                fontSize: 19,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    )
                                  ])),

                          ///### desciription
                          Container(
                              padding:
                              const EdgeInsets.only(top: 15, left: 15, right: 15),
                              width: Get.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Адрес",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    "Ташкент",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Юнусабадский район, Амир Темур",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: Get.height / 11.2,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    "Описание",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    "Ресторан в любовно отреставрированном павильоне «Шелководство» на ВДНХ работает с мая 2016 года. В заведении два зала, летом к ним добавляются две большие веранды; вокруг парк, а совсем неподалеку Зеленый театр.",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Режим работы",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Сегодня 10:00 - 23:00",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: Get.height / 15.44,
                                        width: Get.width / 2.5,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF5F5F5),
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Подробнее',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    "Информатция",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      buttonOfservices("assets/icons/img_3.png",
                                          "Позванить"),
                                      buttonOfservices(
                                          "assets/icons/img_4.png", "Маршрут"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  ///### Buttons of servise
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          buttonOfservices(
                                              "assets/icons/img_5.png",
                                              "Позванить"),
                                          buttonOfservices(
                                              "assets/icons/img_6.png",
                                              "Маршрут"),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          buttonOfservices(
                                              "assets/icons/img_7.png",
                                              "Позванить"),
                                          buttonOfservices(
                                              "assets/icons/img_8.png",
                                              "Маршрут"),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ))
                        ])
                      ])));
        });
  }

  Container buttonOfservices(String imageIcon, String textOfIcon) {
    return Container(
      height: Get.height / 17.9,
      width: Get.width / 2.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffF5F5F5),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          children: [
            ImageIcon(AssetImage(
              imageIcon,
            )),
            SizedBox(
              width: Get.width / 20,
            ),
            Text(
              textOfIcon,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
