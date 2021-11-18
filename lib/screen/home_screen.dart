import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app/controller/data_controller.dart';
import 'package:quiz_app/http_service/fetch_data.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/screen/result_screen.dart';
import 'package:quiz_app/widget/card_option.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.listResult}) : super(key: key);
  final List<Results> listResult;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String textNextPage = "Next Question";
  int countTime = 0;
  late Timer timer;
  void startTime() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        countTime++;
      });
    });
  }

  @override
  void initState() {
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    final DataController c = Get.find();
    PageController pageController = PageController(initialPage: 0);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xFF26294B)),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.timer),
                        Text(" ${countTime} seconds")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (index) {
                      if (index + 1 == widget.listResult!.length) {
                        setState(() {
                          textNextPage = "View Result";
                        });
                      }
                    },
                    itemCount: widget.listResult!.length,
                    itemBuilder: (context, index) => CardOption(
                      question: widget.listResult![index],
                      indexQuestion: index,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      print("diem hien tai: " + c.score.toString());
                      pageController.nextPage(
                          duration: Duration(milliseconds: 10),
                          curve: Curves.bounceIn);
                      if (pageController.page! + 1 ==
                          widget.listResult!.length) {
                        timer.cancel();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                      score: c.score.value,
                                      timeSeconds: countTime,
                                    )));
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          textNextPage,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }
}
