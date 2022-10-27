import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';

class pdfFile extends StatelessWidget {
  const pdfFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: tDefaultSize - 10, vertical: tDefaultSize - 15),
        child: Column(
          children: [
            Row(
              children: [
                Text("My Proposals",
                    style: Theme.of(context).textTheme.headline1),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
