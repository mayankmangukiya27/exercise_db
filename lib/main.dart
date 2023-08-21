import 'package:exercise_db/constant/bindings/all-exer_binfding.dart';
import 'package:exercise_db/constant/colorStyle.dart';
import 'package:exercise_db/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Exercises',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: ColorConst.highlightColor)),
      initialRoute: '/',
      initialBinding: ListBindings(),
      getPages: Routes.routes,
    );
  }
}
