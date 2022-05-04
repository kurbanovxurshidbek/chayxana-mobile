import 'package:chayxana/pages/test/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TestController>(
        init: TestController(),
        builder: (controller) {
          return Center(
            child: Text("Salom", style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: "Poppins", fontStyle: FontStyle.italic, fontWeight: FontWeight.w700),),
          );
        }
      ),
    );
  }
}
