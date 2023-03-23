import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps_google/controllers/maps_controller.dart';
import 'package:maps_google/location.dart';
import 'package:maps_google/widgets/google_map_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapsController());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Usando Google Maps'),
        ),
        body: FutureBuilder(
          future: controller.getPosition(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.position == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Localização desativada',
                      style: Get.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () async {
                          try {
                            await locationPermission();
                            Get.offAll('/');
                          } catch (e) {
                            Get.snackbar(
                              'Erro ao acessar localização',
                              e.toString(),
                              backgroundColor: Colors.black54,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.TOP,
                            );
                          }
                        },
                        child: const Text('Recarregar'))
                  ],
                ),
              );
            }

            return GetBuilder<MapsController>(
              init: controller,
              builder: (controller) {
                return GoogleMapWidget(mapsController: controller);
              },
            );
          },
        ));
  }
}
