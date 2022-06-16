import 'package:chayxana/pages/main/home/home_controller.dart';
import 'package:chayxana/views/home_search_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../views/home_bottom_view.dart';
import '../../../views/yandex_map_view/yandex_mapkit_view.dart';

class HomePage extends StatefulWidget {
  static const String id = "/home_page";
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return SafeArea(
              child: Stack(
                children: [
                  YandexMapView(
                    controller: controller,
                  ),
                  HomeBottomView(
                    controller: controller,
                  ),
                  HomeSearchBarView(
                    controller: controller,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
