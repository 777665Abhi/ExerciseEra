import 'package:exercise_era/common_widgets/text_field.dart';
import 'package:exercise_era/screens/login/LoginController.dart';
import 'package:exercise_era/screens/signUp/SignUpController.dart';
import 'package:flutter/material.dart';

import '../../../constants/exports.dart';
import '../../common_widgets/custom_button.dart';
import '../../common_widgets/widgets.dart';

class SignUpScreen extends GetView<SignUpController> {
  // var _site ;
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
          title: "Sign up",
        ),
        body: _body(),
      );
    });
  }

  _body() {
    return SingleChildScrollView(
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

            ColoredBox(
              color: Colors.green,
              child: Material(
                child: CheckboxListTile(
                  title: const Text('Own Fitness center'),
                  value: controller.checkboxValue,
                  onChanged: (bool? value) {
                    controller.checkboxValue = value!;
                    controller.update();
                  },
                ),
              ),
            ),
            sizedBox(height: margin_10),
            _form(),
            sizedBox(height: height_20),
            controller.isLoadingData.value ? _loader() : Container(),
            sizedBox(height: margin_56),
            _loginButton(),
            sizedBox(height: height_20),
          ],
        ),
        // _bottomView(),
      ],
    ));
  }

  _form() {
    return setPadding(
      leftPadding: margin_20,
      rightPadding: margin_20,
      widget: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Visibility(
              visible: controller.checkboxValue,
              child: _centerNameEditText(),
            ),
            sizedBox(height: height_10),
            _emailEditText(),
            sizedBox(height: height_10),
            _phoneEditText(),
            sizedBox(height: height_10),
            _firstNameEditText(),
            sizedBox(height: height_10),
            _secondNameEditText(),
            sizedBox(height: height_10),
            _passwordEditText(),
          ],
        ),
      ),
    );
  }

  _centerNameEditText() {
    return CommonTextField(
      controller: controller.centerEditController,
      labelText: centerName,
    );
  }

  _emailEditText() {
    return CommonTextField(
      controller: controller.emailEditController,
      labelText: emailStr,
    );
  }

  _phoneEditText() {
    return CommonTextField(
      controller: controller.phoneEditController,
      labelText: phoneStr,
    );
  }

  _firstNameEditText() {
    return CommonTextField(
      controller: controller.userFirstNameEditController,
      labelText: firstNameStr,
    );
  }

  _secondNameEditText() {
    return CommonTextField(
      controller: controller.userSecondNameEditController,
      labelText: secondNameStr,
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
                    Icons.visibility_outlined,
                    color: visibilityButtonColor,
                  ),
            ontap: () {
              controller.hideShowPassword();
            }));
  }

  _loginButton() {
    return setPadding(
      leftPadding: margin_20,
      rightPadding: margin_20,
      widget: Row(
        children: [
          Expanded(
            child: CustomButton(
              onClick: () {
                if (controller.emailEditController.text.isNotEmpty &&
                    controller.phoneEditController.text.isNotEmpty &&
                    controller.userFirstNameEditController.text.isNotEmpty &&
                    controller.userSecondNameEditController.text.isNotEmpty &&
                    controller.passwordEditController.text.isNotEmpty &&
                    !controller.isLoadingData.value) {
                  if (controller.checkboxValue) {
                    if (controller.centerEditController.text.isNotEmpty) {
                      controller.createUser();
                      toast(message: 'Good to go');
                    } else {
                      toast(message: fillParametersStr);
                    }
                  } else {
                    controller.createUser();
                    toast(message: 'Good to go');
                  }
                } else {
                  toast(message: fillParametersStr);
                }
              },
              buttonText: 'Sign Up'.toUpperCase(),
              //verticalPadding: margin_10,
            ),
          ),
        ],
      ),
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
