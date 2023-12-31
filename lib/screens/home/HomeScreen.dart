import 'dart:io';

import 'package:exercise_era/screens/home/DietModel.dart';
import 'package:exercise_era/screens/home/HomeController.dart';
import 'package:flutter/material.dart';

import '../../../constants/exports.dart';
import '../../common_widgets/widgets.dart';
import 'CoursesModel.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
            backgroundColor: Colors.white,
            key: controller.scaffoldKey,
            onDrawerChanged: (isOpen) {
              if (isOpen == false) {
                controller.closeDrawer();
              }
            },
            drawerScrimColor: Colors.transparent,
            drawer: _drawer(context),
            appBar: homeAppBar(
                context: context,
                title: homeStr,
                leading: getInkWell(
                    ontap: () {
                      controller.openDrawer();
                    },
                    widget: controller.isDrawerOpen.value
                        ? Platform.isAndroid
                        ? const Icon(
                      Icons.arrow_back,
                      color: appBarTitleTextLabelColor,
                    )
                        : const Icon(
                      Icons.arrow_back_ios,
                      color: appBarTitleTextLabelColor,
                    )
                        : const Icon(
                      Icons.menu,
                      color: appBarTitleTextLabelColor,
                    ))),
            body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    (controller.loginCondition) ? _logout() : _login(),
                    _spinner(),
                    (controller.dropdownValue == "Courses")
                        ? _courseBody()
                        : _dietBody()
                  ],
                )));
      },
    );
  }

  _login() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
          alignment: Alignment.topRight,
          child: getInkWell(
            widget: commonText("Login",
                style:
                TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)

              // textHeight: FontWeight.bold
            ),
            ontap: () {
              Get.toNamed(AppRoutes.LOGIN);
            },
          )),
    );
  }

  _logout() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
          alignment: Alignment.topRight,
          child: getInkWell(
            widget: commonText("Logout",
                style:
                TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            ontap: () {
              controller.logOutApiCall();
            },
          )),
    );
  }

  _spinner() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 10),
        child:
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: Colors.orange, style: BorderStyle.solid, width: 1),
            ),
            child: DropdownButton<String>(
              value: controller.dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              style: const TextStyle(color: Colors.orange),
              isExpanded: true,
              onChanged: (String? value) {
                if (value=="Courses") {
                  controller.courseApiCall();
                }
                else {
                  controller.dietPlansApiCall();
                }
                controller.dropdownValue = value!;
                controller.update();
              },
              items: controller.dropdownList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),)
    );
  }

  _courseBody() {
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

  _dietBody() {
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

                  Container(
                    width: 250,
                    child: Text(courseData.subTitle,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black)),
                  ),
                  sizedBox(height: 8.0),
                  Text(courseData.userName,
                      style: TextStyle(color: Colors.grey)),
                  sizedBox(height: 4.0),
                  RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: courseData.avgRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) =>
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Text("₹ ${courseData.price ?? "Free"}",
                      style: TextStyle(fontWeight: FontWeight.bold)),

                  // commonText(courseData.price )
                ],
              ),
            )
          ],
        ),
      ),
      ontap: () {
        Get.toNamed(AppRoutes.COURSEDETAIL, arguments: [
          {"courseId": '${courseData.id}'}
        ]);
      },
    );
  }

  _dietItem(DietData dietData) {
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

                  Container(
                    width: 250,
                    child: Text(dietData!.goal!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black)),
                  ),
                  sizedBox(height: 8.0),
                  Text(dietData!.userName!,
                      style: TextStyle(color: Colors.grey)),
                  sizedBox(height: 4.0),
                  RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: dietData!.avgRating!,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) =>
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
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
        Get.toNamed(AppRoutes.DIETDETAIL, arguments: [
          {"dietId": '${dietData.id}'}
        ]);
      },
    );
  }

  _drawer(context) {
    return GetBuilder<HomeController>(
      id: "drawer",
      builder: (_) {
        return NavigationDrawer(
            onDestinationSelected: controller.clickOnDrawerItem,
            selectedIndex: controller.selectedDrawerIndex.value,
            children: controller.loginCondition ? login() : nonLogin()
          // <Widget>[
          //   setPadding(
          //     leftPadding: margin_28,
          //     topPadding: margin_16,
          //     rightPadding: margin_16,
          //     bottomPadding: margin_16,
          //   ),
          //   _drawerItem(0),
          //   _drawerItem(1),
          //   _drawerItem(2),
          //   divider(),
          // ],
        );
      },
    );
  }

  List<Widget> nonLogin() {
    return <Widget>[
      setPadding(
        leftPadding: margin_28,
        topPadding: margin_16,
        rightPadding: margin_16,
        bottomPadding: margin_16,
      ),
      _drawerItem(0),
      _drawerItem(1),
      _drawerItem(2),
      divider(),
    ];
  }

  List<Widget> login() {
    return <Widget>[
      setPadding(
        leftPadding: margin_28,
        topPadding: margin_16,
        rightPadding: margin_16,
        bottomPadding: margin_16,
      ),
      _drawerItem(0),
      _drawerItem(1),
      _drawerItem(2),
      _drawerItem(3),
      _drawerItem(4),
      _drawerItem(5),
    ];
  }

  _drawerItem(index) {
    return NavigationDrawerDestination(
        icon: controller.selectedDrawerIndex.value == index
            ? controller.iconList[index]
            : controller.unselectedIconList[index],
        label: commonText(controller.drawerItems[index],
            fontSize: font_14,
            color: floatingTextColor,
            fontWeight: FontWeight.w600));
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
