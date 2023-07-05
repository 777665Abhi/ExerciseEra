import 'package:exercise_era/screens/home/HomeController.dart';
import 'package:exercise_era/screens/splash/SplashBinding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'AppPages.dart';
import 'common_widgets/utilities.dart';
import 'constants/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  lockScreenRotations();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              initialBinding: SplashBinding(),
              smartManagement: SmartManagement.onlyBuilder,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
                textButtonTheme: TextButtonThemeData(
                    style: ButtonStyle                    (
                    )
                ),
                navigationDrawerTheme: NavigationDrawerThemeData(
                    backgroundColor: scaffoldBgColor,
                    indicatorColor: secondaryColorLight
                ),
                bottomAppBarTheme:BottomAppBarTheme(
                    color: Colors.blue
                ) ,
                primaryColorLight: secondaryColor,
                primaryColorDark: secondaryColor,
                scaffoldBackgroundColor: scaffoldBgColor,
                primaryColor: primaryColor,
                dividerColor: Colors.transparent,
                colorScheme:
                ColorScheme.fromSwatch(primarySwatch:Colors.green).copyWith(secondary: primaryColor),
              ),
              locale: const Locale('en','US'),
              initialRoute: AppPages.INITIAL,
              defaultTransition: Transition.fadeIn,
              getPages: AppPages.routes,
            );
          });
  }


}


