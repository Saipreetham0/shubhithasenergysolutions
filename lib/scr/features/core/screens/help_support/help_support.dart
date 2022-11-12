import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shubhithasenergysolutions/scr/constants/links.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/widget/profile_list_item.dart';
import 'package:url_launcher/url_launcher.dart';

class helpSupport extends StatelessWidget {
  const helpSupport({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri(
      scheme: "https",
      host: 'play.google.com',
      path: 'store/apps/details',
      queryParameters: {"id": 'com.whatsapp'},
    );
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Help & Support',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        //
        body: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultSize - 10, vertical: tDefaultSize - 15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Contact Us',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height: 20),
              profile_list_widget(
                icon: LineIcons.phone,
                text: 'call us',
                onTap: () async {
                  final url = Uri.parse(
                    kcallUs,
                  );
                  if (await launchUrl(url)) {
                    canLaunchUrl(url);
                  } else {
                    // ignore: avoid_print
                    print("Can't launch $url");
                  }
                },
              ),
              const SizedBox(height: 20),
              profile_list_widget(
                icon: LineIcons.envelope,
                text: 'Email',
                onTap: () async {
                  final url = Uri.parse(
                    kemail,
                  );
                  if (await launchUrl(url)) {
                    canLaunchUrl(url);
                  } else {
                    // ignore: avoid_print
                    print("Can't launch $url");
                  }
                },
              ),
              const SizedBox(height: 20),
              profile_list_widget(
                icon: LineIcons.whatSApp,
                text: 'chat with us',
                onTap: () async {
                  final url = Uri.parse(kchatWithUs);
                  if (await launchUrl(url,
                      mode: LaunchMode.externalApplication)) {
                    canLaunchUrl(url);
                  } else {
                    // ignore: avoid_print
                    print("Can't launch $url");
                  }
                },
                // onTap: () {
                //   _launchUrl(kchatWithUs);
                // },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'More',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              profile_list_widget(
                icon: LineIcons.alternateExternalLink,
                text: 'Website',
                onTap: () async {
                  final url = Uri.parse(
                    kwebsite,
                  );
                  if (await launchUrl(url)) {
                    canLaunchUrl(url);
                  } else {
                    // ignore: avoid_print
                    print("Can't launch $url");
                  }
                },
              ),
              const SizedBox(height: 20),
              profile_list_widget(
                icon: LineIcons.link,
                text: 'Terms & Conditions',
                onTap: () async {
                  final url = Uri.parse(
                    ktermsAndConditions,
                  );
                  if (await launchUrl(url)) {
                    canLaunchUrl(url);
                  } else {
                    // ignore: avoid_print
                    print("Can't launch $url");
                  }
                },
              ),
              const SizedBox(height: 20),
              profile_list_widget(
                icon: LineIcons.info,
                text: 'About Us',
                onTap: () async {
                  final url = Uri.parse(
                    ktermsAndConditions,
                  );
                  if (await launchUrl(url)) {
                    canLaunchUrl(url);
                  } else {
                    // ignore: avoid_print
                    print("Can't launch $url");
                  }
                },
              ),
              // const SizedBox(height: 20),
              // profile_list_widget(
              //   icon: LineIcons.questionCircle,
              //   text: 'FAQ',
              //   onTap: () async {
              //   final url = Uri.parse(
              //     kfaq,
              //   );
              //   if (await launchUrl(url)) {
              //     canLaunchUrl(url);
              //   } else {
              //     // ignore: avoid_print
              //     print("Can't launch $url");
              //   }
              // },
              // ),
              const SizedBox(height: 20),
              profile_list_widget(
                icon: LineIcons.editAlt,
                text: 'Send Feedback',
                onTap: () async {
                  final url = Uri.parse(kfeedback);
                  if (await launchUrl(url)) {
                    canLaunchUrl(
                      url,
                    );
                  } else {
                    // ignore: avoid_print
                    print("Can't launch $url");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
