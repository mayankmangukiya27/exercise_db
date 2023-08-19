import 'package:exercise_db/api_repo/api_repo_class.dart';
import 'package:exercise_db/constant/url.dart';
import 'package:exercise_db/models/exercises_models.dart';
import 'package:exercise_db/utils/toast_utils.dart';
import 'package:get/get.dart';

class Exercisecontroller extends GetxController {
  RxBool loader = false.obs;
  Rx<ExerciseModel?> exerciseModel = Rx<ExerciseModel?>(null);
  RxList<ExerciseModel> exerciseList = <ExerciseModel>[].obs;

  getAllExercises() async {
    loader.value = true;
    var response = await ApiServices.getWithOutTokenApiCAlls(ApiConst.allExercise);
    if (response != null && response is Iterable) {
      var tempExerciseList = <ExerciseModel>[];
      for (var el in response) {
        tempExerciseList.add(ExerciseModel.fromMap(el));
      }

      exerciseList.value = tempExerciseList;
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
