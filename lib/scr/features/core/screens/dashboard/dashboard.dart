import 'package:flutter/material.dart';

import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/Data_Form/Data_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isDark = false;

  //dark mode
  void chngeTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          leading: Icon(
            Icons.menu,
            //dark mode

            // color: Colors.black,
            color: isDark ? tWhiteColor : tDarkColor,
          ),
          title: Text(tDashboardTitle,
              style: Theme.of(context).textTheme.bodyText1),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20, top: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: isDark ? tSecondaryColor : tCardBgColor,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                color: Colors.black,
              ),
            )
          ],
        ),
        
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                //decoration: BoxDecoration(color: Colors.pink[100]),
                height: 200,
                width: media.size.width,
                child: Image.asset(tAppLogo),
              ),
              Text("Get a free Quote", style: TextStyle(fontSize: 20)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return QuoteForm();
                  }));
                },
                child: Text("Generate Quote Instantly"),
              ),
              ElevatedButton(
                  onPressed: () {
                    AuthController.instance.signOut();
                  },
                  child: Text("Sign Out")),
            ],
          ),
        )),
      ),
    );
  }
}
