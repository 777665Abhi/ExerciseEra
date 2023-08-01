import 'package:exercise_era/screens/VideoPlayer.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const HOME = Paths.HOME;
  static const SPLASHSCREEN = Paths.SPLASHSCREEN;
  static const COURSEDETAIL = Paths.COURSEDETAIl;
  static const LOGIN = Paths.LOGIN;
  static const SIGNUP = Paths.SIGNUP;
  static const VIDEOPLAYER = Paths.VIDEOPLAYER;
  static const PROFILE =Paths.PROFILE;
  static const MYCOURSE =Paths.MYCOURSE;
  static const MYCOURSEDETAIL =Paths.MYCOURSEDETAIL;
  static const DIETDETAIL =Paths.DIETDETAIL;
  static const MYDIET =Paths.MYDIET;
  static const MYDIETDETAIL =Paths.MYDIETDETAIL;

}

abstract class Paths {
  static const HOME = '/home';
  static const SPLASHSCREEN = '/splash';
  static const COURSEDETAIl = '/courseScreen';
  static const LOGIN = '/login';
  static const SIGNUP = '/signUp';
  static const VIDEOPLAYER= '/VideoPlayer';
  static const PROFILE = '/profile';
  static const MYCOURSE = '/myCourse';
  static const MYCOURSEDETAIL = '/myCourseDetail';
  static const DIETDETAIL = '/dietPlan';
  static const MYDIET = '/myDiet';
  static const MYDIETDETAIL = '/myDietDetail';

}
