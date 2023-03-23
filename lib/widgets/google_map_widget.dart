import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_google/controllers/maps_controller.dart';

class GoogleMapWidget extends StatelessWidget {
  final MapsController mapsController;

  const GoogleMapWidget({super.key, required this.mapsController});

  @override
  Widget build(BuildContext context) {
    debugPrint('Posição ${mapsController.position}');
    return GoogleMap(
      mapType: MapType.normal,
      zoomControlsEnabled: true,
      initialCameraPosition: CameraPosition(
        target: mapsController.position ?? const LatLng(0, 0),
        zoom: 20,
      ),
      onMapCreated: mapsController.onMapCreated,
      myLocationEnabled: true,
    );
  }
}
