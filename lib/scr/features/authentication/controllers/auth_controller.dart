import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/forgot_password/forgot_password_mail/forgot_password_open_mail.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/login/login_screen.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/dashboard.dart';
import 'package:shubhithasenergysolutions/scr/features/employee/screens/employee_screen.dart';

//

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLoging = false;
  User? get user => _user.value;

  //Variables
  final FirebaseAuth auth = FirebaseAuth.instance;
  final userBucket = FirebaseFirestore.instance.collection("users");
  var verificationId = ''.obs;
  final localData = GetStorage();

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    Timer(Duration(seconds: isLoging ? 0 : 5), () {
      // Timer(const Duration(seconds: 1), () {

      if (user == null) {
        isLoging = false;
        update();
        Get.offAll(() => const LoginScreen());
      } else {
        isLoging = true;
        update();
        // Get.offAll(() => const HomePage());
        // localData.read('employeeLogin');
        if (localData.read('employeeLogin') == 'True') {
          Get.offAll(() => const employeeScreen());
        } else {
          Get.offAll(() => const HomePage());
        }
      }
    });
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password, name, phone) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => userBucket.doc(value.user!.uid).set({
                'name': name,
                'email': email,
                'phone': phone,
                'address': "",
                'role': 'user',
              }));

      await user?.updateDisplayName(name);
      _user.value != null
          ? Get.offAll(() => const HomePage())
          : Get.to(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      // final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      // return ex.message;
      return e.message;
    } catch (_) {
      // const ex = SignUpWithEmailAndPasswordFailure();
      // return ex.message;
    }
    return null;
  }

  void registerUser(email, password, name, phone) async {
    try {
      isLoging = true;
      update();

      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => userBucket.doc(value.user!.uid).set({
                'name': name,
                'email': email,
                'phone': phone,
                'address': "",
                'role': 'user',
              }));

      await user?.updateDisplayName(name);
      // await user?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");

      getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
    } on FirebaseAuthException catch (e) {
      //define error
      if (e.code == 'weak-password') {
        // print("Password Provided is too Weak");
        getErrorSnackBar("Password Provided is too Weak", "");
      } else if (e.code == 'email-already-in-use') {
        // print("Account Already exists");
        getErrorSnackBar("Account Already exists", "");
      }
    }
  }

  void login(email, password) async {
    try {
      isLoging = true;
      update();
      await auth.signInWithEmailAndPassword(email: email, password: password);

      getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
    } on FirebaseAuthException catch (e) {
      //define error
      getErrorSnackBar("Login Failed", e);
    }
  }

  void googleLogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    isLoging = true;
    update();
    try {
      googleSignIn.disconnect();
    } catch (e) {}
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication? googleAuth =
            await googleSignInAccount.authentication;
        final crendentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await auth.signInWithCredential(crendentials)
            // .then((value) =>

            //     userBucket.doc(value.user!.uid).set({
            //       'name': value.user!.displayName,
            //       'email': value.user!.email,
            //       'phone': "",
            //       'address': "",
            //       'role': 'user',
            //     }))
            ;

        getSuccessSnackBar("Successfully logged in as ${_user.value!.email}");
      }
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar("Google Login Failed", e);
    } on PlatformException catch (e) {
      getErrorSnackBar("Google Login Failed", e);
    }
  }

  void forgorPassword(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      getSuccessSnackBar("Reset mail sent successfully. Check mail!");
      Get.to(() => const openMailScreen());
    } on FirebaseAuthException catch (e) {
      getErrorSnackBar("Error", e);
    }
  }

  getErrorSnackBar(String message, _) {
    Get.snackbar(
      "Error",
      "$message\n${_.message}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  getErrorSnackBarNew(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  getSuccessSnackBar(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
    );
  }

  void signOut() async {
    await auth.signOut();
    localData.remove('employeeLogin');

    // Get.offAll(() => const LoginScreen());
  }
}



// ksp sas ssh rv