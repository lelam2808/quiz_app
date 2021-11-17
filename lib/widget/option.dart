import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class Option extends StatefulWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
    required this.colorBtn,
  }) : super(key: key);
  final String text;
  final int index;
  final Function press;
  final Color colorBtn;

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // print("click");
        widget.press;
      },
      child: Container(
        margin: EdgeInsets.only(top:20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: widget.colorBtn,
            border: Border.all(color:widget.colorBtn),
            borderRadius: BorderRadius.circular(10)

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 250,
                child: Text("${widget.index+1}. ${widget.text}",maxLines: 2, overflow:TextOverflow.visible, style: TextStyle(color: Colors.black),)
            ),
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
      ),
    );
  }
}
