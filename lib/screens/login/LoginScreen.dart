import 'package:exercise_era/screens/login/LoginController.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../constants/exports.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/text_field.dart';
import '../../common_widgets/widgets.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
          title: "Login",
        ),
        body: _body(),
      );
    });
  }

  _body() {
    return
      SingleChildScrollView(
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sizedBox(height: margin_50),
                  appLogo(),
                  sizedBox(height: margin_50),
                  _form(),
                  sizedBox(height: height_20),
                  _signUpText(),
                  controller.isLoadingData.value ? _loader() : Container(),
                  sizedBox(height: margin_56),
                  _loginButton(),
                  sizedBox(height: height_20),
                ],
              ),
              // _bottomView(),
            ],
          ),
      );
  }

  titleText() {
    return commonText(
        appNameStr, fontSize: font_20, fontWeight: FontWeight.bold);
  }

  _form() {
    return
      setPadding(
        leftPadding: margin_20,
        rightPadding: margin_20,
        widget: Form(
          key: controller.formKey,
          child: Column(
            children: [
              _userNameEditText(),
              sizedBox(height: height_20),
              _passwordEditText(),
            ],
          ),
        ),
      );
  }


  _userNameEditText() {
    return CommonTextField(
      controller: controller.userNameEditController,
      labelText: userNameStr,

    );
  }

  _passwordEditText() {
    return CommonTextField(
        controller: controller.passwordEditController,
        labelText: passwordStr,
        isObsure: !controller.showPasswordText.value,
        suffix: getInkWell(
            widget: controller.showPasswordText.value
                ? const Icon(Icons.visibility_off, color: visibilityButtonColor)
                : const Icon(
              Icons.visibility_outlined, color: visibilityButtonColor,),
            ontap: () {
              controller.hideShowPassword();
            })

    );
  }


  _signUpText() {
    return
      setPadding(
        rightPadding: margin_20,
        widget: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.SIGNUP);
              },
              child: commonText("Don't have account", color: primaryColor,
                  fontSize: font_14,
                  fontWeight: FontWeight.w600),
            )
        ),
      )

    ;
  }

  _loginButton() {
    return
      setPadding(
        leftPadding: margin_20,
        rightPadding: margin_20,
        widget: Row(
          children: [
            Expanded(
              child: CustomButton(
                onClick: () {
                  if (controller.userNameEditController.text.isNotEmpty &&
                      controller.passwordEditController.text.isNotEmpty &&
                      !controller.isLoadingData.value) {
                    controller.loginApi();
                  }
                  else {
                    toast(message: fillParametersStr);
                  }
                },
                buttonText: loginStr.toUpperCase(),
                //verticalPadding: margin_10,
              ),
            ),
          ],
        ),
      );
  }





  _bottomView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        commonText(
            poweredByStr, fontSize: font_12, fontWeight: FontWeight.w500),
        sizedBox(height: 10.0),
        assetImage(image: APP_LOGO, fit: BoxFit.contain, height: 20.0),
        sizedBox(height: 20.0),
      ],
    );
  }


  _loader() {
    return GetBuilder<LoginController>(
      builder: (_) {
        return setPadding(
          topPadding: margin_10,
          widget: Center(
            child: loader(),
          ),
        );
      },
    );
  }
}
