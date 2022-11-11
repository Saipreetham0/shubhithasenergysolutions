import 'dart:io';
import 'dart:typed_data';
// import 'package:fatura_app/models/invoice_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';

String? _logo;
final data = Get.arguments;

class PdfQuoteAPI {
  static Future<Uint8List> generate(PdfPageFormat format) async {
    final pdf = Document();
    final companyLogo = MemoryImage(
      (await rootBundle.load('assets/images/splash-screen/APP_LOGO_ROW.png'))
          .buffer
          .asUint8List(),
    );

    final data = Get.arguments;
    // print(data);

    pdf.addPage(
      MultiPage(
        // header: _buildHeader,
        header: (context) => _buildHeader(context, companyLogo),
        footer: _buildFooter,
        build: (context) => [
          _introPage(context),
          _projectSummary(context),
          // Column(children: [Image(companyLogo)])
        ],
      ),
    );

    return await pdf.save();
    // return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }
}

Widget _buildHeader(Context context, MemoryImage companyLogo) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image(companyLogo, width: 60, height: 45),
          SizedBox(width: 0.1 * PdfPageFormat.cm),
          Text("Shubhitha's Energy Solutions Pvt Ltd",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(width: 1 * PdfPageFormat.cm),
        ]),
        Text("Brings Sun Energy at your service",
            style: TextStyle(
                fontSize: 12,
                color: PdfColors.yellow700,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 0.3 * PdfPageFormat.cm, child: Divider()),
      ],
    ),
  );
}

Widget _buildFooter(Context context) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text("Shubhitha's Energy Solutions Pvt Ltd.",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          SizedBox(width: 1 * PdfPageFormat.cm),
        ]),
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Text(
            'H. No: 2-57/10, Arepally, Geesugonda, Warangal, Telangana State, INDIA-506330'),
        Row(children: [
          Text('Phone: +91 85558 34486'),
          SizedBox(width: 1 * PdfPageFormat.cm),
          Text('Email: Shubhithasenergysolutions@gmail.com'),
        ]),
        Text('Website: https://shubhithasenergysolutions.com'),
      ],
    ),
  );
}

Widget _introPage(Context context) {
  final data = Get.arguments;
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 8 * PdfPageFormat.cm),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Detailed Project Report",
                  style: TextStyle(
                    fontSize: 25,
                  )),
              SizedBox(width: 1 * PdfPageFormat.cm),
            ]),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Text('${data[0]} kWp Grid Interacted Rooftop Solar PV System',
            style: TextStyle(fontSize: 20)),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Text(DateFormat.yMMMd().format(DateTime.now()),
            style: TextStyle(
              fontSize: 20,
            )),
        SizedBox(height: 5 * PdfPageFormat.cm),
        Row(children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Prepared For: ', style: TextStyle(fontSize: 16)),
                SizedBox(height: 0.1 * PdfPageFormat.cm),
                Text('Name: ${data[34]} ', style: TextStyle(fontSize: 15)),
                SizedBox(height: 0.1 * PdfPageFormat.cm),
                Text('Phone: ${data[35]}', style: TextStyle(fontSize: 15)),
                SizedBox(height: 0.1 * PdfPageFormat.cm),
                Text('Address: ${data[36]}', style: TextStyle(fontSize: 15)),
                SizedBox(height: 0.1 * PdfPageFormat.cm),
              ]),
          SizedBox(
            width: 10 * PdfPageFormat.cm,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Prepared By: ', style: TextStyle(fontSize: 16)),
                SizedBox(height: 0.1 * PdfPageFormat.cm),
                Text('Name: ', style: TextStyle(fontSize: 15)),
                SizedBox(height: 0.1 * PdfPageFormat.cm),
                Text('Phone: ', style: TextStyle(fontSize: 15)),
                SizedBox(height: 0.1 * PdfPageFormat.cm),
                Text('Address: ', style: TextStyle(fontSize: 15)),
                SizedBox(height: 0.1 * PdfPageFormat.cm),
              ]),
        ])
      ],
    ),
  );
}

