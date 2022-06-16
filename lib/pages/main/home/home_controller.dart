import 'dart:convert';

import 'package:chayxana/models/near_chayxana.dart';
import 'package:chayxana/services/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController {
  /// #Nasibali
  late YandexMapController yandexMapController;
  TextEditingController searchTextController = TextEditingController();
  late DraggableScrollableController scrollController;
  double hight = 0;
  double splashRadius = 5;
  double borderRadius = 20;
  bool isRisen = false;
  Position? position;
  List<NearChayxana> listOfNearChayxana = [];

  @override
  void onInit() {
    super.onInit();
    scrollController = DraggableScrollableController();
    scrollController.addListener(_listening);
  }

  _listening() {
    hight = (scrollController.size <= 0.40 ? 0 : scrollController.size) * 100;
    splashRadius = 200 / (scrollController.size * 100);

    borderRadius = 700 / (scrollController.size * 100);

    if (scrollController.size >= 0.88) {
      isRisen = true;
    } else {
      isRisen = false;
    }

    update();
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    print("-----------------------------------");
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // return Future.error('Location services are disabled.');

      Location location = Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return Future.error('Location services are disabled.');
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return Future.error('Location services are disabled.');
        }
      }

      _locationData = await location.getLocation();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    position = await Geolocator.getCurrentPosition();
    print(position);

    String? asd = await NetworkService.GET(
        NetworkService.getUri(NetworkService.API_CHAYXANALAR +
            "?lon=${position!.longitude}&lat=${position!.latitude}"),
        {});

    if (asd != null) {
      List objects = jsonDecode(asd)["object"];
      listOfNearChayxana = List.generate(objects.length, (index) {
        return NearChayxana.fromJson(objects[index]);
      });
      print(listOfNearChayxana[0]);
    }
    update();

    return position!;
  }
}
