import 'package:exercise_db/constant/bindings/all-exer_binfding.dart';
import 'package:exercise_db/screens/all_exercises.dart';
import 'package:exercise_db/screens/exercises_details.dart';
import 'package:exercise_db/screens/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  // Get.toNamed('/signup-details');
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/exercises', page: () => const AllExercisesScreen(), binding: ListBindings()),
    GetPage(name: '/workoutDetails', page: () => const ExercisesDetailsScreen()),
  ];
}
