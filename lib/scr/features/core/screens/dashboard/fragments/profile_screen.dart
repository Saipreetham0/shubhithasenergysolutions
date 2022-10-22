import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/widget/profile_list_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(tProfileImage),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "tProfileName",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10),
            Text(
              "tProfileEmail",
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            profile_list_widget(
              onTap: () {},
              icon: Icons.notifications,
              text: "Notifications",
            ),
            const SizedBox(height: 20),
            profile_list_widget(
              onTap: () {},
              icon: Icons.notifications,
              text: "Notifications",
            ),
            const SizedBox(height: 20),
            profile_list_widget(
              onTap: () {},
              icon: Icons.notifications,
              text: "Notifications",
            ),
            const SizedBox(height: 20),
            profile_list_widget(
              onTap: () {},
              icon: Icons.notifications,
              text: "Notifications",
            ),
          ])),
    );
  }
}
