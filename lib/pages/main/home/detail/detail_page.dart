import 'package:chayxana/pages/main/home/detail/detail_controller.dart';
import 'package:chayxana/services/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../photos_page/photos_page.dart';

class DetailPage extends StatelessWidget {
  static const String id= "/detail_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DetailController>(
        init: DetailController(),
        builder: (context) {
          return ListView(
            children: [
              ///Abdulazim
              // #header
              SizedBox(
                height: 279,
                child: GridTile(
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),

                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[700],
                            ),
                            child: Image.asset(
                              AppAssets.icCancel,
                              width: 22.67,
                              height: 22.67,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                         margin: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[700],
                          ),
                          child: Image.asset("assets/images/favourite.png"),
                        ),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AppAssets.sliverAppBarImage,
                    height: 279,
                    fit: BoxFit.cover,
                  ),
                  footer: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: SizedBox(),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                const PhotosPage(),
                              );
                            },
                            child: Container(
                              width: 90,
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(AppAssets.camera),
                                  const Text(
                                    '14',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 19, left: 15),
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.icStar,
                          width: 19,
                          height: 19,
                        ),
                        const SizedBox(width: 7),
                        const Text('8.2'),
                      ],
                    ),
                  ],
                ),
              ),

              ///Jamshid Aka
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //#text Адресс
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Адресс",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  //#text Ташкент
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 10),
                    child: Text(
                      "Ташкент",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  //#text Юнусабадский район, Амир Темур
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 2),
                    child: Text(
                      "Юнусабадский район, Амир Темур",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  //#container for map
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Container(
                      height: 80,
                      width: double.infinity,
                     child: YandexMap(),
                    ),
                  ),

                  //#divider line
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 15, right: 15),
                    child: const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),

                  //#text title Описание
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 20),
                    child: Text(
                      "Описание",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  //#text Описание content
                  const Padding(
                    padding: EdgeInsets.only(top: 12.0, right: 15, left: 15),
                    child: SizedBox(
                      height: 95,
                      width: double.infinity,
                      child: Text(
                        "Ресторан в любовно отреставрированном павильоне «Шелководство» "
                        "на ВДНХ работает с мая 2016 года. В заведении два зала, летом к ним добавляются "
                        "две большие веранды; вокруг парк, а совсем неподалеку Зеленый театр.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  //#divider line
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 15, right: 15),
                    child: Divider(
                      thickness: 1,
                      color: Color(0xFFB3B3B3),
                    ),
                  ),

                  //#
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              //#text Режим работы
                              Text(
                                "Режим работы",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),

                              //#text Режим работы
                              Text(
                                "Сегодня 10:00 - 23:00",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ), //#button Подробнее
                        Container(
                          height: 58,
                          width: 165,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xffF5F5F5)),
                            onPressed: null,
                            child: const Text(
                              "Подробнее",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: const Text(
                      "Информатция",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      makeOptions(
                          "assets/images/img_tel.png", "Pozvanit", true),
                      SizedBox(width: 25),
                      makeOptions("assets/images/img.png", "Marshurt", true),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 1,
                    endIndent: 15,
                    indent: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      makeOptions("assets/images/choyxona_wifi.png", "Vayfay"),
                      SizedBox(width: 25),
                      makeOptions("assets/images/ch_i.png", "Verandi"),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      makeOptions("assets/images/ch_car.png", "Parkovka"),
                      SizedBox(width: 25),
                      makeOptions("assets/images/cho_tv.png", "Televizor"),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 160,
                  ),
                  Container(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, elevation: 0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 380,
                          decoration: BoxDecoration(
                              color: const Color(0xFF17B700),
                              borderRadius: BorderRadius.circular(12)),
                          child: const Text(
                            "Дальше",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget makeOptions(
    String path,
    String txt, [
    bool? isGreen,
  ]) {
    return Expanded(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.grey[100],
          onTap: () {},
          child: Container(
            height: 65,
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(path,
                      color: isGreen == true ? Colors.green : Colors.black),
                ),
                Expanded(
                  child: Text(txt),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
