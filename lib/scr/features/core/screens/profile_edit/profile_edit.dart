import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';

class profileEdit extends StatefulWidget {
  const profileEdit({super.key});

  @override
  State<profileEdit> createState() => _profileEditState();
}

class _profileEditState extends State<profileEdit> {
  bool showPassword = false;
  String urlImage = "";
  final user = AuthController.instance.user;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      print(user!.photoURL);
      if (user!.photoURL == null) {
        urlImage = tUserImage;
      } else {
        urlImage = user!.photoURL!;
      }
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
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
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Edit Profile",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  urlImage,
                                ))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Theme.of(context).backgroundColor,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: tDefaultSize - 15),
                TextFormField(
                  // controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: tEmail,
                    hintText: tEmail,
                  ),
                ),
                SizedBox(height: tDefaultSize - 15),
                TextFormField(
                  // controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: tFullName,
                    hintText: tFullName,
                  ),
                ),
                SizedBox(height: tDefaultSize - 15),
                TextFormField(
                  // controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: tPhoneNo,
                    hintText: tPhoneNo,
                  ),
                ),
                SizedBox(height: tDefaultSize - 15),
                TextFormField(
                  // controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_on_outlined),
                    labelText: tAddress,
                    hintText: tAddress,
                  ),
                ),
                SizedBox(height: tDefaultSize - 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () {}, child: Text("Cancel"))),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Save"))),
                  ],
                ),
              ],
            ),
          ),

          // child: Column()
        ),
      ),
    ));
  }
}
