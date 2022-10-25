// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class bill_table extends StatelessWidget {
  final String text;
  final String price;

  const bill_table({
    Key? key,
    required this.text,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
        border: TableBorder.all(
            color: Theme.of(context).iconTheme.color!,
            style: BorderStyle.solid,
            width: 1),
        children: [
          TableRow(children: [
            Column(children: [
              Text("$text", style: Theme.of(context).textTheme.headline6),
            ]),
            Column(children: [
              Text('Rs. $price', style: Theme.of(context).textTheme.headline6)
            ]),
          ]),
        ]
        );
  }
}
