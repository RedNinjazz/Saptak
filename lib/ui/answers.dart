import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final Function potato;

  final String answersGood;

  Answers(this.potato, this.answersGood);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text(
          answersGood,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          potato();
        },
      ),
    );
  }
}
