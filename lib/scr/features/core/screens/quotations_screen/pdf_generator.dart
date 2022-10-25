import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'package:pdf/pdf.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/quotations_screen/widgets/custom_text_table_widget.dart';

import 'package:shubhithasenergysolutions/scr/features/pdf_new/pdfGenrator.dart';

class pdfGenerator extends StatefulWidget {
  const pdfGenerator({super.key});

  @override
  State<pdfGenerator> createState() => _pdfGeneratorState();
}

class _pdfGeneratorState extends State<pdfGenerator> {
  var noOfModulesA;
  var noOfModulesB;
  var noOfModulesC;

  // Bill

  var systemPrice = 0;
  var subsidyPrice = 0;
  var postSubsidyPrice = 0;
  var Gst = 0;
  var NetMeterFee = 2950;
  var SubsidyApplicationFee = 0;
  var costToCustomer = 0;

  // energy
  var energyGeneratedpermonth = 0;
  var energyGeneratedperyear = 0;
  var energyGeneratedforlifetime = 0;

// Energy Savings
  var monthlyElectricityBillSaving = 0;
  var yearlyElectricityBillSaving = 0;

  // payback period
  var paybackPeriod = 10;
//
  var aEP1 = 0;
  var aEP2 = 0;
  var aEP3 = 0;
  var aEP4 = 0;
  var aEP5 = 0;
  var aEP6 = 0;
  var aEP7 = 0;

  var aS1 = 0;
  var aS2 = 0;
  var aS3 = 0;
  var aS4 = 0;
  var aS5 = 0;
  var aS6 = 0;
  var aS7 = 0;

