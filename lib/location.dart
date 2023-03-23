import 'package:geolocator/geolocator.dart';

Future<void> locationPermission() async {
  LocationPermission permission;
  bool ativado = await Geolocator.isLocationServiceEnabled();

  if (!ativado) {
    return Future.error('Por favor, habilite a localização no smartphone');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Autorize o acesso à localização nas configurações');
    }
  }
}

Future<Position> currentPosition() async {
  await locationPermission();
  return await Geolocator.getCurrentPosition();
}
