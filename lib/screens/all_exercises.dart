import 'package:cached_network_image/cached_network_image.dart';
import 'package:exercise_db/constant/colorStyle.dart';
import 'package:exercise_db/constant/textStyale.dart';
import 'package:exercise_db/controller.dart/exercise_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllExercisesScreen extends StatefulWidget {
  const AllExercisesScreen({super.key});

  @override
  State<AllExercisesScreen> createState() => _AllExercisesScreenState();
}

class _AllExercisesScreenState extends State<AllExercisesScreen> {
  final con = Get.put(Exercisecontroller());

  @override
  void initState() {
    dataLoad();
    super.initState();
  }

  dataLoad() async {
    await con.getAllExercises();
    con.startListener();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConst.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorConst.black,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "GOOD MORNING",
                style: TextConst.style15400.copyWith(
                  color: ColorConst.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "John",
                style: TextConst.style18500.copyWith(
                  color: ColorConst.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          actions: [
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorConst.highlightColor,
                  width: 2,
                ),
              ),
              child: const Icon(Icons.person),
            ),
          ],
        ),
        body: Obx(
          () => Stack(
            children: [
              SingleChildScrollView(
                controller: con.sc,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text(
                        "Exercise List",
                        style: TextConst.heading.copyWith(color: ColorConst.highlightColor, fontSize: 30),
                      ),
                    ),
                    Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          color: ColorConst.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Obx(
                          () {
                            //  GetBuilder<Exercisecontroller>(
                            //   tag: "onExerciseListUpdate",
                            //   builder: (controller) {

                            return ListView.builder(
                              itemCount: con.exerciseList.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final data = con.exerciseList[index];
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed('/workoutDetails', arguments: {"exercisesId": data.id});
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(14),
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorConst.highlightColor,
                                              spreadRadius: .5,
                                              offset: Offset(
                                                1.5,
                                                1.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 80,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                                              child: CachedNetworkImage(
                                                imageUrl: data.gifUrl ?? "",
                                                progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                                errorWidget: (context, url, error) => Icon(Icons.image_outlined),
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data.name?.toUpperCase() ?? "",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextConst.style18500,
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text.rich(
                                                    TextSpan(
                                                      text: "Body Part : ",
                                                      children: [
                                                        TextSpan(text: "${data.bodyPart}", style: TextConst.subTitle),
                                                      ],
                                                    ),
                                                    style: TextConst.subTitle.copyWith(color: ColorConst.greyDark),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text.rich(
                                                    TextSpan(
                                                      text: "Equipment : ",
                                                      children: [
                                                        TextSpan(text: data.equipment ?? "", style: TextConst.subTitle),
                                                      ],
                                                    ),
                                                    style: TextConst.subTitle.copyWith(color: ColorConst.greyDark),
                                                  ),
                                                  const SizedBox(height: 0),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        bottom: 20,
                                        child: Icon(
                                          Icons.arrow_right_alt_rounded,
                                          size: 26,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        )),
                  ],
                ),
              ),
              if (con.loader.value)
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
