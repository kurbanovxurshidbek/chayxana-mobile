import 'package:chayxana/views/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'region_controller.dart';

class RegionPage extends StatelessWidget {
  static const String id = "/region_page";
  const RegionPage({Key? key}) : super(key: key);

            /// Doniyor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: appbar(title: "Region", leadingFunction: null, actionsFunction: null, centerTitle: false, leading: true),

      body:   GetBuilder(
      init: RegionController(),
      builder: (RegionController controller) =>

      /// Body
             ListView(
        children: [

          /// Search Container
          Container(
            width: double.infinity,
            height: 44,
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Search".trim(),
                  hintStyle: TextStyle(color: Color.fromRGBO(151, 151, 151, 1)),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 20,
          ),

                /// Region List Container
                Container(
              margin: EdgeInsets.only(bottom: 94),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  color: Colors.white),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: controller.region.length,
                  itemBuilder: (context, index) {

                    index == controller.region.length - 1  ?
                      controller.dividerChecker = Container() :

                      controller.dividerChecker = Padding(
                        child: Divider(
                          height: 1,
                          color: Color.fromRGBO(179, 179, 179, 1),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      );


                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          height: 52,
                          width: double.infinity,
                          child: Text(
                            controller.region[index],
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        controller.dividerChecker
                      ],
                    );
                  }),
            ),

        ],
      ),
      ),
    );
  }
}
