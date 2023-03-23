import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_google/location.dart';

class MapsController extends GetxController {
  LatLng? _position;
  GoogleMapController? _googleMapController;
  Set<Marker> makers = {};
  LatLng? get position => _position;

  static MapsController get to => Get.find<MapsController>();

  Future<void> getPosition() async {
    try {
      final position = await currentPosition();
      _position = LatLng(position.latitude, position.longitude);
    } catch (e) {
      Get.snackbar(
        'Erro ao acessar localização',
        e.toString(),
        backgroundColor: Colors.black54,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void onMapCreated(GoogleMapController controller) async {
    _googleMapController = controller;
  }

  void animateChageCamera(LatLng newPosition) =>
      _googleMapController?.animateCamera(CameraUpdate.newLatLng(newPosition));
}
