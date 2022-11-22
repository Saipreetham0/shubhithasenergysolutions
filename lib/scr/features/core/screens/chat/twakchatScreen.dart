import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:shubhithasenergysolutions/scr/constants/config.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';

class twakChatScreen extends StatefulWidget {
  const twakChatScreen({super.key});

  @override
  State<twakChatScreen> createState() => _twakChatScreen();
}

class _twakChatScreen extends State<twakChatScreen> {
  final user = AuthController.instance.user;

  var name, email, photoURL, uid, phoneNumber;

  @override
  Widget build(BuildContext context) {
    if (user != null) {
      name = user!.displayName;
      email = user!.email;
      phoneNumber = user!.phoneNumber;
      uid = user!.uid;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with us'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Tawk(
          directChatLink: twakLink,
          visitor: TawkVisitor(
            name: name,
            email: email,
          ),
          onLoad: () {
            // print(
            //   'Hello Tawk! $name $email',
            // );
          },
          onLinkTap: (String url) {
            // print(url);
          },
          placeholder: const Center(
            child: Text('Loading...'),
          )),
    );
  }
}
