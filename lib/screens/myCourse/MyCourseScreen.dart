import 'dart:io';

import 'package:exercise_era/screens/myCourse/MyCourseController.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/widgets.dart';
import '../../constants/exports.dart';
import '../home/CoursesModel.dart';

class MyCourseScreen extends GetView<MyCourseController> {
  const MyCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCourseController>(
      builder: (_) {
        return Scaffold(
            backgroundColor: Colors.white,
            key: controller.scaffoldKey,

            appBar: homeAppBar(
                context: context,
                title: myCourseStr,
                leading: getInkWell(
                    ontap: () {
                    Get.back();
                    },
                    widget:  Platform.isAndroid
                            ? const Icon(
                                Icons.arrow_back,
                                color: appBarTitleTextLabelColor,
                              )
                            : const Icon(
                                Icons.arrow_back_ios,
                                color: appBarTitleTextLabelColor,
                              )
                       )),


            body: SingleChildScrollView(
                child: Column(
              children: [
                _body()
              ],
            )));
      },
    );
  }

  _body() {
    return FutureBuilder(
        future: controller.futureCourseModel,
        builder: (_, data) {
          if (data.connectionState == ConnectionState.done) {
            if (data.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.coursesModel!.data!.length,
                  itemBuilder: (_, index) {
                    return _courseItem(controller.coursesModel!.data![index]);
                  });
            }
            if (data.hasError) {
              return Center(
                child: loader(),
              );
            }
          }
          if (data.connectionState == ConnectionState.waiting) {
            return Center(
              child: loader(),
            );
          } else {
            return Center(
              child: loader(),
            );
          }
        });
  }

  _courseItem(CourseList courseData) {
    return getInkWell(
      widget: Container(
        padding: EdgeInsets.all(margin_5),
        margin: EdgeInsets.all(margin_10),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: CachedNetworkImage(
                  imageUrl: courseData.thumbnailUrl,
                  height: 100,
                  width: 80,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    child: Text(courseData.title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  sizedBox(height: 8.0),
                  Text(courseData.userName,
                      style: TextStyle(color: Colors.grey)),
                  sizedBox(height: 4.0),
                ],
              ),
            )
          ],
        ),
      ),
      ontap: () {
        Get.toNamed(AppRoutes.MYCOURSEDETAIL, arguments: [
          {"courseId": '${courseData.id}'}
        ]);
      },
    );
  }

  historyItemView(scanObj) {
    return getInkWell(
        widget: Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.all(
              width: 1,
              color: Colors.grey,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            children: [commonText("Item")],
          ),
        ),
        ontap: () {
          // Get.toNamed(AppRoutes.SCANDETAIL);
        });
  }

}
