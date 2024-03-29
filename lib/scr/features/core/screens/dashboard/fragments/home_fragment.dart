
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/splash_screen/widgets/company_logo_widget.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/widget/stepsCard_widget.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/quotations_screen/QuotePage.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/notfications/notifications.dart';

class home_fragment extends StatefulWidget {
  const home_fragment({
    super.key,
  });

  @override
  State<home_fragment> createState() => _home_fragmentState();
}
// list of items

class _home_fragmentState extends State<home_fragment> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final media = MediaQuery.of(context);
    return Container(
      color:
          isDark ? Theme.of(context).scaffoldBackgroundColor : tBackgroundColor,
      child: Column(
        children: [
          SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultSize - 10, vertical: tDefaultSize - 15),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Home',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(() => const notificationsScreen());
                    },
                    icon: const Icon(Icons.notifications),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    company_logo_widget(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text("Get a free Quote",
                  style: Theme.of(context).textTheme.headline2),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      // Get.to(QuoteForm());
                      Get.to(() => const QuoteForm(),
                          transition: Transition.downToUp);
                    },
                    child: const Text("Generate Quote Instantly",
                        style: TextStyle(fontFamily: 'bookmanoldstyle'))),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    tHomeSubTitle,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ]),
          )),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 20),
                stepsCard_widget(
                  image: tStep1Image,
                  // image: CachedNetworkImage(imageUrl: tStep1Image),
                  text: tStep1,
                ),
                const SizedBox(width: 10),
                stepsCard_widget(
                  image: tStep2Image,
                  text: tStep2,
                ),
                const SizedBox(width: 10),
                stepsCard_widget(
                  image: tStep3Image,
                  text: tStep3,
                ),
                const SizedBox(width: 10),
                stepsCard_widget(
                  image: tStep4Image,
                  text: tStep4,
                ),
                const SizedBox(width: 10),
                stepsCard_widget(
                  image: tStep5Image,
                  text: tStep5,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
