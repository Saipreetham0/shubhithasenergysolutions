import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';

class pdfFile extends StatefulWidget {
  const pdfFile({super.key});

  @override
  State<pdfFile> createState() => _pdfFileState();
}

class _pdfFileState extends State<pdfFile> {
  final user = AuthController.instance.user;

  @override
  Widget build(BuildContext context) {
    final uid = user!.uid;

    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Quotations');

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: tDefaultSize - 10, vertical: tDefaultSize - 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  Text("My Proposals",
                      style: Theme.of(context).textTheme.headline1),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StreamBuilder(
                    stream: ref.snapshots(),
                    builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var docs = snapshot.data!.docs[index];

                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  elevation: 2,
                                  child: ListTile(
                                    onTap: () {},
                                    title: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "${docs['kW']}",
                                        style: TextStyle(
                                            color: Colors.yellow[700],
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      TextSpan(
                                          text: " KWh",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6),
                                      const TextSpan(
                                        text: " | ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "${docs['solartype']}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      const TextSpan(
                                        text: " | ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "${docs['solartype']}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ])),
                                    // leading: Image.asset(tFactoryListImage,
                                    //     height: 40),

                                    leading:
                                        Image.asset(tHomeListImage, height: 40),
                                    subtitle: Text(
                                      "${docs['timestamp']}",
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                );
                              }),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
