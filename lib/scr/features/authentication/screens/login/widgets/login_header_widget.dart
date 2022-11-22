import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/screens/splash_screen/widgets/company_logo_widget.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image(image: const AssetImage(tAppLogo), height: size.height * 0.2),

        company_logo_widget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              alignment: Alignment.center,
              image: const AssetImage(tAppHeaderLogo),
              height: size.height * 0.2,
              width: size.width * 0.12,
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
                            // fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700),
                            ),
                    Text(" SOLUTIONS",
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
              ],
            ),
          ],
        ),

        Text(tLoginTitle, style: Theme.of(context).textTheme.headline1),
        Text(tLoginSubTitle, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
