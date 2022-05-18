import 'package:chayxana/views/appBar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'result_controller.dart';

class ResultPage extends StatelessWidget {
  static const String id = "/result_page";
  const ResultPage({Key? key}) : super(key: key);

  /// Doniyor

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      /// AppBar
        appBar: appbar(title: "My booking", leadingFunction: null, actionsFunction: null, centerTitle: true, leading: false, actions: true),
        body: GetBuilder(
            init: ResultController(),
            builder: (ResultController controller) =>
            controller.bookingCheck == true ?

            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.check_circle_outline,
                    size: 84.0,
                    color: Color(0xFF2FCC71),
                  ),
                  SizedBox(height: 38,),
                  Text("Have you booked a seat \n    we will wait for you",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)

                ],
              ),
            ) :
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    CupertinoIcons.clear_circled,
                    size: 84.0,
                    color: Color(0xFFE74C3C),
                  ),
                  SizedBox(height: 38,),
                  Text("You have not booked a seat",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),


                ],
              ),
            )
        )
    );
  }
}
