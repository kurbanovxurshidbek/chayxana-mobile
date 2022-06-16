import 'package:get/get.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MyYandexMapController extends GetxController {
  final List<MapObject> mapObjects = [];

  add(MapObject obj) {
    mapObjects.add(obj);
    print(mapObjects.toString() + "0000000000000000000");
    update();
  }
}
