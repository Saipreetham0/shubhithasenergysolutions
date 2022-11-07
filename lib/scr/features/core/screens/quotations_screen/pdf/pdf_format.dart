import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
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
        title: Text('Quotation PDF'),
      ),
      body: PdfPreview(
        maxPageWidth: size.width * 1.3,
        // pageFormats: ,
        canChangePageFormat: false,
        canChangeOrientation: false,
        allowSharing: true,
        allowPrinting: false,
        canDebug: false,

        // build: (format) => buildPdf(format),
        build: (format) => PdfQuoteAPI.generate(format),
      ),
    );
  }
}