Widget _projectSummary(Context context) {
  return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        SizedBox(height: 1.5 * PdfPageFormat.cm),
        Text('Project Summary',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Table(
          border: TableBorder.all(
            style: BorderStyle.solid,
            width: 1,
          ),
          // defaultColumnWidth: FixedColumnWidth(120.0),
          columnWidths: {0: FractionColumnWidth(.1)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,

          children: [
            TableRow(children: [
              custom_text_table_pdf(tSystemSize),
              custom_text_table_pdf('${data[0]}'),
            ]),
            TableRow(children: [
              custom_text_table_pdf(tSolarModuleRating),
              custom_text_table_pdf('${data[1]}'),
              custom_text_table_pdf('${data[2]}'),
              custom_text_table_pdf('${data[3]}'),
            ]),
            TableRow(children: [
              custom_text_table_pdf(tNumberOfModules),
              custom_text_table_pdf('${data[4]}'),
              custom_text_table_pdf('${data[5]}'),
              custom_text_table_pdf('${data[6]}'),
            ]),
            TableRow(children: [
              custom_text_table_pdf(tNumberOfInverters),
              custom_text_table_pdf('${data[0]}'),
              custom_text_table_pdf(''),
              custom_text_table_pdf(''),
            ]),
            TableRow(children: [
              custom_text_table_pdf(tNumberOfBatteries),
              custom_text_table_pdf('NA'),
              custom_text_table_pdf(''),
              custom_text_table_pdf(''),
            ]),
          ],
        ),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Text('Bill Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Table(
            border: TableBorder.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            defaultColumnWidth: FixedColumnWidth(120.0),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                custom_text_table_pdf(tSystemPrice),
                custom_text_table_pdf('Rs. ${data[7]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(tSubsidy),
                custom_text_table_pdf('Rs. ${data[8]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(tPostSubsidyRate),
                custom_text_table_pdf('Rs. ${data[9]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(tGst),
                custom_text_table_pdf('Rs. ${data[10]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(tNetMeterFee),
                custom_text_table_pdf('Rs. ${data[11]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(tSubsidyApplicationFee),
                custom_text_table_pdf('Rs. ${data[12]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(tCostToCustomer),
                custom_text_table_pdf('Rs. ${data[13]}'),
              ]),
            ]),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Text(tEnergyGenerated,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Table(
            border: TableBorder.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            defaultColumnWidth: FixedColumnWidth(120.0),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                custom_text_table_pdf(tEnergyGeneratedPerMonth),
                custom_text_table_pdf('${data[14]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(tEnergyGeneratedPerYear),
                custom_text_table_pdf('${data[15]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(tEnergyGeneratedForLifetime),
                custom_text_table_pdf('${data[16]}'),
              ]),
            ]),
        SizedBox(height: 1.5 * PdfPageFormat.cm),
        Text(tEnergySaving,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Table(
            border: TableBorder.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            defaultColumnWidth: FixedColumnWidth(120.0),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                custom_text_table_pdf(tMonthlyElectricityBillSaving),
                custom_text_table_pdf('Rs. ${data[17]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(tYearlyElectricityBillSaving),
                custom_text_table_pdf('Rs. ${data[18]}'),
              ]),
            ]),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Text(tReturnOnInvestment,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Table(
            border: TableBorder.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            defaultColumnWidth: FixedColumnWidth(120.0),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                custom_text_table_pdf(tPaybackPeriod),
                custom_text_table_pdf('${data[19]}'),
              ]),
            ]),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Text(tEnergyProduction,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 0.7 * PdfPageFormat.cm),
        Table(
            border: TableBorder.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            defaultColumnWidth: FixedColumnWidth(120.0),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                custom_text_table_pdf(''),
                custom_text_table_pdf(tAnnualEnergyProduction),
                custom_text_table_pdf(tAnnualCostSavings),
              ]),
              TableRow(children: [
                custom_text_table_pdf('Year 1'),
                custom_text_table_pdf('${data[20]}'),
                custom_text_table_pdf('Rs. ${data[27]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf('Year 2'),
                custom_text_table_pdf('${data[21]}'),
                custom_text_table_pdf('Rs. ${data[28]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf('Year 3'),
                custom_text_table_pdf('${data[22]}'),
                custom_text_table_pdf('Rs. ${data[29]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf('Year 4'),
                custom_text_table_pdf('${data[23]}'),
                custom_text_table_pdf('Rs. ${data[30]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf('Year 5'),
                custom_text_table_pdf('${data[24]}'),
                custom_text_table_pdf('Rs. ${data[31]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf('Year 6-10'),
                custom_text_table_pdf('${data[25]}'),
                custom_text_table_pdf('Rs. ${data[32]}'),
              ]),
              TableRow(children: [
                custom_text_table_pdf('Year 11-25'),
                custom_text_table_pdf('${data[26]}'),
                custom_text_table_pdf('Rs. ${data[33]}'),
              ]),
            ]),
      ]));
}

Padding custom_text_table_pdf(String text) =>
    Padding(padding: EdgeInsets.all(5), child: Text(text));
