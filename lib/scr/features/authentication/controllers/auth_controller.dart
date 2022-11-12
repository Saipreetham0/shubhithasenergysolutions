import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/forgot_password/forgot_password_mail/forgot_password_open_mail.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/login/login_screen.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/signup/signup_screen.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/dashboard.dart';

//

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  bool isLoging = false;
  User? get user => _user.value;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var verificationId = ''.obs;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    // Timer(Duration(seconds: isLoging ? 10 : 0), () {
    Timer(Duration(seconds: 3), () {
      if (user == null) {
        isLoging = false;
        update();
        Get.offAll(() => const LoginScreen());
      } else {
        isLoging = true;
        update();
        Get.offAll(() => const HomePage());
      }
    });
  }

  Future<void> phoneAuth(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<void> verifyOTP(String otp) async {
    await auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId.value, smsCode: otp));

    // return credential.user != null ? true : false;
  }

  void registerUser(email, password, name, phone) async {
    try {
      isLoging = true;
      update();
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => FirebaseFirestore.instance
                  .collection('users')
                  .doc(value.user!.uid)
                  .set({
                'name': name,
                'email': email,
                'phone': phone,
                'address': "",
              }));

      await user?.updateDisplayName(name);
      await user?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");

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

      // getErrorSnackBar("Account Creating Failed", e);
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
        await auth.signInWithCredential(crendentials).then((value) =>
            FirebaseFirestore.instance
                .collection('users')
                .doc(value.user!.uid)
                .set({
              'name': value.user!.displayName,
              'email': value.user!.email,
              'phone': "",
              'address': "",
            }));
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
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }

  void signOut() async {
    await auth.signOut();
  }
}
