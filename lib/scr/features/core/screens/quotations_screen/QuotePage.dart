import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/quotations_screen/quote_data_cal.dart';

class QuoteForm extends StatefulWidget {
  const QuoteForm({super.key});

  @override
  State<QuoteForm> createState() => _QuoteFormState();
}

class _QuoteFormState extends State<QuoteForm> {
  final _formKey = GlobalKey<FormState>();
  final _kW = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _address = TextEditingController();

  //  final studentViewModel = Get.put(quoteUploadModel());

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _kW.dispose();
    _phoneNumber.dispose();
    _address.dispose();
    _nameController.dispose();
    super.dispose();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(
      String kW, String name, String phoneNumber, String address) async {
    int uniqueId = DateTime.now().microsecondsSinceEpoch;
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(AuthController.instance.user!.uid)
    //     .collection("Quotations")
    //     .add({
    //   'phone Number': _phoneNumber.text,
    //   'address': _address.text,
    //   'kW': _kW.text, //
    //   'Timestamp': DateTime.now(),
    // }).then((value) => FirebaseFirestore.instance
    //         .collection('quotations')
    //         .add({
    //           'phone Number': _phoneNumber.text,
    //           'address': _address.text,
    //           'kW': _kW.text, //
    //           'Timestamp': DateTime.now(),
    //         })
    //         .then((value) => print("Data Added"))
    //         .catchError((error) => print("Failed to add user: $error")));

    var n = double.parse(_kW.text);

    // Get.to(pdfGenerator(), arguments: n);
    Get.to(() => pdfGenerator(), arguments: [n, name, phoneNumber, address]);

    FocusScopeNode currentFocus = FocusScope.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: tFormHeight - 10, horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("Quotation",
                          style: Theme.of(context).textTheme.headline2),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      //  if (value == null || value.isEmpty) {
                      //   return 'Please enter your name';
                      // }
                      // return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        label: Text("Name"), prefixIcon: Icon(Icons.person)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _phoneNumber,
                    validator: (value) {
                      // if (value == null || value.length < 10) {
                      //   return 'Please enter your phone number';
                      // }
                      // return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text("Phone Number"),
                        prefixIcon: Icon(Icons.phone)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _address,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        label: Text("Address"),
                        prefixIcon: Icon(Icons.location_on)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _kW,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter kW';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text("Enter kW"),
                        prefixIcon: Icon(Icons.energy_savings_leaf)),
                  ),
                  const SizedBox(height: tFormHeight - 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          addUser(
                            _kW.text,
                            _nameController.text.trim(),
                            _phoneNumber.text.trim(),
                            _address.text.trim(),
                          );
                        }
                      },
                      child: Text("Generate Quotation"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
