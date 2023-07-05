import 'package:exercise_era/screens/VideoPlayer.dart';
import 'package:exercise_era/screens/courseScreen/CourseDetailBinding.dart';
import 'package:exercise_era/screens/courseScreen/CourseDetailScreen.dart';
import 'package:exercise_era/screens/home/HomeBinding.dart';
import 'package:exercise_era/screens/home/HomeScreen.dart';
import 'package:exercise_era/screens/login/LoginBinding.dart';
import 'package:exercise_era/screens/login/LoginScreen.dart';
import 'package:exercise_era/screens/myCourse/MyCourseBinding.dart';
import 'package:exercise_era/screens/myCourse/MyCourseScreen.dart';
import 'package:exercise_era/screens/profile/ProfileBinding.dart';
import 'package:exercise_era/screens/profile/ProfileScreen.dart';
import 'package:exercise_era/screens/signUp/SignUpBinding.dart';
import 'package:exercise_era/screens/signUp/SignUpScreen.dart';
import 'package:exercise_era/screens/splash/SplashBinding.dart';
import 'package:exercise_era/screens/splash/SplashScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'AppRoutes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.SPLASHSCREEN;
  static const HOME = AppRoutes.HOME;

  static final routes = [
    GetPage(
      name: Paths.MYCOURSE,
      page: () => const MyCourseScreen(),
      binding: MyCourseBinding(),
    ),
    GetPage(
      name: Paths.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Paths.VIDEOPLAYER,
      page: () => const VideoPlayer(),
    ),
    GetPage(
      name: Paths.SPLASHSCREEN,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Paths.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.COURSEDETAIl,
      page: () => const CourseDetailScreen(),
      binding: CourseDetailBinding(),
    ),
    GetPage(
      name: Paths.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Paths.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Paths.SIGNUP,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    )
  ];
}
