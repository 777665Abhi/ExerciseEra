import 'package:flutter/material.dart';

import '../../../constants/exports.dart';
import '../../common_widgets/widgets.dart';
import 'ProfileController.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
          title: "Profile",
        ),
        body: _body(),
      );
    });
  }

  _body() {
    return FutureBuilder(
        future: controller.futureProfileModel,
        builder: (_, profileData) {
          if (profileData.connectionState == ConnectionState.done) {
            if (profileData.hasData) {
              return SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          generalIntro(profileData!.data),
                        ]),
                  ));
            }
          }
          if (profileData.hasError) {
            return commonText("${profileData.error}");
          }
          if (profileData.connectionState == ConnectionState.waiting) {
            return Center(
              child: loader(),
            );
          }
          if (profileData.connectionState == ConnectionState.active) {
            return Center(
              child: loader(),
            );
          }
          return commonText("No data found");
        });
  }

  generalIntro(profileData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(profileData.data[0]!.profileImage),
          radius: 55,
        ),
        sizedBox(height: 18.0),
        TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.greenAccent),
              ),
              labelText: 'First Name',
            ),
            focusNode: FocusNode(),
            readOnly: true,
            controller: controller.firstNameController),
        sizedBox(height: 10.0),
        TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.greenAccent),
              ),
              labelText: 'Last Name',
            ),
            focusNode: FocusNode(),
            readOnly: true,
            controller: controller.lastNameController),

        sizedBox(height: 10.0),
        TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.greenAccent),
              ),
              labelText: 'Mobile',
            ),
            focusNode: FocusNode(),
            readOnly: true,
            controller: controller.mobileController),

        sizedBox(height: 10.0),
        TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.greenAccent),
              ),
              labelText: 'Email',
            ),
            focusNode: FocusNode(),
            readOnly: true,
            controller: controller.emailController),

        sizedBox(height: 10.0),
        TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.greenAccent),
              ),
              labelText: 'Account number',
            ),
            focusNode: FocusNode(),
            readOnly: true,
            controller: controller.accController),
      ],
    );
  }
}
