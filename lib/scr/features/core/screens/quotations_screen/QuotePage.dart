import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/quotations_screen/quote_data_cal.dart';

enum SolarTypeEnum { Domestic, Commercial }

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

  SolarTypeEnum? _SolarTypeEnum;

  var solarTypeRadioSelect;

  var visibleError = false;

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
// DateFormat.yMMMEd().format(DateTime.now())
  Future<void> addUser(String kW, String name, String phoneNumber,
      String address, String solorType) async {
    int uniqueId = DateTime.now().microsecondsSinceEpoch;
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(AuthController.instance.user!.uid)
    //     .collection("Quotations")
    //     .add({
    //   'name': _nameController.text,
    //   'phoneNumber': _phoneNumber.text,
    //   'address': _address.text,
    //   'kW': _kW.text, //
    //   'timestamp': DateFormat.yMd().add_jm().format(DateTime.now()),
    //   'solartype': solorType,
    //   // 'totalCost': "",
    // }).then((value) => FirebaseFirestore.instance
    //         .collection('quotations')
    //         .add({
    //           'name': _nameController.text,
    //           'phoneNumber': _phoneNumber.text,
    //           'address': _address.text,
    //           'kW': _kW.text, //
    //           'timestamp': DateFormat.yMd().add_jm().format(DateTime.now()),
    //           'solartype': solorType,
    //           // 'totalCost': "",
    //         })
    //         .then((value) => print("Data Added"))
    //         .catchError((error) => print("Failed to add user: $error")));

    var n = double.parse(_kW.text);

    // Get.to(pdfGenerator(), arguments: n);
    Get.to(() => const pdfGenerator(),
        arguments: [n, name, phoneNumber, address]);

    FocusScopeNode currentFocus = FocusScope.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
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
                        if (value == null || value.length < 10) {
                          return 'Please enter your phone number';
                        }
                        return null;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 0.45,
                          child: RadioListTile<SolarTypeEnum>(
                              contentPadding: const EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                // side: BorderSide(color: Colors.grey)
                              ),
                              value: SolarTypeEnum.Domestic,
                              groupValue: _SolarTypeEnum,
                              tileColor: isDark
                                  ? tSecondaryColor150
                                  : Theme.of(context).primaryColorLight,
                              title: Text(SolarTypeEnum.Domestic.name),
                              onChanged: (newValue) {
                                setState(() {
                                  _SolarTypeEnum = newValue;
                                  visibleError = false;

                                  solarTypeRadioSelect = "Domestic";
                                });
                              }),
                        ),
                        SizedBox(
                          width: size.width * 0.46,
                          child: RadioListTile<SolarTypeEnum>(
                              contentPadding: const EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                // side: BorderSide(color: Colors.grey)
                              ),
                              value: SolarTypeEnum.Commercial,
                              groupValue: _SolarTypeEnum,
                              tileColor: isDark
                                  ? tSecondaryColor150
                                  : Theme.of(context).primaryColorLight,
                              title: Text(SolarTypeEnum.Commercial.name),
                              onChanged: (val) {
                                setState(() {
                                  _SolarTypeEnum = val;

                                  solarTypeRadioSelect = "Commercial";

                                  visibleError = false;
                                });
                              }),
                        )
                      ],
                    ),
                    Visibility(
                      visible: visibleError,
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Please select your solar type",
                            style: TextStyle(
                              color: Colors.red[500],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
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
                          if (solarTypeRadioSelect == null) {
                            setState(() {
                              visibleError = true;
                            });
                          } else {
                            setState(() {
                              visibleError = false;
                            });
                          }

                          if (_formKey.currentState!.validate() &&
                              solarTypeRadioSelect != null) {
                            addUser(
                              _kW.text,
                              _nameController.text.trim(),
                              _phoneNumber.text.trim(),
                              _address.text.trim(),
                              solarTypeRadioSelect,
                            );
                          }
                        },
                        child: const Text("Generate Quotation"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
