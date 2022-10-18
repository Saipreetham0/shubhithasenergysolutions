import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/login/login_screen.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/signup/signup_screen.dart';

// class AuthController extends GetxController {
//   final AuthController instance = Get.find();
//   late Rx<User?> _user;

//   final FirebaseAuth auth = FirebaseAuth.instance;

//   @override
//   void onReady() {
//     // TODO: implement onReady
//     super.onReady();
//     _user = Rx<User?>(auth.currentUser);
//     _user.bindStream(auth.authStateChanges());
//     ever(_user, loginRedirect);
//   }

//   loginRedirect(User? user) {
//     Timer(const Duration(seconds: 2), () {
//       if (User == null) {
//         Get.offAll(LoginScreen());
//       } else {
//         Get.offAll(SignUpScreen());
//       }
//     });
//   }

//   void registerUser(email, password) async {
//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } catch (e) {
//       print(e);
//       getErrorSnackBar("Account Creating Failed", e);
//     }
//   }

//   getErrorSnackBar(String message, _) {
//     Get.snackbar(
//       'Error',
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.red,
//       colorText: Colors.white,
//       borderRadius: 10,
//       margin: const EdgeInsets.all(10),
//     );
//   }
// }


