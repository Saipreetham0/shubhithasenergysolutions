import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/input_validators.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    // categoryController.dispose();
    super.dispose();
  }

  bool passwordObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  label: Text(tEmail), prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  label: Text(tPhoneNo), prefixIcon: Icon(Icons.numbers)),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: passwordObscureText,
              decoration: InputDecoration(
                label: Text(tPassword),
                prefixIcon: Icon(Icons.fingerprint),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordObscureText = !passwordObscureText;
                    });
                  },
                  icon: Icon(
                    passwordObscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (InputValidator.validateField(
                      "Name", nameController.text)) {
                    if (InputValidator.validateEmailAddress(
                        "Email", emailController.text)) {
                      if (InputValidator.validatePhoneNumber(
                          "Phone", phoneController.text)) {
                        if (InputValidator.validateField(
                            "Password", passwordController.text)) {
                          String name = nameController.text.trim();
                          String email = emailController.text.trim();
                          String phone = phoneController.text.trim();
                          String password = passwordController.text.trim();
                          AuthController.instance
                              .registerUser(email, password, name, phone);

                          //addUserDetails(name, email, phone);
                        }
                      }
                    }
                  }
                },
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
