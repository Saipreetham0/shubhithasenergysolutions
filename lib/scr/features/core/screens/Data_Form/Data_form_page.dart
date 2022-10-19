import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';

class QuoteForm extends StatelessWidget {
  const QuoteForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
              vertical: tFormHeight - 10, horizontal: 15),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text(tFullName),
                      prefixIcon: Icon(Icons.person_outline_rounded)),
                ),
                const SizedBox(height: tFormHeight - 20),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text(tEmail),
                      prefixIcon: Icon(Icons.email_outlined)),
                ),
                const SizedBox(height: tFormHeight - 20),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text(tPhoneNo), prefixIcon: Icon(Icons.numbers)),
                ),
                const SizedBox(height: tFormHeight - 20),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text(tPassword),
                      prefixIcon: Icon(Icons.fingerprint)),
                ),
                const SizedBox(height: tFormHeight - 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    child: Text(tSignup.toUpperCase()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
