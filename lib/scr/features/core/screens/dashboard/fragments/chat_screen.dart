import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/splash_screen/widgets/company_logo_widget.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/chat/twakchatScreen.dart';

class chatScreen extends StatelessWidget {
  const chatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultSize - 10, vertical: tDefaultSize - 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // company_logo_widget(size: size),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                    "We are available 24/7 to assist you with any questions you may have about solar power ",
                    style: Theme.of(context).textTheme.bodyLarge),

                SizedBox(
                  height: size.height * 0.07,
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
