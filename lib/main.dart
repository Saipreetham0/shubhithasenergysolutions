import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/dashboard.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/login/login_screen.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/signup/signup_screen.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:shubhithasenergysolutions/scr/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.black,
  //   statusBarIconBrightness: Brightness.dark,
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: KspAppTheme.lightTheme,
      darkTheme: KspAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 500),
      home: SplashScreen(),
    );
  }
}
