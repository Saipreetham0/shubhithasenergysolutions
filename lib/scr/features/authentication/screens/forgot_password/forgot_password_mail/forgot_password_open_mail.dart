
import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';

class openMailScreen extends StatefulWidget {
  const openMailScreen({super.key});

  @override
  State<openMailScreen> createState() => _openMailScreenState();
}

class _openMailScreenState extends State<openMailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: tDefaultSize * 6),
                const Icon(
                  Icons.mail_outline_rounded,
                  size: 100.0,
                ),
                Text(
                  tOpenMailApp,
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Text(tOpenMailAppSubTitle,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center),
                const SizedBox(height: 20.0),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          // Get.to(() => const OTPScreen());
                          // await LaunchApp.openApp(
                          //   androidPackageName: 'com.google.android.gm',
                          //   openStore: true,
                          // );
                        },
                        child: const Text(tOpenMailAppButton)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
