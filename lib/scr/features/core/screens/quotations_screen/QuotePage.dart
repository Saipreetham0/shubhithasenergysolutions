import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/quotations_screen/pdf_generator.dart';

class QuoteForm extends StatefulWidget {
  const QuoteForm({super.key});

  @override
  State<QuoteForm> createState() => _QuoteFormState();
}

class _QuoteFormState extends State<QuoteForm> {
  var _kW = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(""),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
              vertical: tFormHeight - 10, horizontal: 15),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _kW,
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
                      if (_kW != null) {
                        var n = double.parse('${_kW.text}');
                        Get.to(pdfGenerator(), arguments: n);
                        // double result = double.parse('$_kW');
                        print(n);
                      } else {
                        Get.snackbar("Error", "Please enter kW");
                      }
                      // Get.to(pdfGenerator(), arguments: _kW.text);
                    },
                    child: Text("Generate Quote"),
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
