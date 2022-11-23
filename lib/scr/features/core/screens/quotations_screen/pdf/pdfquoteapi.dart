import 'dart:typed_data';
// import 'package:fatura_app/models/invoice_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';
import 'package:shubhithasenergysolutions/scr/constants/company_pdf_strings.dart';
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
    final solorEnergy = MemoryImage(
      (await rootBundle.load(
              'assets/images/pdf/sun-energy-electrical-enery-conversion.png'))
          .buffer
          .asUint8List(),
    );
    final gridConnectPic = MemoryImage(
      (await rootBundle.load('assets/images/pdf/Grid-connected-Solar-PV.png'))
          .buffer
          .asUint8List(),
    );

    final benfitsOfSolarPic = MemoryImage(
      (await rootBundle.load('assets/images/pdf/benfits-of-solar.png'))
          .buffer
          .asUint8List(),
    );

    final saveTheEarthPic = MemoryImage(
      (await rootBundle.load('assets/images/pdf/save-the-earth-go-green.png'))
          .buffer
          .asUint8List(),
    );

    final data = Get.arguments;
    // final pageTheme = await _myPageTheme(format);

    final kw = data[0];
    // final BKMNOS = await rootBundle.load("assets/fonts/BKMNOS.ttf");
    // final BOOKOS = await rootBundle.load("assets/fonts/BOOKOS.TTF");
    // final BOOKOSB = await rootBundle.load("assets/fonts/BOOKOSB.TTF");

    // final ttf = Font.ttf(font);

    var myTheme = ThemeData.withFont(
      base: Font.ttf(await rootBundle.load("assets/fonts/BKMNOS.ttf")),
      bold: Font.ttf(await rootBundle.load("assets/fonts/BOOKOSB.TTF")),
      // italic: Font.ttf(await rootBundle.load("assets/OpenSans-Italic.ttf")),
      // boldItalic: Font.ttf(await rootBundle.load("assets/OpenSans-BoldItalic.ttf")),
    );

// var pdf = Document(
//   theme: myTheme,
// );

    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      MultiPage(
        theme: myTheme,
        pageFormat: PdfPageFormat.a4,
        header: (context) => _buildHeader(context, companyLogo),
        footer: _buildFooter,
        build: (context) => [
          if (kw <= 3)
            _domestic(context)
          else
            _commercial(context, companyLogo, solorEnergy, gridConnectPic,
                benfitsOfSolarPic, saveTheEarthPic),

          // _introPage(context),
          // _commercial(context, companyLogo)
          // _projectSummary(context),
          // _domestic(context)
          // Column(children: [Image(companyLogo)])
        ],
      ),
    );

    return await pdf.save();
    // return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }
}

