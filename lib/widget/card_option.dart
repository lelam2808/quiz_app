import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/widget/option.dart';

class CardOption extends StatelessWidget {
  const CardOption({
    Key? key, required this.question,
  }) : super(key: key);
  final Results question;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(question.question.toString(),style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
          Option(),
          Option(),
          Option(),
          Option()
        ],
      ),
    );
  }
}

