import '../../constants/exports.dart';
import 'package:flutter/material.dart';
import 'package:exercise_era/screens/home/CoursesModel.dart';

import '../../../constants/exports.dart';
import '../../common_widgets/widgets.dart';
import '../../network/dio/HttpService.dart';
import '../../network/dio/error_handling.dart';
import '../../network/dio/interceptors.dart';

class MyCourseController extends GetxController {
  final dio = Dio();
  var selectedDrawerIndex = 0.obs;
  HttpsService? httpsService;
  GlobalKey<ScaffoldState>? scaffoldKey;
  CoursesModel? coursesModel;
  Future<CoursesModel>? futureCourseModel;

  var courseErrorMessage = "".obs;
  var isDrawerOpen = false.obs;
  var drawerItems = [
    homeStr,
    diet,
    supportStr,
    userProfileStr,
    logoutStr,
  ];

  List<Icon> iconList = [
    Icon(Icons.home),
    Icon(Icons.history),
    Icon(Icons.help),
    Icon(Icons.android),
    Icon(Icons.logout)
  ];

  List<Icon> unselectedIconList = [
    Icon(Icons.home_outlined),
    Icon(Icons.history_outlined),
    Icon(Icons.help_outline),
    Icon(Icons.android_outlined),
    Icon(Icons.logout_outlined)
  ];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();




  @override
  void onInit() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    futureCourseModel =   getMyCourses();
    super.onInit();
  }

  Future<CoursesModel> getMyCourses() async {
    try {
      final SharedPreferences prefs = await _prefs;
      dio.interceptors.add(LoggingInterceptor());
      var url = "https://account.exerciseera.com/api/course/videos/mylearning/getCourses";
      var token =await prefs!.get('token');
      var headers = {'Authorization': token};
      Response response = await dio.get(url,
          options: Options(
            headers: headers,
          ));
      if (response.statusCode == 200) {
        coursesModel = CoursesModel.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        DioException.fromDioError(e);
        courseErrorMessage.value = DioException.errorMessage!;
        courseErrorMessage.value =
            DioException.handleStatusCode(e.response!.statusCode);
        toast(message: courseErrorMessage.value);
      } else {
        toast(message: "Something went wrong");
      }
    }
    return coursesModel!;
  }

  void openDrawer() {
    scaffoldKey!.currentState!.openDrawer();
    isDrawerOpen.value = true;
    update();
  }

  void closeDrawer() {
    scaffoldKey!.currentState!.openEndDrawer();
    isDrawerOpen.value = false;
    update();
  }

  logOutApiCall()  async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove("token");
    await prefs!.setBool('isLogin',false);
    Get.offNamed(AppRoutes.SPLASHSCREEN);
  }
}