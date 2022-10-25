import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class pdfApi {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
    print(file.path);
  }
}



// class _pdfGeneratorState extends State<pdfGenerator> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PDF Generator'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             final pdf = PdfGenrator();
//             pdf.addPage(
//               pw.MultiPage(
//                 pageFormat: PdfPageFormat.a4,
//                 build: (pw.Context context) {
//                   return <pw.Widget>[
//                     pw.Header(
//                         level: 0,
//                         child: pw.Row(
//                             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                             children: <pw.Widget>[
//                               pw.Text('Shubhitha Energy Solutions',
//                                   style: pw.TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: pw.FontWeight.bold)),
//                               pw.Text('Invoice',
//                                   style: pw.TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: pw.FontWeight.bold)),
//                             ])),
//                     pw.Header(
//                         level: 0,
//                         child: pw.Row(
//                             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                             children: <pw.Widget>[
//                               pw.Text('Invoice No: 123456',
//                                   style: pw.TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: pw.FontWeight.bold)),
//                               pw.Text('Date: 12/12/2021',
//                                   style: pw.TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: pw.FontWeight.bold)),
//                             ])),
//                     pw.Header(
//                         level: 0,
//                         child: pw.Row(
//                             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                             children: <pw.Widget>[
//                               pw.Text('Customer Name: Shubhitha',
//                                   style: pw.TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: pw.FontWeight.bold)),
//                               pw.Text('Contact No: 1234567890',
//                                   style: pw.TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: pw.FontWeight.bold)),
//                             ])),
//                     pw.Header(
//                         level: 0,
//                         child: pw.Row(
//                             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                             children: <pw.Widget>[
//                               pw.Text('Address: 123, ABC Street, Chennai',
//                                   style: pw.TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: pw.FontWeight.bold)),
//                               pw.Text('GSTIN: 1234567890',
//                                   style: pw.TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: pw.FontWeight.bold