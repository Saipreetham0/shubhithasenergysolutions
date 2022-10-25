import 'package:flutter/material.dart';

class custom_text_table_widget extends StatefulWidget {
  custom_text_table_widget({
    super.key,
    required this.text,
  });

  var text;

  @override
  State<custom_text_table_widget> createState() =>
      _custom_text_table_widgetState();
}

class _custom_text_table_widgetState extends State<custom_text_table_widget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('${widget.text}',
            style: Theme.of(context).textTheme.headline6),
      )
    ]);
  }
}