Widget _commercial(
    Context context,
    MemoryImage companyLogo,
    MemoryImage solorEnergy,
    MemoryImage gridConnectPic,
    MemoryImage benfitsOfSolarPic,
    MemoryImage saveTheEarthPic) {
  final data = Get.arguments;

  return Container(
    // decoration: DecorationImage(image: companyLogo, fit: BoxFit.cover,)

    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.2 * PdfPageFormat.cm),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Detailed Project Report \n(DPR)\n',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ]),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('TO',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ]),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${data[34]}\n${data[36]}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ]),
          SizedBox(height: 1.5 * PdfPageFormat.cm),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    'Grid Connected Rooftop Solar PV \nPower System of \n${data[0]} KWp DC Capacity with Net \nMetering System',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ]),
          SizedBox(height: 1.5 * PdfPageFormat.cm),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('By',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ]),
          SizedBox(height: 1.5 * PdfPageFormat.cm),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('M/S. SHUBHITHA S ENERGY SOLUTIONS \nPVT LTD',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ]),
          SizedBox(height: 1.5 * PdfPageFormat.cm),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Quotation No: ',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            SizedBox(width: 1 * PdfPageFormat.cm),
            Text('Date: ${DateFormat.yMMMMd().format(DateTime.now())}',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ]),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("To", style: const TextStyle(fontSize: 12)),
                      Text("${data[34]},",
                          style: const TextStyle(fontSize: 12)),
                      Text("${data[36]}", style: const TextStyle(fontSize: 12)),
                      // Text("To", style: const TextStyle(fontSize: 12)),
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text("To", style: const TextStyle(fontSize: 12)),
                    ])
              ]),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Text(
            'Sub: Our Techno Commercial Proposal for the ${data[0]} kWp DC Rooftop Grid tied \n        Solar PV Power Plant – Reg.',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Text(
            'Dear Sir,',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          RichText(
              text: TextSpan(children: [
            const TextSpan(
                text: 'We thank you for your kind courtesy extended towards ',
                style: TextStyle(fontSize: 12)),
            TextSpan(
                text: 'Shubhitha S Energy Solutions Pvt Ltd',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            const TextSpan(
                text:
                    'regarding the setting up of Grid tied Rooftop Solar PV Power Plant. ',
                style: TextStyle(fontSize: 12)),
          ])),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'As per the recent discussion held regarding setting up of ${data[0]} kWp Grid tied Rooftop Solar PV Power Plant for ${data[34]}, ${data[36]}. We wish to bring to your kind notice that, we have prepared a detailed techno commercial proposal with all technical details and make of the material.',
            style: const TextStyle(fontSize: 12),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'We sincerely request you to kindly go through it and please let me know if you need any further information related in this regard.',
            style: const TextStyle(fontSize: 12),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'We very much look forward to your kind consideration.',
            style: const TextStyle(fontSize: 12),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'Awaiting for your positive response and very much delighted to serve you.',
            style: const TextStyle(fontSize: 12),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'Thanking you and hoping to be associated with your pioneering endeavor on a long term fruitful basis, we remain.',
            style: const TextStyle(fontSize: 12),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text("Yours faithfully,\n",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right),
          ]),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text(
                "Director\nFor Shubhitha S Energy Solutions Pvt Ltd\n 8555 834 486",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right),
          ]),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Text('Project at a Glance',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          SizedBox(height: 1 * PdfPageFormat.cm),
          //project at a glance
          Table(
              border: TableBorder.all(
                style: BorderStyle.solid,
                width: 1,
              ),
              // defaultColumnWidth: FixedColumnWidth(120.0),
              columnWidths: {
                0: const FractionColumnWidth(0.06),
                1: const FractionColumnWidth(.5),
                // 2: const FractionColumnWidth(.15),
                // 3: const FractionColumnWidth(.15),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  custom_Header_Text_Table_Pdf('S.No'),
                  custom_Header_Text_Table_Pdf('General Parameters'),
                ]),
              ]),
          //general parameters
          Table(
              border: const TableBorder(
                left: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
                right: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
                bottom: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
                verticalInside: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
                horizontalInside: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              columnWidths: {
                0: const FractionColumnWidth(0.132),
                1: const FractionColumnWidth(.5),
                2: const FractionColumnWidth(.6),
                // 3: const FractionColumnWidth(.15),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  custom_text_table_pdf('1'),
                  custom_text_table_pdf('Project Name'),
                  custom_Header_Text_Table_Pdf(
                      '${data[0]} kWp Grid connected Solar PV Ground Mounted System'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('2'),
                  custom_text_table_pdf('Plant Capacity'),
                  custom_Header_Text_Table_Pdf('${data[0]} kWp'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('3'),
                  custom_text_table_pdf('Location'),
                  custom_Header_Text_Table_Pdf('${data[34]}, ${data[36]}'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('4'),
                  custom_text_table_pdf('Project Cost in INR'),
                  // custom_selected_text('text')
                  Padding(
                      padding: const EdgeInsets.all(5),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '',
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Rs. ${NumberFormat.currency(
                                  locale: 'hi_IN',
                                  decimalDigits: 0,
                                  symbol: '',
                                ).format(data[13])} = ( @ Rs ${data[47]}/Watt) Exclusive Taxes',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    background: const BoxDecoration(
                                      color: PdfColors.yellow,
                                    ))),
                            TextSpan(
                              text:
                                  '\n Note: Cost of the project is Negotiable and fixed at the time of final discussion',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: PdfColors.red,
                                  decoration: TextDecoration.underline
                                  // background: const BoxDecoration(
                                  //   color: PdfColors.red,
                                  // ),
                                  ),
                            ),
                          ],
                        ),
                      )),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('5'),
                  custom_text_table_pdf('GST and SGST'),
                  custom_selected_text(
                    '@13.8% on project cost',
                  ),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('6'),
                  custom_text_table_pdf(
                      'Installation & Commissioning of 125 kWp SPV Power Plant'),
                  custom_text_table_pdf('Inclusive'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('7'),
                  custom_text_table_pdf('Net Metering'),
                  custom_selected_text(
                      'Net Metering approval chargesare Excluded as per TSNPDCL Rules'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('8'),
                  custom_text_table_pdf(
                      'Civil works footings etc.. if any at site'),
                  custom_selected_text('Excluded'),
                ]),
              ]),
          SizedBox(height: 6 * PdfPageFormat.cm),
          // TECHINCAL PARAMETERS
          Table(
              border: TableBorder.all(
                style: BorderStyle.solid,
                width: 1,
              ),
              // defaultColumnWidth: FixedColumnWidth(120.0),
              columnWidths: {
                0: const FractionColumnWidth(0.06),
                1: const FractionColumnWidth(.5),
                // 2: const FractionColumnWidth(.15),
                // 3: const FractionColumnWidth(.15),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  custom_Header_Text_Table_Pdf('S.No'),
                  custom_Header_Text_Table_Pdf('Technical Parameters'),
                ]),
              ]),
          //technical parameters
          Table(
              border: const TableBorder(
                left: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
                right: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
                bottom: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
                verticalInside: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
                horizontalInside: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              columnWidths: {
                0: const FractionColumnWidth(0.132),
                1: const FractionColumnWidth(.5),
                2: const FractionColumnWidth(.6),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  custom_text_table_pdf('1'),
                  custom_text_table_pdf('PV Array installed Capacity'),
                  custom_selected_text('${data[0]} KWp (for 335 Wp Modules)')
                ]),
                TableRow(children: [
                  custom_text_table_pdf('2'),
                  custom_text_table_pdf('PV Module Technology'),
                  custom_selected_text(
                      'Type: Si -Mono facial \nMake: Tier-I, 335 Wp, 46.21V')
                ]),
                TableRow(children: [
                  custom_text_table_pdf('3'),
                  custom_text_table_pdf('Module Capacity'),
                  custom_selected_text('335 Wp')
                ]),
                TableRow(children: [
                  custom_text_table_pdf('4'),
                  custom_text_table_pdf('No. of Modules'),
                  custom_selected_text('${data[4]} No\'s')
                ]),
                TableRow(children: [
                  custom_text_table_pdf('5'),
                  custom_text_table_pdf('Module Efficiency'),
                  custom_selected_text('17.60%')
                ]),
                TableRow(children: [
                  custom_text_table_pdf('6'),
                  custom_text_table_pdf('Solar Inverter Capacity'),
                  custom_selected_text(
                      '110 kVA AC Three Phase - 1 no\'s Make: Growatt/Solis/SunGrow')
                ]),
                TableRow(children: [
                  custom_text_table_pdf('7'),
                  custom_text_table_pdf('Inverter Efficiency'),
                  custom_selected_text('Maximum Efficiency of 98.5%')
                ]),
                TableRow(children: [
                  custom_text_table_pdf('8'),
                  custom_text_table_pdf(
                      'Total Energy Generation Expected per year Units '),
                  custom_selected_text('1,96,000 Units')
                ]),
                TableRow(children: [
                  custom_text_table_pdf('9'),
                  custom_text_table_pdf('Total Required Land Area in m2'),
                  custom_text_table_pdf(
                      'The sufficient Land area is available to accommodate the PV system at proposed site')
                ]),
                TableRow(children: [
                  custom_text_table_pdf('10'),
                  custom_text_table_pdf('Power Evacuation'),
                  custom_text_table_pdf(
                      'Up To LT panel 3-Ph,415 V nearer to Inverter')
                ]),
              ]),

          SizedBox(height: 1 * PdfPageFormat.cm),
          Table(
              border: TableBorder.all(
                style: BorderStyle.solid,
                width: 1,
              ),
              columnWidths: {
                0: const FractionColumnWidth(0.132),
                1: const FractionColumnWidth(.5),
                2: const FractionColumnWidth(.6),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  custom_Header_Text_Table_Pdf(
                      'Cost of the System / Total Price (INR)'),
                  // custom_selected_text('')

                  Padding(
                      padding: EdgeInsets.all(5),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            const TextSpan(
                              text: 'Price for',
                              style: TextStyle(fontSize: 12),
                            ),
                            TextSpan(
                                text: ' ${data[0]} KWp ',
                                style: TextStyle(
                                    background: const BoxDecoration(
                                        color: PdfColors.yellow),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            const TextSpan(
                              text: 'DC Solar PV Power System\n',
                              style: TextStyle(fontSize: 12),
                            ),
                            TextSpan(
                                text: 'Rs. ${NumberFormat.currency(
                                  locale: 'hi_IN',
                                  decimalDigits: 0,
                                  symbol: '',
                                ).format(data[13])}/-  (@ Rs ${data[47]}/Watt) \n+Tax amount = Rs Rs. ${NumberFormat.currency(
                                  locale: 'hi_IN',
                                  decimalDigits: 0,
                                  symbol: '',
                                ).format(data[10])} \n',
                                style: TextStyle(
                                    background: const BoxDecoration(
                                        color: PdfColors.yellow),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    '(GST @12% and Service & Duties @18% Avg of both @13.8%)',
                                style: TextStyle(
                                    background: const BoxDecoration(
                                        color: PdfColors.yellow),
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold)),
                            const TextSpan(
                              text: '\n  \n',
                              style: TextStyle(fontSize: 12),
                            ),
                            TextSpan(
                                text:
                                    'Total Cost of the Project = Rs 68,28,000/-',
                                style: TextStyle(
                                    background: const BoxDecoration(
                                        color: PdfColors.yellow),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                          ]))),
                ]),
                TableRow(children: [
                  custom_Header_Text_Table_Pdf('Terms of Price'),
                  custom_text_table_pdf(
                      '• The above price is inclusive of Supply of material, Installation & Commissioning of 125 kWp DC Solar Power plant (Solar PV Modules, Inverters, Junction Boxes, LTDB\'s and Cables, Solar Array Mounting Structure and Electrical Accessories).'),
                ]),
                TableRow(children: [
                  custom_Header_Text_Table_Pdf('Payment Terms'),
                  custom_selected_text('')
                ]),
                TableRow(children: [
                  custom_Header_Text_Table_Pdf('Shipment Terms'),
                  custom_text_table_pdf(
                      'Project Site - ${data[34]}, ${data[36]}')
                ]),
                TableRow(children: [
                  custom_Header_Text_Table_Pdf(
                      'Project Warranty & Operational Maintenance'),
                  // custom_selected_text('• ')
                  Padding(
                      padding: const EdgeInsets.all(5),
                      child: RichText(
                          text: TextSpan(
                              text:
                                  '•	PV Modules cover 10 Years replaceable Warranty for manufacturing defects from the date of Supply with 25 years of performance warranty.\n•	Inverter covers 5 Years replaceable Warranty from the date of Supply. \n',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                              children: [
                            TextSpan(
                                text:
                                    '•	(Extendable warranty on Inverters is also available by extra payment it is an optional)\n',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal)),
                            TextSpan(
                                text:
                                    '•	The Standard O & M for 2 Years from the date of operation of plant is applicable on Solar PV Power plant. From 3nd year onwards paid O & M with nominal charges',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal)),
                          ]))),
                ]),
                TableRow(children: [
                  custom_Header_Text_Table_Pdf('Power Output Warranty'),
                  Padding(
                      padding: const EdgeInsets.all(5),
                      child: RichText(
                          text: TextSpan(
                              text: 'For Solar PV Modules:\n',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text:
                                    '•	90% Peak output warranty for first 10 Years.\n',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal)),
                            TextSpan(
                                text:
                                    '•	80% Peak power warranty for next 15 Years.',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal)),
                          ]))),
                ]),
                TableRow(children: [
                  custom_Header_Text_Table_Pdf('Certification for Modules'),
                  custom_text_table_pdf(
                      'IEC 61215:2016 certified \nIEC 61730:2016 certified')
                  // custom_selected_text('')
                ]),
                TableRow(children: [
                  custom_Header_Text_Table_Pdf('Net Metering'),
                  custom_selected_text(
                      'Net Metering (For - 11 KV) approvals & Charges are Excluded as per TSNPDCL.')
                ]),
              ]),
          Table(
              border: TableBorder.all(
                style: BorderStyle.solid,
                width: 1,
              ),
              columnWidths: {
                0: const FractionColumnWidth(0.132),
                1: const FractionColumnWidth(.5),
                2: const FractionColumnWidth(.6),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  custom_Header_Text_Table_Pdf('Delivery'),
                  custom_text_table_pdf(
                      '•	Kindly note that we will initiate the project after receipt of your valued orders advance payment and Feasibility Approval from TSNPDCL.\n•	The delivery period is 3 months from the date of receipt of your valued orders, advance payment, approvals from TSNPDCL and CEIG TG.')
                  // custom_selected_text('')
                ]),
              ]),
          SizedBox(height: 1 * PdfPageFormat.cm),
          company_bank_details(),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Text('Solar PV System Description:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Paragraph(
              text: solarPVSystemDescription,
              style: const TextStyle(fontSize: 12)),

          Paragraph(
              text: solarPVSystemDescriptionp2,
              style: const TextStyle(fontSize: 12)),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Align(
            alignment: Alignment.center,
            child: Image(solorEnergy,
                alignment: Alignment.center, height: 10 * PdfPageFormat.cm),
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Align(
              alignment: Alignment.center,
              child: Text(fig1, style: const TextStyle(fontSize: 12))),

          SizedBox(height: 1 * PdfPageFormat.cm),
          Align(
            alignment: Alignment.center,
            child: Image(gridConnectPic,
                alignment: Alignment.center, height: 10 * PdfPageFormat.cm),
          ),
          SizedBox(height: 0.2 * PdfPageFormat.cm),
          Align(
              alignment: Alignment.center,
              child: Text(fig2, style: const TextStyle(fontSize: 12))),

          SizedBox(height: 0.2 * PdfPageFormat.cm),
          Text('Module Specifications:',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          SizedBox(height: 0.2 * PdfPageFormat.cm),

          Table(
              border: TableBorder.all(
                style: BorderStyle.solid,
                width: 1,
              ),
              columnWidths: {
                0: const FractionColumnWidth(0.132),
                1: const FractionColumnWidth(.5),
                2: const FractionColumnWidth(.6),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  custom_Header_Text_Table_Pdf('S.No.'),
                  custom_Header_Text_Table_Pdf('Parameter'),
                  custom_Header_Text_Table_Pdf('Crystalline'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('1'),
                  custom_text_table_pdf('Maximum Power output at STC'),
                  custom_selected_text('335 Wp, 72 cut cells'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('2'),
                  custom_text_table_pdf('Power output Tolerance (Measurement)'),
                  custom_selected_text(' -0.3845/%0C  '),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('3'),
                  custom_text_table_pdf('Efficiency'),
                  custom_selected_text('17.61%'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('4'),
                  custom_text_table_pdf('Avg Annual Degradation'),
                  custom_selected_text('0.8%'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('5'),
                  custom_text_table_pdf('Maximum Operating Voltage (Volts)'),
                  custom_selected_text('1100 DC'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('6'),
                  custom_text_table_pdf('Voltage at Max. Power (Vmpp)'),
                  custom_selected_text('38.0 V'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('7'),
                  custom_text_table_pdf('Short Circuit Current (Isc)'),
                  custom_selected_text('11.12 A'),
                ]),
              ]),
          Table(
              border: TableBorder.all(
                style: BorderStyle.solid,
                width: 1,
              ),
              columnWidths: {
                0: const FractionColumnWidth(0.132),
                1: const FractionColumnWidth(.5),
                2: const FractionColumnWidth(.6),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  custom_text_table_pdf('8'),
                  custom_text_table_pdf('Current at Max. Power (Impp)'),
                  custom_selected_text('8.81 A'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('9'),
                  custom_text_table_pdf('Open Circuit Voltage (Voc)'),
                  custom_selected_text('49.61 V'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('10'),
                  custom_text_table_pdf('NOCT'),
                  custom_text_table_pdf('45 ± 2 0C @800 W/m2'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('11'),
                  custom_text_table_pdf('Module dimension (L * W) Thickness'),
                  custom_text_table_pdf('2284* 1137 *mm (+/-2)35 mm'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('12'),
                  custom_text_table_pdf(
                      'Temperature coefficient for power output'),
                  custom_text_table_pdf('-0.3845% /0C'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('13'),
                  custom_text_table_pdf('Type of connectors'),
                  custom_text_table_pdf('MC4 connectors'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('14'),
                  custom_text_table_pdf('Cable'),
                  custom_text_table_pdf('4 sq mm Copper'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('15'),
                  custom_text_table_pdf('Weight'),
                  custom_text_table_pdf('28.7 Kgs'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('16'),
                  custom_text_table_pdf('Reliability and safety certificates'),
                  custom_text_table_pdf('IEC 61215:2016 \nIEC 61730:2016'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf('17'),
                  custom_text_table_pdf(
                      'Module Performance Guarantee \n• At the end of 10 years \n• At the end of 25 years'),
                  custom_text_table_pdf('\n90% \n80%'),
                ]),
              ]),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text('Legal Terms',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Paragraph(text: legalTerms, style: const TextStyle(fontSize: 12)),
          RichText(
            text: TextSpan(
              text: 'The CUSTOMER for this report ',
              style: const TextStyle(fontSize: 12),
              children: <TextSpan>[
                TextSpan(
                    text:
                        ' ${data[34]}, ${data[36]}.The COMPANY for this report is ',
                    style: const TextStyle(fontSize: 12)),
                TextSpan(
                    text: 'Shubhitha S Energy Solutions Pvt Ltd, Warangal.',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text('For more details feel free to contact:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              )),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(contactPerson1,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Text(contactPerson2,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text('Executive Team:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              )),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(contactPerson3,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'Return of Investment (ROI)',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: PdfColors.red),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Table(
              border: TableBorder.all(
                style: BorderStyle.solid,
                width: 1,
              ),
              // defaultColumnWidth: FixedColumnWidth(120.0),
              columnWidths: {
                0: const FractionColumnWidth(.05),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'BENEFITS OF  ${data[0]} kWp ON GRID SOLAR PLANT',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: PdfColors.green500),
                      )),
                ]),
              ]),
          Table(
              border: TableBorder.all(
                style: BorderStyle.solid,
                width: 1,
              ),
              // defaultColumnWidth: FixedColumnWidth(120.0),
              columnWidths: {
                0: const FractionColumnWidth(.11),
                1: const FractionColumnWidth(.05),
                // 2: const FractionColumnWidth(.5),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  custom_text_table_pdf(
                      'Average power generated from 1 KWp/day'),
                  custom_text_table_pdf('= 4 Units'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf(
                      'For ${data[0]} kWp system (${data[0]} x 4))'),
                  custom_text_table_pdf('= ${data[37]} Units per day'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf(
                      'As per your power bill average unit cost price'),
                  custom_text_table_pdf(
                      ' = Rs 7.65 Ps\nEffc. from 1st April 2022)'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf(
                      'Monetary benefit per day (${data[37]} x $kPowerBillAverageUnitCostCommerical)'),
                  custom_text_table_pdf('= Rs ${data[43]}.00'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf(
                      'Monetary benefit per month (${data[43]} x 30)'),
                  custom_text_table_pdf('= Rs ${NumberFormat.currency(
                    locale: 'hi_IN',
                    decimalDigits: 0,
                    symbol: '',
                  ).format(data[44])}.00'),
                ]),
                TableRow(children: [
                  custom_text_table_pdf(
                      'Monetary benefit per month (${data[43]} x 365)'),
                  custom_text_table_pdf('= Rs ${NumberFormat.currency(
                    locale: 'hi_IN',
                    decimalDigits: 0,
                    symbol: '',
                  ).format(data[45])}.00'),
                ]),
              ]),

          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            'RETURN OF INVESTEMENT = Cost of Project/Benefit per Year',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: PdfColors.red),
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
                '= Rs ${NumberFormat.currency(
                  locale: 'hi_IN',
                  decimalDigits: 0,
                  symbol: '',
                ).format(data[13])} / ${NumberFormat.currency(
                  locale: 'hi_IN',
                  decimalDigits: 0,
                  symbol: '',
                ).format(data[45])} \n= ${data[46]} years',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  background: const BoxDecoration(
                    color: PdfColors.yellow,
                  ),
                )),
          ]),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            "**Life of the plant is 25 years.",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              background: const BoxDecoration(
                color: PdfColors.yellow,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 0.5 * PdfPageFormat.cm),
          Text(
            "**The Project Cost is approximately equal to One Year Electricity Bill.",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              background: const BoxDecoration(
                color: PdfColors.yellow,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Align(alignment: Alignment.center, child: Image(benfitsOfSolarPic)),
          SizedBox(height: 7 * PdfPageFormat.cm),
          Align(alignment: Alignment.center, child: Image(saveTheEarthPic)),
        ]),
  );
}

Widget _buildHeader(Context context, MemoryImage companyLogo) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image(companyLogo, width: 60, height: 45),
          SizedBox(width: 0.15 * PdfPageFormat.cm),
          Text("Shubhitha S",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(" Energy ",
              style: TextStyle(
                  color: PdfColors.yellow700,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          Text("Solutions Pvt Ltd",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(width: 1 * PdfPageFormat.cm),
        ]),
        Text("Brings Sun Energy at your service",
            style: TextStyle(
                fontSize: 15,
                color: PdfColors.yellow700,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 0.2 * PdfPageFormat.cm),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("CIN: $kCIN",
              style: const TextStyle(
                fontSize: 10,
              )),
          SizedBox(width: 1 * PdfPageFormat.cm),
          Text("GSTIN: $kGSTIN",
              style: const TextStyle(
                fontSize: 10,
              )),
        ]),
        SizedBox(height: 0.4 * PdfPageFormat.cm, child: Divider()),
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
        SizedBox(height: 0.4 * PdfPageFormat.cm, child: Divider()),
        Row(children: [
          Text("Shubhithas Energy Solutions Pvt Ltd.",
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

Widget _domestic(Context context) {
  final data = Get.arguments;
  return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        SizedBox(height: 0.5 * PdfPageFormat.cm),

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Quotation No: ',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          SizedBox(width: 1 * PdfPageFormat.cm),
          Text('Date: ${DateFormat.yMMMMd().format(DateTime.now())}',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        ]),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
//to data
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("To", style: const TextStyle(fontSize: 12)),
                    Text("${data[34]},", style: const TextStyle(fontSize: 12)),
                    Text("${data[36]}", style: const TextStyle(fontSize: 12)),
                    // Text("To", style: const TextStyle(fontSize: 12)),
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("To", style: const TextStyle(fontSize: 12)),
                  ])
            ]),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
        Text(
          'Sub: Grid Connected Solar PV Power Plant of ${data[0]} kWp Capacity with NetMetering System - Reg.',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
        SizedBox(
            width: double.infinity,
            child: Text(
              'Respected Sir,',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            )),
        SizedBox(height: 0.3 * PdfPageFormat.cm),
        Text(
            "As per our discussion, we are herewith submitting the lowest price Quotation for your kind perusal and consideration for Grid Connected Solar PV Power Plant of ${data[0]} kWp Capacity with Bidirectional Net-Metering system. ",
            style: const TextStyle(fontSize: 12)),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
        Table(
            border: TableBorder.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            // defaultColumnWidth: FixedColumnWidth(120.0),
            columnWidths: {
              0: const FractionColumnWidth(0.1),
              1: const FractionColumnWidth(.5),
              2: const FractionColumnWidth(.15),
              3: const FractionColumnWidth(.15),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                custom_Header_Text_Table_Pdf('Sr.No'),
                custom_Header_Text_Table_Pdf('Description'),
                custom_Header_Text_Table_Pdf('Quantity'),
                custom_Header_Text_Table_Pdf('Amount'),
              ]),
              TableRow(children: [
                custom_text_table_pdf('1'),
                custom_text_table_pdf(
                    'Solar Power Modules - 335 \nWp Make: RenewSys, \nModel: Poly Crystaline'),
                custom_text_table_pdf(' ${data[4]} No'),
                custom_text_table_pdf(''),
              ]),
              TableRow(children: [
                custom_text_table_pdf('2'),
                custom_text_table_pdf(
                    'Grid-Tie Inverter ${data[0]} KVA Capacity \nMake: Growatt/Polycab'),
                custom_text_table_pdf('1 No'),
                custom_text_table_pdf(''),
              ]),
              TableRow(children: [
                custom_text_table_pdf('3'),
                custom_text_table_pdf(
                    'Galvanized Structure, Cables (Polycab), Junction Boxes, Earthlings Kit and Lightening Arrester (LA).'),
                custom_text_table_pdf('1 set'),
                custom_text_table_pdf(''),
              ]),
              TableRow(children: [
                custom_text_table_pdf('4'),
                custom_text_table_pdf(
                    'Installation and Commissioning including civil works'),
                custom_text_table_pdf('Our scope'),
                custom_text_table_pdf(''),
              ]),
              TableRow(children: [
                custom_text_table_pdf('5'),
                custom_text_table_pdf('Transportation charges'),
                custom_text_table_pdf('Our scope'),
                custom_text_table_pdf(''),
              ]),
              TableRow(children: [
                custom_text_table_pdf('6'),
                custom_text_table_pdf('Document charges for net metering'),
                custom_text_table_pdf('Our scope'),
              ]),
            ]),
        Table(
            border: const TableBorder(
              left: BorderSide(
                width: 1,
                style: BorderStyle.solid,
              ),
              right: BorderSide(
                width: 1,
                style: BorderStyle.solid,
              ),
              bottom: BorderSide(
                width: 1,
                style: BorderStyle.solid,
              ),
              verticalInside: BorderSide(
                width: 1,
                style: BorderStyle.solid,
              ),
            ),

            // defaultColumnWidth: FixedColumnWidth(120.0),
            columnWidths: {
              0: const FractionColumnWidth(1),
              1: const FractionColumnWidth(.20),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                // Text(NumberFormat.simpleCurrency(
                //         locale: 'hi_IN', decimalDigits: 0)
                //     .format(data[13])),
                Text('Total Amount',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                custom_Header_Text_Table_Pdf('Rs. ${NumberFormat.currency(
                  locale: 'hi_IN',
                  decimalDigits: 0,
                  symbol: '',
                ).format(data[13])}\nGST 13.8%')
              ])
            ]),
        SizedBox(height: 0.2 * PdfPageFormat.cm),
        RichText(
            text: TextSpan(
          text: '(Rupees in words: ',
          style: const TextStyle(color: PdfColors.black, fontSize: 12),
          children: <TextSpan>[
            TextSpan(
                text: NumberToWord().convert('en-in', data[13]).toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            const TextSpan(text: ' only)', style: TextStyle(fontSize: 12)),
          ],
        )),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
        // Text(
        //     'We are pleased to offer the above system at the price of Rs. 1,50,000/- (Rupees One Lakh Fifty Thousand only) inclusive of GST 18% and all other taxes.',
        //     style: const TextStyle(fontSize: 12)),
        Text('NOTE:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        SizedBox(height: 0.3 * PdfPageFormat.cm),
        Text(
            '1.	Net Meter charges (Rs. 2950/- ) are also included to be paid to local DISCOM.\n2.	The cost of the project may raise if we go for high raised structure depends on available site at project location.\n3.	The price offered is after Subsidy only.\n4.	Subject to Net Meter availability in the store, installation will take place from the office of ADE/AE -TSSPDCL.\n5.	Standard O&M is free for first one year there after it will be paid with nominal charges.\n6. 6.	Any service issues will be attended by our service team within 24 hours for local and 48 hours for non local.',
            style: const TextStyle(fontSize: 12)),

        SizedBox(height: 0.5 * PdfPageFormat.cm),

        Text('Terms and Conditions:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        SizedBox(height: 0.3 * PdfPageFormat.cm),
        Table(
            border: TableBorder.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            // defaultColumnWidth: FixedColumnWidth(120.0),
            columnWidths: {
              0: const FractionColumnWidth(.05),
              1: const FractionColumnWidth(.15),
              2: const FractionColumnWidth(.5),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                custom_text_table_pdf('1'),
                custom_Header_Text_Table_Pdf('Taxes/Duties:'),
                custom_text_table_pdf('Included in the total project cost'),
              ]),
              TableRow(children: [
                custom_text_table_pdf('2'),
                custom_Header_Text_Table_Pdf('Warrantee:'),
                custom_text_table_pdf(
                    '1.	5 Years for system which includes module mounting structure, cables. \n2.	10 years for panel against manufacturing defects with 25 Years on performance of PV Modules \n3.	Inverter covers 5 years replaceable warranty, it may extendable with additional payment.'),
              ]),
              TableRow(children: [
                custom_text_table_pdf('3'),
                custom_Header_Text_Table_Pdf('Payment terms:'),
                custom_text_table_pdf(
                    '50% Advance along with the Purchase Order (P.O)\n30% After getting feasibility approval from TSNPDCL \n20% amount will be paid during commissioning/completion of project '),
              ]),
              TableRow(children: [
                custom_text_table_pdf('4'),
                custom_Header_Text_Table_Pdf('Delivery& Installation:'),
                custom_text_table_pdf(
                    'One month from the date of clear P.O. & Advance Payment.'),
              ]),
              TableRow(children: [
                custom_text_table_pdf('5'),
                custom_Header_Text_Table_Pdf('Validity of Quotation'),
                custom_text_table_pdf(
                    'One week from the offer date.\n(Price of modules, inverter, cables, and structure varying in global market by weekly)'),
              ]),
              TableRow(children: [
                custom_text_table_pdf('6'),
                custom_Header_Text_Table_Pdf('Additional Works'),
                custom_text_table_pdf(
                    'Increase in Contract Demand and Structure rise are in customer scope'),
              ]),
            ]),
        SizedBox(height: 1 * PdfPageFormat.cm),

        Table(
            border: TableBorder.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            // defaultColumnWidth: FixedColumnWidth(120.0),
            columnWidths: {
              0: const FractionColumnWidth(.05),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'BENEFITS OF  ${data[0]} kWp ON GRID SOLAR PLANT',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: PdfColors.green500),
                    )),
              ]),
            ]),
        Table(
            border: TableBorder.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            // defaultColumnWidth: FixedColumnWidth(120.0),
            columnWidths: {
              0: const FractionColumnWidth(.15),
              1: const FractionColumnWidth(.05),
              // 2: const FractionColumnWidth(.5),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                custom_text_table_pdf('Average power generated from 1 KWp/day'),
                custom_text_table_pdf('= 4 Units'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(
                    'For ${data[0]} kWp system (${data[0]} x 4))'),
                custom_text_table_pdf('= ${data[37]} Units per day'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(
                    'As per your power bill average unit cost price'),
                custom_text_table_pdf(' = Rs 9.00 Ps\n(w.e.f. 01.04.2022)'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(
                    'Monetary benefit per day (${data[37]} x 9.00)'),
                custom_text_table_pdf('= Rs ${data[38]}.00'),
              ]),
              TableRow(children: [
                custom_text_table_pdf(
                    'Monetary benefit per month (${data[38]} x 30)'),
                custom_text_table_pdf('= Rs ${NumberFormat.currency(
                  locale: 'hi_IN',
                  decimalDigits: 0,
                  symbol: '',
                ).format(data[39])}.00'),
              ]),
            ]),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Table(
            border: TableBorder.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            columnWidths: {
              0: const FractionColumnWidth(.05),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                custom_Header_Text_Table_Pdf("Bank Details"),
              ]),
            ]),
        company_bank_details(),

        SizedBox(height: 1.5 * PdfPageFormat.cm),

        Text(
          'Feel free to contact us for further clarifications and negotiations.',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2 * PdfPageFormat.cm),

        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  'Director\n\nFor Shubhitha S Energy Solutions Pvt Ltd\nWarangal\n+91 8555834486',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right),
            ]),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Text(
          'Return of Investment (ROI)',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
        Table(
            border: TableBorder.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            columnWidths: {
              0: const FractionColumnWidth(.05),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                custom_Header_Text_Table_Pdf(
                    'Project capacity = ${data[0]} kWp '),
              ])
            ]),
        Table(
            border: TableBorder.all(
              style: BorderStyle.solid,
              width: 1,
            ),
            // defaultColumnWidth: FixedColumnWidth(120.0),
            columnWidths: {
              0: const FractionColumnWidth(.15),
              1: const FractionColumnWidth(.10),
              // 2: const FractionColumnWidth(.5),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                custom_text_table_pdf(
                    'Energy generation in units (1unit=1 kWh) '),
                custom_text_table_pdf('= 4 units/KWp/day')
              ]),
              TableRow(children: [
                custom_text_table_pdf(
                    'Average units generation on ${data[0]} kWp'),
                custom_text_table_pdf(
                    '= ${data[0]} * 4 = ${data[37]} units/day')
              ]),
              TableRow(children: [
                custom_text_table_pdf('Average units generation per year'),
                custom_text_table_pdf(
                    '= ${data[37]}*365 = ${NumberFormat.currency(
                  locale: 'hi_IN',
                  decimalDigits: 0,
                  symbol: '',
                ).format(data[40])}.00 units')
              ]),
              TableRow(children: [
                custom_text_table_pdf('Present day per unit cost residential'),
                custom_text_table_pdf(
                    '= Rs 9.00 ps \n(As per new tariff w.e.f   01.04.2022)')
              ]),
              TableRow(children: [
                custom_text_table_pdf(
                    'Savings per year with ${data[0]} kWp Solar power plant'),
                custom_text_table_pdf('= ${NumberFormat.currency(
                  locale: 'hi_IN',
                  decimalDigits: 0,
                  symbol: '',
                ).format(data[40])}.00*9.00 =  Rs ${NumberFormat.currency(
                  locale: 'hi_IN',
                  decimalDigits: 0,
                  symbol: '',
                ).format(data[41])}.00/-')
              ]),
              TableRow(children: [
                custom_Header_Text_Table_Pdf(
                    'Total Project Cost (including GST @13.8%)'),
                // custom_text_table_pdf(
                //     'Total Project Cost (including GST @13.8%)'),
                custom_text_table_pdf('= Rs ${NumberFormat.currency(
                  locale: 'hi_IN',
                  decimalDigits: 0,
                  symbol: '',
                ).format(data[13])}')
              ]),
            ]),
        SizedBox(height: 1 * PdfPageFormat.cm),

        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Return of Investment (ROI) = ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )),
          Text('Total project cost/Saving per year ',
              style: const TextStyle(fontSize: 12)),
        ]),

        SizedBox(height: 0.5 * PdfPageFormat.cm),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              '= Rs ${NumberFormat.currency(
                locale: 'hi_IN',
                decimalDigits: 0,
                symbol: '',
              ).format(data[13])} / ${NumberFormat.currency(
                locale: 'hi_IN',
                decimalDigits: 0,
                symbol: '',
              ).format(data[41])} = ${data[42]} years',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                background: const BoxDecoration(
                  color: PdfColors.yellow,
                ),
              )),
        ]),
        SizedBox(height: 0.5 * PdfPageFormat.cm),
        Text(
          "**Life of the plant is 25 years.",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            background: const BoxDecoration(
              color: PdfColors.yellow,
            ),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '***',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ]),
      ]));
}

