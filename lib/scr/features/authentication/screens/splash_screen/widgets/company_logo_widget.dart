import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';

class company_logo_widget extends StatelessWidget {
  const company_logo_widget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            alignment: Alignment.center,
            image: const AssetImage(tAppHeaderLogo),
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
              Text("SHUBHITHA S", style: Theme.of(context).textTheme.headline1),
              Text("ENERGY SOLUTIONS",
                  style: Theme.of(context).textTheme.headline2),
            ],
          ),
        ],
      ),
    );
  }
}