import 'package:chayxana/pages/main/home/home_controller.dart';
import 'package:chayxana/views/yandex_map_view/yandex_map_contoller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:location/location.dart';

class YandexMapView extends StatelessWidget {
  HomeController controller;
  YandexMapView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyYandexMapController>(
      init: MyYandexMapController(),
      builder: (myYandexMapController) {
        return YandexMap(
          tiltGesturesEnabled: true,
          zoomGesturesEnabled: true,
          rotateGesturesEnabled: true,
          scrollGesturesEnabled: true,
          modelsEnabled: true,
          nightModeEnabled: false,
          indoorEnabled: false,
          mapObjects: myYandexMapController.mapObjects,
          // onMapTap: (Point point) {
          //   marker(
          //       latitude: point.latitude.toDouble(),
          //       longitude: point.longitude.toDouble());
          // },
          onMapCreated: (YandexMapController yandexMapController) async {
            final boundingBox = BoundingBox(
                northEast: myYandexMapController.startPlacemark.point,
                southWest: myYandexMapController.endPlacemark.point);

            await yandexMapController
                .moveCamera(CameraUpdate.newBounds(boundingBox));
            await yandexMapController.moveCamera(CameraUpdate.zoomOut());
            // myYandexMapController.add(PlacemarkMapObject(
            //     mapId: placemarkId,
            //     point: Point(latitude: 41.326636, longitude: 69.2283122),
            //     onTap: (PlacemarkMapObject self, Point point) =>
            //         print('Tapped me at $point'),
            //     opacity: 0.7,
            //     direction: 90,
            //     isDraggable: true,
            //     onDragStart: (_) => print('Drag start'),
            //     onDrag: (_, Point point) => print('Drag at point $point'),
            //     onDragEnd: (_) => print('Drag end'),
            //     icon: PlacemarkIcon.single(PlacemarkIconStyle(
            //         image: BitmapDescriptor.fromAssetImage(
            //             'assets/icons/ic_gift.png'),
            //         rotationType: RotationType.rotate))));
            // controller.yandexMapController = yandexMapController;
            // Position position = await controller.determinePosition();

            // print(position.toString() +
            //     "++++++++++++++_________________+++++++++++++++++++++++++=");

            // final cameraPosition =
            //     await controller.yandexMapController.getCameraPosition().then(
            //   (value) async {
            //     await controller.yandexMapController.moveCamera(
            //         CameraUpdate.newCameraPosition(CameraPosition(
            //             target: Point(
            //                 latitude: position.latitude,
            //                 longitude: position.longitude),
            //             zoom: 15.0)));
          },
        );
      },
    );
  }

  // marker({latitude, longitude}) {
  //   if (mapObjects.isEmpty) {
  //     if (mapObjects.any((element) => element.mapId == placemarkId)) {
  //       return;
  //     }

  //     final PlacemarkMapObject endPlacemark = PlacemarkMapObject(
  //         mapId: MapObjectId('end_placemark'),
  //         point: Point(latitude: 41.3266298, longitude: 69.2283175),
  //         icon: PlacemarkIcon.single(PlacemarkIconStyle(
  //             image: BitmapDescriptor.fromAssetImage(
  //                 'assets/icons/ic_gift.png'))));

  //     mapObjects.add(endPlacemark);
  //   } else if (mapObjects.isNotEmpty) {
  //     if (!mapObjects.any((element) => element.mapId == placemarkId)) {
  //       return;
  //     }

  //     final placemarkUpdate = mapObjects
  //         .firstWhere((el) => el.mapId == placemarkId) as PlacemarkMapObject;
  //     mapObjects[mapObjects.indexOf(placemarkUpdate)] =
  //         placemarkUpdate.copyWith(
  //       point: Point(latitude: latitude, longitude: longitude),
  //     );
  //   }
  //   // }
  // }
}
