import 'package:dio/dio.dart';
import 'package:exercise_era/screens/home/CoursesModel.dart';
import 'package:flutter/material.dart';

import '../../../constants/exports.dart';
import '../../common_widgets/widgets.dart';
import '../../network/dio/HttpService.dart';
import '../../network/dio/error_handling.dart';
import '../../network/dio/interceptors.dart';
import 'DietModel.dart';

class HomeController extends GetxController {
  final dio = Dio();
  var selectedDrawerIndex = 0.obs;
  HttpsService? httpsService;
  GlobalKey<ScaffoldState>? scaffoldKey;
  CoursesModel? coursesModel;
  Future<CoursesModel>? futureCourseModel;
  DietModel? dietModel;
  Future<DietModel>? futureDietModel;
  var loginCondition=false;
  var courseErrorMessage = "".obs;
  var isDrawerOpen = false.obs;
  var dropdownValue="Courses";
  List<String> dropdownList = [
   "Courses",
    "Diet Plans"
  ];
  var drawerItems = [
    homeStr,
    diet,
    supportStr,
    myCourseStr,
    userProfileStr,
    logoutStr,
  ];

  List<Icon> iconList = [
    Icon(Icons.home),
    Icon(Icons.history),
    Icon(Icons.help),
    Icon(Icons.home),
    Icon(Icons.android),
    Icon(Icons.logout)
  ];

  List<Icon> unselectedIconList = [
    Icon(Icons.home_outlined),
    Icon(Icons.history_outlined),
    Icon(Icons.help_outline),
    Icon(Icons.home),
    Icon(Icons.android_outlined),
    Icon(Icons.logout_outlined)
  ];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    courseApi();
    dietApi();
    super.onInit();
  }

  courseApi()
  {
    futureCourseModel = courseApiCall();

  }
  dietApi()
  {
    futureDietModel = dietPlansApiCall();
  }

  appFlow() async {
    final SharedPreferences prefs = await _prefs;
    loginCondition = prefs.getBool('isLogin')!;
    if (loginCondition!) {
    } else {}
  }

  Future<CoursesModel> courseApiCall() async {
    try {
      final SharedPreferences prefs = await _prefs;
      loginCondition = prefs.getBool('isLogin')!;
      dio.interceptors.add(LoggingInterceptor());
      var url =
          "https://account.exerciseera.com/request/search/onlineCourse?name=&min=&max=&cat=&gender=&level=&language=";

      Response response = await dio.get(url);
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

  Future<DietModel> dietPlansApiCall() async {
    try {
      dio.interceptors.add(LoggingInterceptor());
      var url ="https://account.exerciseera.com/request/search/dietPlanningChart?name=&min=&max=&cat=&gender=";

      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        dietModel = DietModel.fromJson(response.data);
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
    return dietModel!;
  }

  clickOnDrawerItem(index) {
    selectedDrawerIndex.value = index;
    switch (index) {
      case 0:
        {
          Get.toNamed(AppRoutes.HOME);
        }
        break;
      case 3:
        {
          Get.toNamed(AppRoutes.MYCOURSE);
        }
        break;
      case 4:
        {
          Get.toNamed(AppRoutes.PROFILE);
        }
        break;

      case 5:
        {
          logOutApiCall();
        }
        break;
    }
    update(["drawer"]);
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

/*Api call*/
// Future<List<CourseData>> courseApiCall() async {
//   try {
//     dio.interceptors.add(LoggingInterceptor());
//     var url ="https://account.exerciseera.com/request/search/onlineCourse?name=&min=&max=&cat=&gender=&level=&language=";
//
//     Response response = await dio.get(url);
//
//     if (response.statusCode == 200) {
//        coursesModel= CoursesModel.fromJson(response.data);
//     }
//   } catch (e) {
//     if (e is DioError) {
//       DioException.fromDioError(e);
//       courseErrorMessage.value = DioException.errorMessage!;
//       courseErrorMessage.value =
//           DioException.handleStatusCode(e.response!.statusCode);
//       toast(message: courseErrorMessage.value);
//     } else {
//       toast(message: "Something went wrong");
//     }
//   }
//   return coursesModel!.data!;
// }
}
