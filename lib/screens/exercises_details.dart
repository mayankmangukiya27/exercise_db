import 'package:cached_network_image/cached_network_image.dart';
import 'package:exercise_db/constant/colorStyle.dart';
import 'package:exercise_db/constant/textStyale.dart';
import 'package:exercise_db/controller.dart/exercise_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class ExercisesDetailsScreen extends StatefulWidget {
  const ExercisesDetailsScreen({super.key});

  @override
  State<ExercisesDetailsScreen> createState() => _ExercisesDetailsScreenState();
}

class _ExercisesDetailsScreenState extends State<ExercisesDetailsScreen> {
  final con = Get.find<Exercisecontroller>();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      con.getExerciseById(Get.arguments["exercisesId"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Obx(
            () => Stack(
              children: [
                if (con.loader.value)
                  Center(child: CircularProgressIndicator())
                else
                  SingleChildScrollView(
                    child: Stack(
                      clipBehavior: Clip.hardEdge,
                      children: [
                        SizedBox(
                          height: 400,
                          child: CachedNetworkImage(
                            imageUrl: con.exerciseModel.value?.gifUrl ?? "",
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => Icon(Icons.image_outlined),
                          ),
                        ),
                        SizedBox(
                          width: Get.width,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                                color: ColorConst.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                    offset: const Offset(0, -5),
                                    color: ColorConst.grey.withOpacity(.3),
                                  ),
                                ]),
                            margin: const EdgeInsets.only(top: 350),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 60),
                                  Text(
                                    "${con.exerciseModel.value?.name}".toUpperCase(),
                                    style: TextConst.style18500.copyWith(fontSize: 30),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 10,
                                      ),
                                      const SizedBox(width: 10),
                                      Text.rich(
                                        TextSpan(
                                          text: "Body Part : ",
                                          children: [
                                            TextSpan(text: con.exerciseModel.value?.bodyPart ?? "", style: TextConst.subTitle),
                                          ],
                                        ),
                                        style: TextConst.subTitle.copyWith(color: ColorConst.greyDark),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 10,
                                      ),
                                      const SizedBox(width: 10),
                                      Text.rich(
                                        TextSpan(
                                          text: "Equipment : ",
                                          children: [
                                            TextSpan(text: con.exerciseModel.value?.equipment ?? "", style: TextConst.subTitle),
                                          ],
                                        ),
                                        style: TextConst.subTitle.copyWith(color: ColorConst.greyDark),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        size: 10,
                                      ),
                                      const SizedBox(width: 10),
                                      Text.rich(
                                        TextSpan(
                                          text: "Target : ",
                                          children: [
                                            TextSpan(text: con.exerciseModel.value?.target ?? "", style: TextConst.subTitle),
                                          ],
                                        ),
                                        style: TextConst.subTitle.copyWith(color: ColorConst.greyDark),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Description",
                                    style: TextConst.style18500.copyWith(fontSize: 18),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "${con.exerciseModel.value?.name ?? ""} is good for Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                    style: TextConst.subTitle.copyWith(height: 1.5),
                                  ),
                                  const SizedBox(height: 100),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 320,
                            right: 0,
                            left: 0,
                            child: Center(
                              child: Container(
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorConst.highlightColor,
                                ),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: ColorConst.greyDark,
                                  size: 40,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                Positioned(
                    top: 15,
                    left: 10,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConst.highlightColor.withOpacity(.3),
                          ),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: ColorConst.greyDark,
                            size: 22,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: ColorConst.highlightColor,
            foregroundColor: ColorConst.greyDark,
            onPressed: () {},
            label: Row(
              children: [const Text("Let's get started"), SizedBox(width: 10), Icon(Icons.play_arrow_rounded)],
            )));
  }
}