Table company_bank_details() {
  return Table(
      border: TableBorder.all(
        style: BorderStyle.solid,
        width: 1,
      ),
      columnWidths: {
        0: const FractionColumnWidth(.05),
        1: const FractionColumnWidth(.15),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          custom_text_table_pdf('Beneficiary Name'),
          custom_text_table_pdf('M/s Shubhitha S Energy Solutions Pvt Ltd'),
        ]),
        TableRow(children: [
          custom_text_table_pdf('Bank Name & Address'),
          custom_text_table_pdf('PNB, L.B. Nagar, Warangal'),
        ]),
        TableRow(children: [
          custom_text_table_pdf('Account Number'),
          custom_text_table_pdf('1577202100000081'),
        ]),
        TableRow(children: [
          custom_text_table_pdf('IFSC Code'),
          custom_text_table_pdf('PUNB0157720'),
        ]),
        TableRow(children: [
          custom_text_table_pdf('Type of Account'),
          custom_text_table_pdf('Current Account'),
        ]),
        TableRow(children: [
          custom_text_table_pdf('E-Mail ID'),
          custom_text_table_pdf('shubhithasenergysolutions@gmail.com'),
        ]),
      ]);
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
                  style: const TextStyle(
                    fontSize: 25,
                  )),
              SizedBox(width: 1 * PdfPageFormat.cm),
            ]),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Text('${data[0]} kWp Grid Interacted Rooftop Solar PV System',
            style: const TextStyle(fontSize: 20)),
        SizedBox(height: 1 * PdfPageFormat.cm),
        Text(DateFormat.yMMMd().format(DateTime.now()),
            style: const TextStyle(
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
                Text('Name: ${data[34]} ',
                    style: const TextStyle(fontSize: 15)),
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
          columnWidths: {0: const FractionColumnWidth(.1)},
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
            defaultColumnWidth: const FixedColumnWidth(120.0),
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
            defaultColumnWidth: const FixedColumnWidth(120.0),
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

Padding custom_Header_Text_Table_Pdf(String text) => Padding(
    padding: const EdgeInsets.all(5),
    child: Text(text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)));

Padding custom_selected_text(String text) => Padding(
      padding: const EdgeInsets.all(5),
      child: Text(text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            background: const BoxDecoration(
              color: PdfColors.yellow,
            ),
          )),
    );

