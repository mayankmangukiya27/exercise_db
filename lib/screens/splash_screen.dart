import 'package:exercise_db/constant/colorStyle.dart';
import 'package:exercise_db/constant/textStyale.dart';
import 'package:exercise_db/controller.dart/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final con = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        decoration: BoxDecoration(color: ColorConst.black, borderRadius: BorderRadius.circular(40)),
        height: 200,
        width: 200,
        child: Center(
            child: Text(
          "Logo",
          style: TextConst.heading.copyWith(
            color: ColorConst.highlightColor,
            fontSize: 50,
          ),
        )),
      )),
    );
  }
}
