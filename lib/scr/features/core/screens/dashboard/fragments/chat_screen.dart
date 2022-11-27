import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/chat/twakchatScreen.dart';

class chatScreen extends StatelessWidget {
  const chatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: isDark
              ? Theme.of(context).scaffoldBackgroundColor
              : tBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultSize - 10, vertical: tDefaultSize - 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(
                //   tCustomerServiceImage,
                //   height: size.height * 0.5,
                // ),
                CachedNetworkImage(
                  imageUrl: tCustomerServiceImage,
                  height: size.height * 0.5,
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Text(tChatSubtitle,
                    style: Theme.of(context).textTheme.bodyLarge),

                SizedBox(
                  height: size.height * 0.05,
                ),
                // Center(child: Text('Chat Screen comming soon.....')),
                SizedBox(
                  // height: 30,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pop(context);
                      Get.to(() => twakChatScreen());
                    },
                    child: Text('Chat Now'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
