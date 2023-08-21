import 'package:exercise_db/controller.dart/exercise_controller.dart';
import 'package:get/get.dart';

class ListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(() => Exercisecontroller(), permanent: true);
  }
}
