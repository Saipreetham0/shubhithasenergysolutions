import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/forgot_password/forgot_password_mail/forgot_password_mail_screen.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/forgot_password/forgot_password_options/forgot_password_button_widget.dart';

class logOutScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        height: 250,
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tLogout, style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: tDefaultSize - 20),
            Text(tLogoutSubtitle, style: Theme.of(context).textTheme.bodyText2),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.4,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(tLogoutNo),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthController.instance.signOut();
                    },
                    child: const Text(tLogoutYes),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
