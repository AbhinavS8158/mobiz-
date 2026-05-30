import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiz/controller/getx/controller.dart';

import 'view/login/login_screen.dart';

void main() {
  Get.put(MobizController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}