  //intializing the variables and screen
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var kW = Get.arguments;
    _solarModuleRating();
    _billDetails();
    _energyGenerated();
    _energySavings();
    _returnOnInvestment();
    _annualEnergyProduction();
  }

  void _solarModuleRating() {
    var kW = Get.arguments;
    int a = 335;
    int b = 535;
    int c = 540;

    Parser p = Parser();
    Expression exp = p.parse('$kW * 1000 / $a');
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    noOfModulesA = eval.toDouble().round();

    Parser p1 = Parser();
    Expression exp1 = p1.parse('$kW * 1000 / $b');
    ContextModel cm1 = ContextModel();
    double eval1 = exp1.evaluate(EvaluationType.REAL, cm);
    noOfModulesB = eval1.toDouble().round();

    Parser p2 = Parser();
    Expression exp2 = p2.parse('$kW * 1000 / $c');
    ContextModel cm2 = ContextModel();
    double eval2 = exp2.evaluate(EvaluationType.REAL, cm);
    noOfModulesC = eval2.toDouble().round();
  }

  void _billDetails() {
    var kW = Get.arguments;

    //system price calculation
    Parser p = Parser();
    Expression exp = p.parse('($kW * 1000) * 54');
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    systemPrice = eval.toDouble().toInt();

    // if (kW == 1 || kW == 2 || kW == 3) {
    if (kW <= 3) {
      Parser p1 = Parser();
      Expression exp1 = p1.parse('48000 * $kW* 0.4');
      ContextModel cm1 = ContextModel();
      double eval1 = exp1.evaluate(EvaluationType.REAL, cm);
      subsidyPrice = eval1.toDouble().toInt();
    } else {
      Parser p1 = Parser();
      Expression exp1 = p1.parse('48000 * $kW* 0.2');
      ContextModel cm1 = ContextModel();
      double eval1 = exp1.evaluate(EvaluationType.REAL, cm);
      subsidyPrice = eval1.toDouble().toInt();
    }

    //subsidy price

    //post subsidy price
    postSubsidyPrice = systemPrice - subsidyPrice;

    //Gst calculation
    Parser p2 = Parser();
    Expression exp2 = p2.parse('($kW * 1000) * 54 * 0.138');
    ContextModel cm2 = ContextModel();
    double eval2 = exp2.evaluate(EvaluationType.REAL, cm);
    Gst = eval2.toDouble().toInt();

    //Subsidy Application Fee calculation
    Parser p3 = Parser();
    Expression exp3 = p3.parse('($kW * 1000) +(0.12 * $kW * 1000) +200 ');
    ContextModel cm3 = ContextModel();
    double eval3 = exp3.evaluate(EvaluationType.REAL, cm);
    SubsidyApplicationFee = eval3.toDouble().toInt();

    //cost to customer calculation
    costToCustomer =
        postSubsidyPrice + Gst + NetMeterFee + SubsidyApplicationFee;
  }

  void _energyGenerated() {
    var kW = Get.arguments;
    //energy generated per month calculation
    Parser p = Parser();
    Expression exp = p.parse('$kW * 4 * 30 ');
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    energyGeneratedpermonth = eval.toDouble().toInt();

    //energy generated per year calculation
    Parser p1 = Parser();
    Expression exp1 = p1.parse('$kW * 4 * 365');
    ContextModel cm1 = ContextModel();
    double eval1 = exp1.evaluate(EvaluationType.REAL, cm);
    energyGeneratedperyear = eval1.toDouble().toInt();

    //energy generated for lifetime calculation
    Parser p2 = Parser();
    Expression exp2 = p2.parse('$kW * 4 * 365 * 25');
    ContextModel cm2 = ContextModel();
    double eval2 = exp2.evaluate(EvaluationType.REAL, cm);
    energyGeneratedforlifetime = eval2.toDouble().toInt();
  }

  void _energySavings() {
    var kW = Get.arguments;
    //monthly electricity bill saving calculation
    Parser p = Parser();
    Expression exp = p.parse('$kW * 4 * 30 * 8.5');
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    monthlyElectricityBillSaving = eval.toDouble().toInt();

    //yearly electricity bill saving calculation
    Parser p1 = Parser();
    Expression exp1 = p1.parse('$kW * 4 * 365 * 8.5');
    ContextModel cm1 = ContextModel();
    double eval1 = exp1.evaluate(EvaluationType.REAL, cm);
    yearlyElectricityBillSaving = eval1.toDouble().toInt();
  }

  void _returnOnInvestment() {
    var kW = Get.arguments;
    //payback period calculation
    Parser p = Parser();
    Expression exp = p.parse(
        '($costToCustomer + $subsidyPrice)/$yearlyElectricityBillSaving');
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    paybackPeriod = eval.toDouble().toInt();
  }

  void _annualEnergyProduction() {
    var kW = Get.arguments;
    //annual energy production calculation
    Parser p = Parser();
    Expression exp = p.parse('$kW * 4 * 365');
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    aEP1 = eval.toDouble().round();

    Parser p1 = Parser();
    Expression exp1 = p1.parse('$aEP1 - (($aEP1 * 0.8)/100)');
    ContextModel cm1 = ContextModel();
    double eval1 = exp1.evaluate(EvaluationType.REAL, cm);
    aEP2 = eval1.toDouble().round();

    Parser p2 = Parser();
    Expression exp2 = p2.parse('$aEP2 - (($aEP2 * 0.8)/100)');
    ContextModel cm2 = ContextModel();
    double eval2 = exp2.evaluate(EvaluationType.REAL, cm);
    aEP3 = eval2.toDouble().round();

    Parser p3 = Parser();
    Expression exp3 = p3.parse('$aEP3 - (($aEP3 * 0.8)/100)');
    ContextModel cm3 = ContextModel();
    double eval3 = exp3.evaluate(EvaluationType.REAL, cm);
    aEP4 = eval3.toDouble().round();

    Parser p4 = Parser();
    Expression exp4 = p4.parse('$aEP4 - (($aEP4 * 0.8)/100)');
    ContextModel cm4 = ContextModel();
    double eval4 = exp4.evaluate(EvaluationType.REAL, cm);
    aEP5 = eval4.toDouble().round();

    Parser p5 = Parser();
    Expression exp5 = p5.parse('$aEP4 - (($aEP4 * 0.8)/100)');
    ContextModel cm5 = ContextModel();
    double eval5 = exp5.evaluate(EvaluationType.REAL, cm);
    aEP6 = eval5.toDouble().round();

    Parser p6 = Parser();
    Expression exp6 = p6.parse('$aEP5 * 5');
    ContextModel cm6 = ContextModel();
    double eval6 = exp6.evaluate(EvaluationType.REAL, cm);
    aEP6 = eval6.toDouble().round();

    Parser p7 = Parser();
    Expression exp7 = p7.parse('$aEP5 * 15');
    ContextModel cm7 = ContextModel();
    double eval7 = exp7.evaluate(EvaluationType.REAL, cm);
    aEP7 = eval7.toDouble().round();

    //annual energy production calculation

    Parser pas1 = Parser();
    Expression expas1 = pas1.parse('$aEP1 * 8.5');
    ContextModel cmas1 = ContextModel();
    double evalas1 = expas1.evaluate(EvaluationType.REAL, cm);
    aS1 = evalas1.toDouble().round();

    Parser pas2 = Parser();
    Expression expas2 = pas2.parse('$aEP2 * 8.5');
    ContextModel cmas2 = ContextModel();
    double evalas2 = expas2.evaluate(EvaluationType.REAL, cm);
    aS2 = evalas2.toDouble().round();

    Parser pas3 = Parser();
    Expression expas3 = pas3.parse('$aEP3 * 8.5');
    ContextModel cmas3 = ContextModel();
    double evalas3 = expas3.evaluate(EvaluationType.REAL, cm);
    aS3 = evalas3.toDouble().round();

    Parser pas4 = Parser();
    Expression expas4 = pas4.parse('$aEP4 * 8.5');
    ContextModel cmas4 = ContextModel();
    double evalas4 = expas4.evaluate(EvaluationType.REAL, cm);
    aS4 = evalas4.toDouble().round();

    Parser pas5 = Parser();
    Expression expas5 = pas5.parse('$aEP5 * 8.5');
    ContextModel cmas5 = ContextModel();
    double evalas5 = expas5.evaluate(EvaluationType.REAL, cm);
    aS5 = evalas5.toDouble().round();

    Parser pas6 = Parser();
    Expression expas6 = pas6.parse('$aEP6 * 10');
    ContextModel cmas6 = ContextModel();
    double evalas6 = expas6.evaluate(EvaluationType.REAL, cm);
    aS6 = evalas6.toDouble().round();

    Parser pas7 = Parser();
    Expression expas7 = pas7.parse('$aEP7 * 12.5');
    ContextModel cmas7 = ContextModel();
    double evalas7 = expas7.evaluate(EvaluationType.REAL, cm);
    aS7 = evalas7.toDouble().round();
  }

  @override
  Widget build(BuildContext context) {
    var kW = Get.arguments;

    //solar module data
    int a = 335;
    int b = 535;
    int c = 540;

//Inverter

    var inverter = kW;

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
                    custom_text_table_widget(text: tSystemSize),
                    custom_text_table_widget(text: '${Get.arguments}'),
                    custom_text_table_widget(text: ''),
                    custom_text_table_widget(text: ''),
                  ]),
                  TableRow(children: [
                    custom_text_table_widget(text: tSolarModuleRating),
                    custom_text_table_widget(text: '$a'),
                    custom_text_table_widget(text: '$b'),
                    custom_text_table_widget(text: '$c'),
                  ]),

                  //
                  TableRow(children: [
                    custom_text_table_widget(text: tNumberOfModules),
                    custom_text_table_widget(text: '$noOfModulesA'),
                    custom_text_table_widget(text: '$noOfModulesB'),
                    custom_text_table_widget(text: '$noOfModulesC'),
                  ]),
                  TableRow(children: [
                    custom_text_table_widget(text: tNumberOfInverters),
                    custom_text_table_widget(text: '$inverter'),
                    custom_text_table_widget(text: ''),
                    custom_text_table_widget(text: ''),
                  ]),
                  TableRow(children: [
                    custom_text_table_widget(text: tNumberOfBatteries),
                    custom_text_table_widget(text: 'NA'),
                    custom_text_table_widget(text: ''),
                    custom_text_table_widget(text: ''),
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
                      custom_text_table_widget(text: tSystemPrice),
                      custom_text_table_widget(text: 'Rs. $systemPrice'),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: tSubsidy),
                      custom_text_table_widget(text: 'Rs. $subsidyPrice'),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: tPostSubsidyRate),
                      custom_text_table_widget(text: 'Rs. $postSubsidyPrice'),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: tGst),
                      custom_text_table_widget(text: 'Rs. $Gst'),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: tNetMeterFee),
                      custom_text_table_widget(text: 'Rs. $NetMeterFee'),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: tSubsidyApplicationFee),
                      custom_text_table_widget(
                          text: 'Rs. $SubsidyApplicationFee'),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: tCostToCustomer),
                      custom_text_table_widget(text: 'Rs. $costToCustomer'),
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
                      custom_text_table_widget(text: tEnergyGeneratedPerMonth),
                      custom_text_table_widget(text: energyGeneratedpermonth),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: tEnergyGeneratedPerYear),
                      custom_text_table_widget(text: energyGeneratedperyear),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(
                          text: tEnergyGeneratedForLifetime),
                      custom_text_table_widget(
                          text: energyGeneratedforlifetime),
                    ]),
                  ]),

              const SizedBox(height: 10),

              Text(tEnergySaving, style: Theme.of(context).textTheme.headline4),

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
                      custom_text_table_widget(
                          text: tMonthlyElectricityBillSaving),
                      custom_text_table_widget(
                          text: 'Rs. $monthlyElectricityBillSaving'),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(
                          text: tYearlyElectricityBillSaving),
                      custom_text_table_widget(
                          text: 'Rs. $yearlyElectricityBillSaving'),
                    ]),
                  ]),

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
                      custom_text_table_widget(text: tPaybackPeriod),
                      custom_text_table_widget(text: paybackPeriod),
                    ]),
                  ]),
              const SizedBox(height: 10),
              Text(tEnergyProduction,
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
                    // table column headings

                    TableRow(children: [
                      custom_text_table_widget(text: ""),
                      custom_text_table_widget(text: tAnnualEnergyProduction),
                      custom_text_table_widget(text: tAnnualCostSavings),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: "Year 1"),
                      custom_text_table_widget(text: "$aEP1"),
                      custom_text_table_widget(text: "$aS1"),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: "Year 2"),
                      custom_text_table_widget(text: "$aEP2"),
                      custom_text_table_widget(text: "$aS2"),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: "Year 3"),
                      custom_text_table_widget(text: "$aEP3"),
                      custom_text_table_widget(text: "$aS3"),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: "Year 4"),
                      custom_text_table_widget(text: "$aEP4"),
                      custom_text_table_widget(text: "$aS4"),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: "Year 5"),
                      custom_text_table_widget(text: "$aEP5"),
                      custom_text_table_widget(text: "$aS5"),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: "Year 6-10"),
                      custom_text_table_widget(text: "$aEP6"),
                      custom_text_table_widget(text: "$aS6"),
                    ]),
                    TableRow(children: [
                      custom_text_table_widget(text: "Year 11-25"),
                      custom_text_table_widget(text: "$aEP7"),
                      custom_text_table_widget(text: "$aS7"),
                    ]),
                  ]),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
