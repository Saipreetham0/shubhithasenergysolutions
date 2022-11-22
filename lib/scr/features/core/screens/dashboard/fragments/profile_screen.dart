import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/links.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/widget/profile_list_item.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/help_support/help_support.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/notfications/notifications.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/profile_edit/profile_edit.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final user = FirebaseAuth.instance.currentUser;

  final user = AuthController.instance.user;
  final db = FirebaseFirestore.instance;

  String urlImage = "";

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (user != null) {
      urlImage = tUserImage;
      if (user!.photoURL == null) {
        urlImage = tUserImage;
      } else {
        urlImage = user!.photoURL!;
      }
    }

    return Scaffold(
      body: Container(
          color: isDark
              ? Theme.of(context).scaffoldBackgroundColor
              : tBackgroundColor,
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
                            // color: isDark ? Colors.white : Colors.black,
                          ),
                          // color: isDark
                          //     ? Colors.white
                          //     : Theme.of(context).scaffoldBackgroundColor,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const profileEdit());
                          },
                          child: Icon(
                            Icons.edit,
                            color: isDark ? tPrimaryColor : Colors.black,
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
            profileListViewWidget(
              icon: LineIcons.edit,
              onTap: () {
                Get.to(() => const profileEdit());
              },
              text: 'Edit Profile',
            ),
            profileListViewWidget(
              icon: LineIcons.bell,
              onTap: () {
                Get.to(() => const notificationsScreen());
              },
              text: 'Notifications',
            ),
            profileListViewWidget(
              onTap: () async {
                final url = Uri.parse(
                  kprivacyPolicy,
                );
                if (await launchUrl(url,
                    mode: LaunchMode.externalApplication)) {
                  canLaunchUrl(url);
                } else {
                  // ignore: avoid_print
                  print("Can't launch $url");
                }
              },
              icon: LineIcons.lock,
              text: "Privacy Policy",
            ),
            profileListViewWidget(
              onTap: () {
                Get.to(() => const helpSupport());
              },
              icon: LineIcons.questionCircle,
              text: "Help Support",
            ),
            profileListViewWidget(
              onTap: () {
                // Share.share('check out my website https://example.com');
                shareButton();
              },
              icon: LineIcons.userPlus,
              text: "Invite Friends",
            ),
            profileListViewWidget(
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
                  kspDeveloperSite,
                );
                if (await launchUrl(url,
                    mode: LaunchMode.externalApplication)) {
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

  shareButton() {
    db.collection('admin').doc('share').get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print(data['image']);
      Share.share(data['message']);
    });
  }
}

// 