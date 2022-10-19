import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/signup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: tFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(tGoogleLogoImage), width: 20.0),
            onPressed: () {
              AuthController.instance.googleLogin();
            },
            label: const Text(tSignInWithGoogle),
          ),
        ),
        const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () {
            Get.to(() => const SignUpScreen());
          },
          child: Text.rich(
            TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(text: tSignup, style: TextStyle(color: Colors.blue))
                ]),
          ),
        ),
      ],
    );
  }
}
