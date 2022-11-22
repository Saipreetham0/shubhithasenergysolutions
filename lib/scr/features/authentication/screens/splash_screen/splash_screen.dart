import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/splash_screen/widgets/company_logo_widget.dart';

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
              height: size.height * 0.07,
            ),

            // padding: EdgeInsets.all(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                  // width: size.height * 0.2,
                ),
                Image(
                  image: const AssetImage(tSplashScreenImage),
                  height: size.height * 0.3,

                  // height: 250,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
