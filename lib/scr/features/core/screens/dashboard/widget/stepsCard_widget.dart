import 'package:flutter/material.dart';

class stepsCard_widget extends StatelessWidget {
  final String text;
  final String image;

  stepsCard_widget({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      borderOnForeground: true,
      color: Theme.of(context).cardColor,
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.26,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image, width: 100, height: 100),
            SizedBox(height: size.height * 0.001),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Text(
                text,
                // style: Theme.of(context).textTheme.subtitle2,
                style: TextStyle(
                  color: Theme.of(context).textTheme.subtitle2!.color,
                  fontSize: size.width * 0.035,
                  // fontFamily: 'Poppins',
                  fontFamily: 'bookmanoldstyle',
                  fontWeight: FontWeight.w500,
                ),

                textAlign: TextAlign.center,
              ),
            ),
            // Text("Enter your details"),
          ],
        ),
      ),
    );
  }
}
