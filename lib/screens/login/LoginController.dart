import 'package:dio/dio.dart';
import 'package:exercise_era/common_widgets/widgets.dart';
import 'package:exercise_era/constants/exports.dart';
import 'package:exercise_era/screens/login/LoginModel.dart';

import '../../network/dio/error_handling.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController userNameEditController = TextEditingController();
  TextEditingController passwordEditController = TextEditingController();
  var showPasswordText = false.obs;
  var dio = Dio();
  var loginErrorMessage = "".obs;
  var cookieErrorMessage = "".obs;
  var isLoadingData = false.obs;

  LoginModel? loginModel;

  Future<LoginModel>? futureLoginModel;
  var storage;
  SharedPreferences? prefs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  hideShowPassword() {
    showPasswordText.value = !showPasswordText.value;
    update();
  }

  @override
  void onInit() {}

  loginApi() async {
    final SharedPreferences prefs = await _prefs;
    Response response;
    try {
      response = await dio
          .post("https://account.exerciseera.com/request/oauth/token", data: {
        "username": userNameEditController.text,
        "password": passwordEditController.text,
      });
      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(response.data);
        var token = loginModel!.dataOB!.accessToken;
        await prefs!.setString('token', 'Bearer $token');
        await prefs!.setBool('isLogin', true);

        toast(message: 'Successfully login');
        Get.offNamed(AppRoutes.HOME);
      }
    } catch (e) {
      if (e is DioError) {
        DioException.fromDioError(e);
        loginErrorMessage.value = DioException.errorMessage!;
        loginErrorMessage.value =
            DioException.handleStatusCode(e.response!.statusCode);
        toast(message: loginErrorMessage.value);
      } else {
        toast(message: "Something went wrong");
      }
    }
  }
}
