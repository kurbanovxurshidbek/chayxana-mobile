import 'package:chayxana/services/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({Key? key}) : super(key: key);
  static const id="photo_page";

  @override
  _PhotosPageState createState() => _PhotosPageState();
}

List<String> paths = [
  "https://i.pinimg.com/236x/6f/45/78/6f45782b82e33bb55715f37d774543ba.jpg",
  "https://i.pinimg.com/236x/ad/f3/82/adf38210fce3e56f5b37d2c3d847015e.jpg",
  "https://i.pinimg.com/236x/8e/6c/06/8e6c064f57f94838263d7ba9ad80f353.jpg",
  "https://i.pinimg.com/236x/46/10/bb/4610bb90e575fb520b56a6cc1a486885.jpg",
  "https://i.pinimg.com/236x/6f/45/78/6f45782b82e33bb55715f37d774543ba.jpg",
  "https://i.pinimg.com/236x/ad/f3/82/adf38210fce3e56f5b37d2c3d847015e.jpg",
  "https://i.pinimg.com/236x/8e/6c/06/8e6c064f57f94838263d7ba9ad80f353.jpg",
  "https://i.pinimg.com/236x/46/10/bb/4610bb90e575fb520b56a6cc1a486885.jpg",
  "https://i.pinimg.com/236x/6f/45/78/6f45782b82e33bb55715f37d774543ba.jpg",
  "https://i.pinimg.com/236x/ad/f3/82/adf38210fce3e56f5b37d2c3d847015e.jpg",
  "https://i.pinimg.com/236x/8e/6c/06/8e6c064f57f94838263d7ba9ad80f353.jpg",
  "https://i.pinimg.com/236x/46/10/bb/4610bb90e575fb520b56a6cc1a486885.jpg",
  "https://i.pinimg.com/236x/6f/45/78/6f45782b82e33bb55715f37d774543ba.jpg",
  "https://i.pinimg.com/236x/ad/f3/82/adf38210fce3e56f5b37d2c3d847015e.jpg",
  "https://i.pinimg.com/236x/8e/6c/06/8e6c064f57f94838263d7ba9ad80f353.jpg",
  "https://i.pinimg.com/236x/46/10/bb/4610bb90e575fb520b56a6cc1a486885.jpg",
];

class _PhotosPageState extends State<PhotosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Photos",
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 20, color: Colors.black),
        ),
        leading: ElevatedButton.icon(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
          ),
          icon: Icon(Icons.navigate_before, size: 20,color: Colors.black,),
          label: const Text(''),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        crossAxisCount: 2,
        children: List.generate(
          paths.length,
              (index) => makeItem(paths[index]),
        ),
      ),
    );
  }

  Widget makeItem(String path) {
    return Container(
      height: 166,
      width: 187,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(path),
        ),
      ),
    );
  }
}