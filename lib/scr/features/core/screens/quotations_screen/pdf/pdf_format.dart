import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/quotations_screen/pdf/pdfquoteapi.dart';

class pdfGenerate extends StatefulWidget {
  @override
  State<pdfGenerate> createState() => _pdfGenerateState();
}

class _pdfGenerateState extends State<pdfGenerate> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var kW = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title:
            Text('Quotation PDF', style: Theme.of(context).textTheme.headline6),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            Get.back(result: "0");
          },
        ),
      ),
      body: PdfPreview(
        maxPageWidth: size.width * 1.3,

        // pageFormats: ,
        canChangePageFormat: false,
        canChangeOrientation: false,
        allowSharing: true,
        allowPrinting: true,
        canDebug: false,

        // build: (format) => buildPdf(format),
        build: (format) => PdfQuoteAPI.generate(format),
      ),
    );
  }
}
