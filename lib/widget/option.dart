import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color:Colors.grey),
          borderRadius: BorderRadius.circular(10)

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("1.A", style: TextStyle(color: Colors.black),),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey)
            ),
          )

        ],
      ),
    );
  }
}
