import 'package:flutter/material.dart';

import '../../common_widgets/widgets.dart';
import '../../constants/exports.dart';
import '../home/DietModel.dart';
import 'MyDietController.dart';
import 'MyDietModel.dart';

class MyDietScreen extends GetView<MyDietController>
{
  const MyDietScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDietController>(
      builder: (_) {
        return Scaffold(
          appBar: customAppBar(
            title: "My Diets",
          ),
          body: _body(),
        );
      },
    );
  }

  _body() {
    return FutureBuilder(
        future: controller.futureDietModel,
        builder: (_, data) {
          if (data.connectionState == ConnectionState.done) {
            if (data.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.dietModel!.data!.length,
                  itemBuilder: (_, index) {
                    return _dietItem(controller.dietModel!.data![index]);
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
  _dietItem( dietData) {
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
                  imageUrl: dietData!.thumbnailUrl!,
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
                    child: Text(dietData!.title!,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),

                  // Container(
                  //   width: 250,
                  //   child: Text(dietData!.goal!,
                  //       softWrap: true,
                  //       overflow: TextOverflow.ellipsis,
                  //       style: TextStyle(color: Colors.black)),
                  // ),
                  sizedBox(height: 8.0),
                  Text(dietData!.userName!,
                      style: TextStyle(color: Colors.grey)),
                  sizedBox(height: 4.0),
                  // RatingBar.builder(
                  //   ignoreGestures: true,
                  //   initialRating: dietData!.avgRating!,
                  //   minRating: 1,
                  //   direction: Axis.horizontal,
                  //   allowHalfRating: true,
                  //   itemCount: 5,
                  //   itemSize: 20.0,
                  //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  //   itemBuilder: (context, _) =>
                  //       Icon(
                  //         Icons.star,
                  //         color: Colors.amber,
                  //       ),
                  //   onRatingUpdate: (rating) {
                  //     print(rating);
                  //   },
                  // ),
                  Text("₹ ${dietData.price ?? "Free"}",
                      style: TextStyle(fontWeight: FontWeight.bold)),

                  // commonText(courseData.price )
                ],
              ),
            )
          ],
        ),
      ),
      ontap: () {
        Get.toNamed(AppRoutes.MYDIETDETAIL, arguments: [
          {"dietId": '${dietData.id}'}
        ]);
        toast(message: "Click ${dietData.id}");
      },
    );
  }


}
