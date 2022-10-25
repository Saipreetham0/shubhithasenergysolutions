import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:shubhithasenergysolutions/scr/features/core/models/quote_model.dart';
import 'package:shubhithasenergysolutions/scr/features/pdf_new/apdfapi.dart';

class PdfinoviceApi {
  static Future<Future<File>> generateInvoice(Invoice invoice) async {
    final pdf = Document();

    return pdfApi.saveDocument(name: 'invoice.pdf', pdf: pdf);
  }
}
