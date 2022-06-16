import 'package:get/get.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MyYandexMapController extends GetxController {
  late final List<MapObject> mapObjects = [
    startPlacemark,
    stopByPlacemark,
    endPlacemark
  ];
  final PlacemarkMapObject startPlacemark = PlacemarkMapObject(
    mapId: MapObjectId('start_placemark'),



    point: Point(latitude: 55.7558, longitude: 37.6173),
    icon:

    PlacemarkIcon.single(PlacemarkIconStyle(
        image: BitmapDescriptor.fromAssetImage('assets/icons/chayxana_location.png',


        ))),
  );
  final PlacemarkMapObject stopByPlacemark = PlacemarkMapObject(
    mapId: MapObjectId('stop_by_placemark'),
    point: Point(latitude: 55.755173, longitude: 37.619097),
    icon: PlacemarkIcon.single(PlacemarkIconStyle(
        image: BitmapDescriptor.fromAssetImage('assets/icons/chayxana_location.png'))),
  );
  final PlacemarkMapObject endPlacemark = PlacemarkMapObject(
      mapId: MapObjectId('end_placemark'),
      point: Point(latitude: 55.7558, longitude: 37.62),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage('assets/icons/chayxana_location.png'))));

  add(MapObject obj) {
    mapObjects.add(obj);
    print(mapObjects.toString() + "0000000000000000000");
    update();
  }
}
