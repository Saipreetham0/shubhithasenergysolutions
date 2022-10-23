import 'package:flutter/material.dart';
import 'package:get/get.dart';

class notificationsScreen extends StatelessWidget {
  const notificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Notifications',
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
        body: Container(
          child: const Center(
            child: Text('Notifications'),
          ),
        ),
      ),
    );
  }
}
