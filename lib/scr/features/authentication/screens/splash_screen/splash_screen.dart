import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  @override
  void initState() {
    super.initState();
    // startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.15,
              // width: size.height * 0.2,
            ),
            Container(
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    alignment: Alignment.center,
                    image: AssetImage(
                        "assets/images/splash-screen/APP_LOGO_ROW.png"),
                    height: size.height * 0.2,
                    width: size.width * 0.22,
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SHUBHITHA S",
                          style: Theme.of(context).textTheme.headline1),
                      Text("ENERGY SOLUTIONS",
                          style: Theme.of(context).textTheme.headline2),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              // padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                    // width: size.height * 0.2,
                  ),
                  Image(
                    image: AssetImage(
                        "assets/images/splash-screen/splash_screen_one.png"),
                    height: 250,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

// Future startAnimation() async {
//   // await Future.delayed(const Duration(milliseconds: 500));
//   // setState(() {
//   //   animate = true;
//   // });
//   await Future.delayed(const Duration(milliseconds: 500));
//   Get.to(const HomePage());
// }
