import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/splash_screen_controller.dart';

import 'package:shubhithasenergysolutions/scr/features/authentication/screens/splash_screen/widgets/company_logo_widget.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController = Get.put(SplashScreenController());

  // bool animate = false;

  // @override
  @override
  Widget build(BuildContext context) {
    SplashController.startAnimation();
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.15,
              // width: size.height * 0.2,
            ),
            company_logo_widget(),
            SizedBox(
              height: size.height * 0.08,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Image(
                  image: const AssetImage(tSplashScreenImage),
                  height: size.height * 0.3,
                ),
              ],
            ),
          ],
        ),
      )

          // body: Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     AnimatedPositioned(
          //         duration: const Duration(microseconds: 1600),
          //         // top: animate ? size.height * 0.2 : 100,
          //         top: size.height * 0.2,
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             company_logo_widget(),
          //           ],
          //         )),
          //     Obx(
          //       () => AnimatedPositioned(
          //           duration: const Duration(milliseconds: 1200),
          //           bottom: SplashController.animate.value
          //               ? size.height * 0.1
          //               : size.height * -0.3,
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Image(
          //                 image: const AssetImage(tSplashScreenImage),
          //                 height: size.height * 0.3,
          //               ),
          //             ],
          //           )),
          //     )
          //   ],
          // ),
          ),
    );
  }
}