Future<PageTheme> _myPageTheme(PdfPageFormat format) async {
  // final bgShape = await rootBundle
  //     .loadString('assets/images/splash-screen/APP_LOGO_ROW.png');
  // final companyLogo = MemoryImage(
  //   (await rootBundle.load('assets/images/splash-screen/APP_LOGO_ROW.png'))
  //       .buffer
  //       .asUint8List(),
  // );

  // final image = MemoryImage(
  //   File('assets/images/splash-screen/APP_LOGO_ROW.png').readAsBytesSync(),
  // );

  final BKMNOS = await rootBundle.load("assets/fonts/BKMNOS.ttf");
  final BOOKOS = await rootBundle.load("assets/fonts/BOOKOS.TTF");
  final BOOKOSB = await rootBundle.load("assets/fonts/BOOKOSB.TTF");

  // final Uint8List fontData = File('assets/fonts/BKMNOS.ttf').readAsBytesSync();

  // final ttf = Font.ttf(fontData.buffer.asByteData());

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return PageTheme(
    pageFormat: format,
    theme: ThemeData.withFont(
      base: Font.ttf(BKMNOS),
      // bold: Font.ttf(BOOKOSB),
      italic: Font.ttf(BOOKOS),
      bold: await PdfGoogleFonts.openSansBold(),
      // icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (Context context) {
      return FullPage(
          ignoreMargins: true,
          child:
              // Stack(
              //   children: [
              //     Positioned(
              //       // child: SvgImage(svg: bgShape),
              //       child: Image(companyLogo),
              //       left: 0,
              //       top: 0,
              //     ),
              //     Positioned(
              //       child: Transform.rotate(angle: pi, child: SvgImage(svg: bgShape)),
              //       right: 0,
              //       bottom: 0,
              //     ),
              //   ],
              // ),

              Column(children: [
            // Image(image),
          ]));
    },
  );
}
