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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          generalIntro()
        ],
      ),
    );
  }

  generalIntro()
  {
    return Row( children: [
      CircleAvatar(
        backgroundImage:
        NetworkImage('https://picsum.photos/id/237/200/300'),
     radius: 35, )
    ],);
  }
}
