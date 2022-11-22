import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';

class company_logo_widget extends StatelessWidget {
  // const company_logo_widget({
  //   super.key,
  //   required this.size,
  // });

  // final Size size;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print(size.height * 0.035);
    // print(size.height * 0.03);
    return Container(
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            alignment: Alignment.center,
            image: const AssetImage(tAppHeaderLogo),
            height: size.height * 0.2,
            width: size.width * 0.14,
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("SHUBHITHA S",
                  // style: Theme.of(context).textTheme.headline1,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline2!.color,
                      fontSize: size.height * 0.038,
                      // fontFamily: 'Poppins',
                      fontFamily: 'bookmanoldstyle',
                      fontWeight: FontWeight.w700)),
              Row(
                children: [
                  Text("ENERGY",
                      style: TextStyle(
                          color: Colors.yellow[800],
                          fontSize: size.height * 0.029,
                          fontFamily: 'bookmanoldstyle',
                          fontWeight: FontWeight.w700)),
                  Text(" SOLUTIONS",
                      // style: Theme.of(context).textTheme.headline2
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline2!.color,
                          fontSize: size.height * 0.029,
                          fontFamily: 'bookmanoldstyle',
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
