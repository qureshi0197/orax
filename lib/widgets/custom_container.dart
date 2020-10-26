import 'package:flutter/material.dart';

Widget customColumn(String number, String subtitle) {
    return Column(
      children: <Widget>[
        Text(number,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(subtitle),
      ],
  );
}
