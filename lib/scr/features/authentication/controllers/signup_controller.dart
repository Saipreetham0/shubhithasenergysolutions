import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  //Call this Function from Design & it will do the rest
  void registerUser(
      String email, String password, String name, String phone) async {
    String? error = AuthController.instance.createUserWithEmailAndPassword(
      email,
      password,
      fullName.text,
      phoneNo.text,
    ) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }
}
