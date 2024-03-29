import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/quotations_screen/quote_data_cal.dart';

class pdfFile extends StatefulWidget {
  const pdfFile({super.key});

  @override
  State<pdfFile> createState() => _pdfFileState();
}

class _pdfFileState extends State<pdfFile> {
  final user = AuthController.instance.user;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final uid = user!.uid;

    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('Quotations');

    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: isDark
            ? Theme.of(context).scaffoldBackgroundColor
            : tBackgroundColor,
        height: Size.infinite.height,
        padding: const EdgeInsets.symmetric(
            horizontal: tDefaultSize - 10, vertical: tDefaultSize - 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        {
                          return Column(
                            children: [
                              SizedBox(height: size.height * 0.35),
                              const Center(
                                child: Text('No Quotation Generated'),
                              ),
                            ],
                          );
                        }
                      }
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
                                    onTap: () {
                                      Get.to(() => const pdfGenerator(),
                                          arguments: [
                                            // docs['kW'].toString(),
                                            double.parse('${docs['kW']}'),
                                            docs['name'],
                                            docs['phoneNumber'],
                                            docs['address']
                                          ],
                                          transition: Transition.fadeIn);
                                    },
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
                                      TextSpan(
                                        text: " | ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      TextSpan(
                                        text: "${docs['solartype']}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      // TextSpan(
                                      //   text: " | ",
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .bodyText1,
                                      // ),
                                      // TextSpan(
                                      //   text: "${docs['solartype']}",
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .headline6,
                                      // ),
                                    ])),
                                    leading: Image.asset(
                                        'assets/images/pdfListView/${docs['solartype']}.png',
                                        height: 40),
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
