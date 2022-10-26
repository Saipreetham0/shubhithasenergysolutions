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
    return Card(
      borderOnForeground: true,
      color: Theme.of(context).cardColor,
      child: Container(
        width: 160,
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image, width: 100, height: 100),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
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
