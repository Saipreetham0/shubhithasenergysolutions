import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/quotations_screen/widgets/bill_table.dart';

import 'package:shubhithasenergysolutions/scr/features/pdf_new/pdfGenrator.dart';

class pdfGenerator extends StatefulWidget {
  const pdfGenerator({super.key});

  @override
  State<pdfGenerator> createState() => _pdfGeneratorState();
}

//solar module data
int a = 335;
int b = 535;
int c = 540;

// Number of Modules

int noOfModulesA = 0;
int noOfModulesB = 0;
int noOfModulesC = 0;

//Inverter

int inverter = 0;

// Bill

var systemPrice = 0;
var subsidyPrice = 0;
var postSubsidyPrice = 0;
var Gst = 0;
var NetMeterFee = 0;
var SubsidyApplicationFee = 0;
var costToCustomer = 0;

// energy
var energyGeneratedpermonth = 0;
var energyGeneratedperyear = 0;
var energyGeneratedforlifetime = 0;

// payback period
var paybackPeriod = 0;

class _pdfGeneratorState extends State<pdfGenerator> {
  @override
  Widget build(BuildContext context) {
    var kW = Get.arguments;
    print("$kW");
    return Scaffold(
      appBar: AppBar(
        title: Text("Quote for ${Get.arguments} kW"),
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Quote for ${Get.arguments} kW",
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(height: 10),
              Text(
                "Project Summary",
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 10),
              Table(
                columnWidths: {0: FractionColumnWidth(.4)},
                textDirection: TextDirection.ltr,
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                // defaultColumnWidth: FixedColumnWidth(120.0),
                border: TableBorder.all(
                    color: Theme.of(context).iconTheme.color!,
                    style: BorderStyle.solid,
                    width: 1),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('System Size(kW)',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ]),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${Get.arguments}',
                            style: Theme.of(context).textTheme.headline6),
                      )
                    ]),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('',
                            style: Theme.of(context).textTheme.headline6),
                      )
                    ]),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('',
                              style: Theme.of(context).textTheme.headline6),
                        )
                      ],
                    ),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Solar Module Rating (Wp)',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ]),
                    Column(children: [
                      Text('$a', style: Theme.of(context).textTheme.headline6)
                    ]),
                    Column(children: [
                      Text('$b', style: Theme.of(context).textTheme.headline6)
                    ]),
                    Column(children: [
                      Text('$c', style: Theme.of(context).textTheme.headline6)
                    ]),
                  ]),

                  //
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Number of Modules',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ]),
                    Column(children: [
                      Text('$noOfModulesA',
                          style: Theme.of(context).textTheme.headline6)
                    ]),
                    Column(children: [
                      Text(
                        '$noOfModulesB',
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ]),
                    Column(children: [
                      Text(
                        '$noOfModulesC',
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Inverter (kVA)',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ]),
                    Column(children: [
                      Text('$inverter',
                          style: Theme.of(context).textTheme.headline6)
                    ]),
                    Column(children: [Text('')]),
                    Column(children: [Text('')]),
                  ]),
                  TableRow(children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Battery',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ]),
                    Column(children: [
                      Text('NA', style: Theme.of(context).textTheme.headline6)
                    ]),
                    Column(children: [
                      Text(
                        '',
                      )
                    ]),
                    Column(children: [
                      Text(
                        '',
                      )
                    ]),
                  ]),
                ],
              ),

              const SizedBox(height: 10),
              Text(
                "Bill Details",
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 10),

              //bill table

              Table(
                  textDirection: TextDirection.ltr,
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(
                      color: Theme.of(context).iconTheme.color!,
                      style: BorderStyle.solid,
                      width: 1),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tSystemPrice,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ]),
                      Column(children: [
                        Text('Rs. $systemPrice',
                            style: Theme.of(context).textTheme.headline6)
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tSubsidy,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ]),
                      Column(children: [
                        Text('Rs. $subsidyPrice',
                            style: Theme.of(context).textTheme.headline6)
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tPostSubsidyRate,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ]),
                      Column(children: [
                        Text('Rs. $postSubsidyPrice',
                            style: Theme.of(context).textTheme.headline6)
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tGst,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Rs. $Gst',
                              style: Theme.of(context).textTheme.headline6),
                        )
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tNetMeterFee,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ]),
                      Column(children: [
                        Text('Rs. $NetMeterFee',
                            style: Theme.of(context).textTheme.headline6)
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tSubsidyApplicationFee,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ]),
                      Column(children: [
                        Text('Rs. $SubsidyApplicationFee',
                            style: Theme.of(context).textTheme.headline6)
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tCostToCustomer,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ]),
                      Column(children: [
                        Text('Rs. $costToCustomer',
                            style: Theme.of(context).textTheme.headline6)
                      ]),
                    ]),
                  ]),

              const SizedBox(height: 10),
              Text(tEnergyGenerated,
                  style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 10),

              Table(
                  textDirection: TextDirection.ltr,
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(
                    color: Theme.of(context).iconTheme.color!,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tEnergyGeneratedPerMonth,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$energyGeneratedpermonth',
                              style: Theme.of(context).textTheme.headline6),
                        )
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tEnergyGeneratedPerYear,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$energyGeneratedperyear',
                              style: Theme.of(context).textTheme.headline6),
                        )
                      ]),
                    ]),
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tEnergyGeneratedForLifetime,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$energyGeneratedforlifetime',
                              style: Theme.of(context).textTheme.headline6),
                        )
                      ]),
                    ]),
                  ]),

              //
              const SizedBox(height: 10),
              Text(tReturnOnInvestment,
                  style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 10),

              Table(
                  textDirection: TextDirection.ltr,
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(
                      color: Theme.of(context).iconTheme.color!,
                      style: BorderStyle.solid,
                      width: 1),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tPaybackPeriod,
                              style: Theme.of(context).textTheme.headline6),
                        ),
                      ]),
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('$paybackPeriod',
                              style: Theme.of(context).textTheme.headline6),
                        )
                      ]),
                    ]),
                  ]),
              const SizedBox(height: 10),
              Text(tEnergyProduction,
                  style: Theme.of(context).textTheme.headline4),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
