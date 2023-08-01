import 'package:exercise_era/screens/dietPlan/DietPlanController.dart';
import 'package:exercise_era/screens/myDietDetail/MyDietDetailController.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/widgets.dart';
import '../../constants/exports.dart';

class MyDietDetailScreen  extends GetView<MyDietDetailController> {
  const MyDietDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<MyDietDetailController>(
      builder: (_) {
        return     WillPopScope(
            child: Scaffold(
              appBar: customAppBar(
                title: "Diet Detail",
              ),
              body: _body(),
            ),
            onWillPop: ()async{
              return  Get.delete<MyDietDetailController>();
            }
        );
      },
    );
  }

  _body() {
    return FutureBuilder(
        future: controller.futureDietDetailModel,
        builder: (_, dietPlanData) {
          if (dietPlanData.connectionState == ConnectionState.done) {
            if (dietPlanData.hasData) {
              return SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //1
                          introCard(dietPlanData),
                          //2
                          dietImage(dietPlanData),
                          //3
                          learnSection(dietPlanData),
                          // //4

                          //   renderVideoSection(dietPlanData),
//    var list=videoSection.data!.dataOB.sectionVideosVOList;
                          //videoSections(dietPlanData),
                          //5
                          detailSection(dietPlanData.data)
                        ]),
                  ));
            }
            else
            return commonText("No Diet plan");
          }
          if (dietPlanData.hasError) {
            return commonText("${dietPlanData.error}");
          }
          if (dietPlanData.connectionState == ConnectionState.waiting) {
            return Center(
              child: loader(),
            );
          }
          if (dietPlanData.connectionState == ConnectionState.active) {
            return Center(
              child: loader(),
            );
          }
          return commonText("No data found");
        });
  }

  introCard(dietPlanData) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText(dietPlanData.data!.dataOB.title,
                  fontSize: font_20, fontWeight: FontWeight.bold),
              sizedBox(height: 10.0),
              commonText(dietPlanData.data!.dataOB.goal,
                  fontSize: font_16, color: Colors.grey),
              sizedBox(height: 20.0),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  commonText("Weight: ${dietPlanData.data!.dataOB.weightFrom} - ${dietPlanData.data!.dataOB.weightTo}",
                      fontSize: font_16),
                  sizedBox(height: 15.0),
                  commonText(
                      "Created by :${dietPlanData.data!.dataOB.userName} ",
                      fontSize: font_16),
                  sizedBox(height: 15.0),
                  commonText("Age range: ${dietPlanData.data!.dataOB.ageFrom} - ${dietPlanData.data!.dataOB.ageTo}",   fontSize: font_16),
                  sizedBox(height: 15.0),
                ],
              ),
            ],
          ),
        ));
  }

  dietImage(dietPlanData)
  {
    return Image.network('${dietPlanData.data!.dataOB!.thumbnailUrl!}',height:200,
      width: double.infinity,

    );
  }

  learnSection(courseData) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          sizedBox(height: 20.0),
          commonText("Achievement Points",
              fontSize: font_20, fontWeight: FontWeight.bold),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:
              courseData.data!.dataOB.achivementPoints!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(
                    Icons.add_circle,
                    color: Colors.orangeAccent,
                  ),
                  title: Text(
                      '${courseData.data!.dataOB.achivementPoints![index]}'),
                );
              })
        ]),
      ),
    );
  }

  detailSection(courseData) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      sizedBox(height: 20.0),
      commonText("Diet plan detail",
          fontSize: font_20, fontWeight: FontWeight.bold),
      sizedBox(height: 10.0),
      Text(courseData.dataOB!.description),
      sizedBox(height: 20.0),
      // if (courseData.dataOB!.courseDetail!.isFree)
      //   freeEnroll()
      // else
      //   paidEnroll(courseData),
    ]);
  }


}