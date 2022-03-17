import 'dart:ui';

import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String questionText;

  int questionNumber;
  Questions(this.questionText, this.questionNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
          questionText,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}
