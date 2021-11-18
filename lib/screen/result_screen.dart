import 'package:flutter/material.dart';
import 'package:quiz_app/screen/home_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key,
    required this.score,
    required this.timeSeconds}) : super(key: key);
  final int score;
  final int timeSeconds;
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String textHeader="Congratulation !!!";
  String textContent="You are amazing !!!";
  String urlImg="assets/images/achive.png";
  @override
  void initState() {
    // TODO: implement initState
    if(widget.score < 5){
      setState(() {
        textHeader="Completed !!!";
        textContent="Better luck for next time !";
        urlImg="assets/images/try.jpg";
      });
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF26294B),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width*0.05),
              child: Container(
                width: size.width*0.9,
                height: size.height*0.45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Container(
                        width:100,
                          height: 100,
                          child: Image.asset("${urlImg}")
                      ),
                      SizedBox(height: 20,),
                      Text("${textHeader}", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("${textContent}", style: TextStyle(fontSize: 20,),),
                      SizedBox(height: 10,),
                      Text("${widget.score}/10 correct answers in ${widget.timeSeconds} seconds", style: TextStyle(fontSize: 18,)),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
                        },
                        child: Container(
                          width: 100,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color:Colors.red,
                          ),
                          child: Center(
                            child: Text("Try Again", style: TextStyle(fontSize: 16, color: Colors.white),),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
