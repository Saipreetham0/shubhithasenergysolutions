import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/widget/profile_list_item.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/profile_edit/profile_edit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final user = FirebaseAuth.instance.currentUser;

  final user = AuthController.instance.user;

  String urlImage = "";

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      if (user!.photoURL == null) {
        urlImage = tUserImage;
      } else {
        urlImage = user!.photoURL!;
      }
    }

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultSize - 10, vertical: tDefaultSize - 15),
          child: Column(children: [
            Row(
              children: [
                Text(
                  tProfileTitle,
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(urlImage),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const profileEdit());
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              user?.displayName ?? 'Edit Your Profile',
              // ,

              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 10),
            Text(
              "${user!.email}",
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            profile_list_widget(
              onTap: () {
                Get.to(profileEdit());
              },
              icon: LineIcons.edit,
              text: "Edit Profile",
            ),
            const SizedBox(height: 20),
            profile_list_widget(
              onTap: () {},
              icon: LineIcons.bell,
              text: "Notifications",
            ),
            const SizedBox(height: 20),
            profile_list_widget(
              onTap: () {},
              icon: LineIcons.lock,
              text: "Privacy Policy",
            ),
            const SizedBox(height: 20),
            profile_list_widget(
              onTap: () {},
              icon: LineIcons.questionCircle,
              text: "Help Support",
            ),
            const SizedBox(height: 20),
            profile_list_widget(
              onTap: () {},
              icon: LineIcons.userPlus,
              text: "Invite Friends",
            ),
            const SizedBox(height: 20),
            profile_list_widget(
              onTap: () {
                AuthController.instance.signOut();
              },
              icon: Icons.logout,
              text: "Logout",
              hasNavigation: false,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(
                  'https://saipreetham.me',
                );
                if (await launchUrl(url)) {
                  canLaunchUrl(url);
                } else {
                  // ignore: avoid_print
                  print("Can't launch $url");
                }
              },
              child: Text(
                developerName,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ])),
    );
  }
}
