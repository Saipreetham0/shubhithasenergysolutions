import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/quotations_screen/Data_form_page.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/notfications/notifications.dart';

class home_fragment extends StatefulWidget {
  const home_fragment({
    super.key,
    required this.media,
  });

  final MediaQueryData media;

  @override
  State<home_fragment> createState() => _home_fragmentState();
}

class _home_fragmentState extends State<home_fragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.symmetric(
          horizontal: tDefaultSize - 10, vertical: tDefaultSize - 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Home',
                style: Theme.of(context).textTheme.headline1,
              ),
              IconButton(
                onPressed: () {
                  Get.to(notificationsScreen());
                },
                icon: const Icon(Icons.notifications),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            //decoration: BoxDecoration(color: Colors.pink[100]),
            height: 200,
            width: widget.media.size.width,
            child: Image.asset(tAppLogo),
          ),
          Text("Get a free Quote",
              style: Theme.of(context).textTheme.headline1),
          SizedBox(
            width: widget.media.size.width,
          ),
          ElevatedButton(
            onPressed: () {
             
            },
            child: Text("Generate Quote Instantly"),
          ),
        ],
      ),
    ));
  }
}
