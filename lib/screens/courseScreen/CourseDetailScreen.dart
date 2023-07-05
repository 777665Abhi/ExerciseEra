import 'package:exercise_era/screens/courseScreen/CourseDetailController.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/exports.dart';
import '../../common_widgets/widgets.dart';

class CourseDetailScreen extends GetView<CourseDetailController> {
  const  CourseDetailScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseDetailController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
          title: "Course detail",
        ),
        body:
       _body()
      );
    });
  }



  _body() {
    return FutureBuilder(
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
                      //1
                      introCard(courseData),
                      //2
                      player(),
                      //3
                      learnSection(courseData),
                      // //4

                      renderVideoSection(courseData),
//    var list=videoSection.data!.dataOB.sectionVideosVOList;
                      //videoSections(courseData),
                      //5
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
        });
  }



  introCard(courseData) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonText(courseData.data!.dataOB.courseDetail.title,
              fontSize: font_20, fontWeight: FontWeight.bold),
          sizedBox(height: 10.0),
          commonText(courseData.data!.dataOB.courseDetail.subTitle, fontSize: font_16,color: Colors.grey),
          sizedBox(height: 10.0),
          Row(
            children: [
              Icon(Icons.all_inbox,color: Colors.orange),
              commonText(courseData.data!.dataOB.courseDetail.levelString,
                  fontSize: font_16),
              sizedBox(width: 10.0),
              Icon(Icons.all_inbox,color: Colors.orange),
              commonText("${courseData.data!.dataOB.courseDetail.sectionCount} Section",
                  fontSize: font_16),
              sizedBox(width: 10.0),
              Icon(Icons.language,color: Colors.orange),
              commonText("Hindi", fontSize: font_16),
              sizedBox(width: 10.0),
            ],
          ),
        ],

      ),
    ));
  }

  player()
  {
    return Container(
      height: 300,
      child: controller.chewieController != null &&
          controller.chewieController!
              .videoPlayerController.value.isInitialized
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

  learnSection(courseData) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          sizedBox(height: 20.0),

          commonText("What you'll learn",
              fontSize: font_20, fontWeight: FontWeight.bold),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: courseData.data!.dataOB.courseDetail.learningPoints!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.add_circle,color: Colors.orangeAccent,),
                  title: Text(
                      '${courseData.data!.dataOB.courseDetail.learningPoints![index]}'),
                );
              })
        ]),
      ),
    );
  }


  renderVideoSection( videoSection) {
    var list=videoSection.data!.dataOB.sectionVideosVOList;
    return
       Card(
         child:Padding(
    padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            sizedBox(height: 10.0),
            commonText("Curriculum",fontSize: font_20, fontWeight: FontWeight.bold),
            ListView.builder(
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
                      sizedBox(height: 5.0),
                      commonText(list[index].sectionName,fontSize: font_18, fontWeight: FontWeight.bold,align: TextAlign.start),
                      sectionVideoList(list[index].sectionVideos)
                    ],
                  ),
                ),
              );
            },
          ),]
        ),
      ),
    );
  }

  sectionVideoList(list)
  {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.play_circle,color: Colors.orangeAccent,),
                commonText(list[index].title,fontSize: font_14),
                // commonText(list[index].,fontSize: font_14, fontWeight: FontWeight.bold),
              ],
            ),
          ),
        );
      },
    );

  }
  detailSection(courseData)
  {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      sizedBox(height: 20.0),
      commonText("Course detail",
          fontSize: font_20, fontWeight: FontWeight.bold),
      sizedBox(height: 10.0),

      Text(courseData.data!.dataOB.courseDetail.description)]);
    // return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //     Html(
    //     data:  courseData.data!.courseData!.description)
    // ]);
  }


}
