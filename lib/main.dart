import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/showallData.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'View/home_data.dart';
import 'View/home_data.dart';
import 'View/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
