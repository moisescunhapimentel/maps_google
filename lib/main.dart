import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:maps_google/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (_) => const HomePage(),
      },
    );
  }
}
