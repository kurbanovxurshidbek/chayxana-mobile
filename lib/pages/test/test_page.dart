import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Salom", style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: "Poppins", fontStyle: FontStyle.italic, fontWeight: FontWeight.w700),),
      ),
    );
  }
}
