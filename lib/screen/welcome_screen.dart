import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/data_controller.dart';
import 'package:quiz_app/http_service/fetch_data.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/screen/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late List<Results> listResult;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HttpService.getQuiz().then((value) => setState(() {
          listResult = value;
    }));
  }
  @override
  Widget build(BuildContext context) {
    final DataController c = Get.put(DataController());
    c.score.value = 0 ;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF26294B),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/achive.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => HomeScreen(listResult: listResult)));
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text("Start"),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
