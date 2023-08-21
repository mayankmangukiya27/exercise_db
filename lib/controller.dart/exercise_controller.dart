import 'package:exercise_db/api_repo/api_repo_class.dart';
import 'package:exercise_db/constant/url.dart';
import 'package:exercise_db/models/exercises_models.dart';
import 'package:exercise_db/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Exercisecontroller extends GetxController {
  RxBool loader = false.obs;
  Rx<ExerciseModel?> exerciseModel = Rx<ExerciseModel?>(null);
  RxList<ExerciseModel> exerciseList = <ExerciseModel>[].obs;
  List<ExerciseModel> allExerciseList = <ExerciseModel>[];

  ScrollController sc = ScrollController();

  startListener() {
    sc.addListener(() async {
      if (sc.position.atEdge) {
        if (sc.position.pixels != 0) {
          if (exerciseList.length != allExerciseList.length) {
            await Future.delayed(Duration(seconds: 2));

            var templist = [...exerciseList.value];

            templist.addAll(allExerciseList.skip(templist.length).take(10));

            exerciseList.value = templist;
          }
        }
      }
    });
  }

  Future<void> getAllExercises() async {
    loader.value = true;
    var response = await ApiServices.getWithOutTokenApiCAlls(ApiConst.allExercise);

    if (response != null && response is Iterable) {
      var tempExerciseList = <ExerciseModel>[];
      for (var el in response) {
        tempExerciseList.add(ExerciseModel.fromMap(el));
      }

      allExerciseList = tempExerciseList;
      exerciseList.value = tempExerciseList.take(10).toList();
    } else {
      ToastUtils.showErrorMessage("data formate not supported");
    }
    loader.value = false;
  }

  getExerciseById(String id) async {
    loader.value = true;
    var response = await ApiServices.getWithOutTokenApiCAlls("${ApiConst.exerciseById}${id}");
    if (response != null && response is Map) {
      exerciseModel.value = ExerciseModel.fromMap(response as dynamic);
    } else {
      ToastUtils.showErrorMessage("data formate not supported");
    }
    loader.value = false;
  }
}
