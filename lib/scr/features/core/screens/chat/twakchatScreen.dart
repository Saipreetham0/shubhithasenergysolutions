import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
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
      if (user!.photoURL == null) {
        name = user!.displayName;
        email = user!.email;
        uid = user!.uid;
        phoneNumber = user!.phoneNumber;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with us'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Tawk(
          directChatLink:
              'https://tawk.to/chat/636b7fadb0d6371309ce1d95/1ghdulg5u',
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
