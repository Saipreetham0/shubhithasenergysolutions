import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.2,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  //Variables -- Declared in Constructor
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              alignment: Alignment.center,
              image: AssetImage(tAppHeaderLogo),
              height: size.height * 0.2,
              width: size.width * 0.15,
            ),
            SizedBox(
              width: size.width * 0.001,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("SHUBHITHA S",
                    style: Theme.of(context).textTheme.headline1),
                Row(
                  children: [
                    Text("ENERGY",
                        style: TextStyle(
                            color: Colors.yellow[800],
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700)),
                    Text(" SOLUTIONS",
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
              ],
            ),
          ],
        ),
        // Image(
        //     image: AssetImage(image),
        //     color: imageColor,
        //     height: size.height * imageHeight),
        SizedBox(height: heightBetween),
        Text(title, style: Theme.of(context).textTheme.headline1),
        Text(subTitle,
            textAlign: textAlign, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
