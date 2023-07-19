import 'package:exercise_era/screens/myCourseDetail/MyCourseDetailController.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/widgets.dart';
import '../../constants/exports.dart';

class MyCourseDetailScreen extends GetView<MyCourseDetailController> {
  const MyCourseDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCourseDetailController>(
      builder: (_) {
        return Scaffold(
          appBar: customAppBar(
            title: "Course detail",
          ),
          body: _body(),
        );
      },
    );
  }

  _body() {
    return FutureBuilder(
        future: controller.futureplayCourseModel,
        builder: (_, courseData) {
          if (courseData.connectionState == ConnectionState.done) {
            if (courseData.hasData) {
              return SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          player(),
                          //3
                          //  learnSection(courseData),
                          // //4

                          renderVideoSection(courseData),
                        ]),
                  ));
            }
          }
          if (courseData.hasError) {
            return commonText("${courseData.error}");
          }
          if (courseData.connectionState == ConnectionState.waiting) {
            return Center(
              child: loader(),
            );
          }
          if (courseData.connectionState == ConnectionState.active) {
            return Center(
              child: loader(),
            );
          }
          return commonText("No data found");
        });
  }

  player() {
    return Container(
      height: 300,
      child: controller.chewieController != null &&
              controller
                  .chewieController!.videoPlayerController.value.isInitialized
          ? Chewie(
              controller: controller.chewieController!,
            )
          : const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 200),
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Loading'),
                ],
              ),
            ),
    );
  }

  renderVideoSection(videoSection) {
    var list = videoSection.data!.data!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          sizedBox(height: 10.0),
          Row(children: [
            InkWell(
                onTap: () {
                  controller.checkCourseList = true;
                  controller.checkCourseDetail = false;
                  controller.update();
                },
                child: commonText("Curriculum",
                    fontSize: font_20, color: Colors.orangeAccent)),
            sizedBox(width: 20.0),
            InkWell(
              onTap: () {
                controller.checkCourseList = false;
                controller.checkCourseDetail = true;
                controller.update();
              },
              child:
                  commonText("Detail", fontSize: font_20, color: Colors.grey),
            )
          ]),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(height: 10),
          showOrHideCourseList(controller.checkCourseList, list),
          showOrHideCourseDetail(controller.checkCourseDetail)
        ]),
      ),
    );
  }

  showOrHideCourseList(visibility, list) {
    return Visibility(
        visible: visibility,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText(list[index].sectionName,
                        fontSize: font_16,
                        align: TextAlign.start,
                        color: Colors.grey),
                    sectionVideoList(list[index].sectionVideos)
                  ],
                ),
              ),
            );
          },
        ));
  }

  showOrHideCourseDetail(visibility) {
    return Visibility(
        visible: visibility,
        child: FutureBuilder(
            future: controller.futureCourseDetailModel,
            builder: (_, courseData) {
              if (courseData.connectionState == ConnectionState.done) {
                if (courseData.hasData) {
                  return SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              introCard(courseData),
                              learnSection(courseData),
                              detailSection(courseData)
                            ]),
                      ));
                }
              }
              if (courseData.hasError) {
                return commonText("${courseData.error}");
              }
              if (courseData.connectionState == ConnectionState.waiting) {
                return Center(
                  child: loader(),
                );
              }
              if (courseData.connectionState == ConnectionState.active) {
                return Center(
                  child: loader(),
                );
              }
              return commonText("No data found");
            }));
  }

  sectionVideoList(list) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flexible(
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      controller.getVideoUrl(list[index].id);
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.play_circle,
                              color: Colors.orangeAccent,
                            ),
                            Expanded(
                              child: Text(list[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: new TextStyle(
                                    fontSize: font_14,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ),
        );
      },
    );
  }

  introCard(courseData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(courseData.data!.dataOB.title,
            fontSize: font_20, fontWeight: FontWeight.bold),
        sizedBox(height: 10.0),
        Text("${courseData.data!.dataOB.subTitle}"),
        // commonText(courseData.data!.dataOB.subTitle,
        //     fontSize: font_16, color: Colors.grey),
        sizedBox(height: 10.0),
        Row(
          children: [
            Icon(Icons.all_inbox, color: Colors.orange),
            commonText(courseData.data!.dataOB.levelString, fontSize: font_16),
            sizedBox(width: 10.0),
            Icon(Icons.all_inbox, color: Colors.orange),
            commonText("${courseData.data!.dataOB.sectionCount} Section",
                fontSize: font_16),
            sizedBox(width: 10.0),
            Icon(Icons.language, color: Colors.orange),
            commonText("Hindi", fontSize: font_16),
            sizedBox(width: 10.0),
          ],
        ),
      ],
    );
  }

  learnSection(courseData) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      sizedBox(height: 30.0),
      commonText("What you'll learn",
          fontSize: font_20, fontWeight: FontWeight.bold),
      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: courseData.data!.dataOB.learningPoints!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(
                Icons.add_circle,
                color: Colors.orangeAccent,
              ),
              title: Text('${courseData.data!.dataOB.learningPoints![index]}'),
            );
          })
    ]);
  }

  detailSection(courseData) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      sizedBox(height: 20.0),
      commonText("Course detail",
          fontSize: font_20, fontWeight: FontWeight.bold),
      sizedBox(height: 10.0),
      Text(courseData.data!.dataOB.description)
    ]);
    // return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //     Html(
    //     data:  courseData.data!.courseData!.description)
    // ]);
  }
}
