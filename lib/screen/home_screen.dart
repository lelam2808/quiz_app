import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:quiz_app/cubit/fetch_data_cubit.dart';
import 'package:quiz_app/screen/result_screen.dart';
import 'package:quiz_app/widget/card_option.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String textNextPage="Next Question";
  int couter=0;
  late Timer timer;
  void startTime(){
    timer=Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        couter++;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchDataCubit>().getResult();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    PageController pageController= PageController(
      initialPage: 0
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Color(0xFF26294B)
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocBuilder<FetchDataCubit, FetchDataState>(
          builder: (context, state) {
            if(state is FetchDataLoaded){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),
                  SizedBox(height: 20,),
                  Expanded(
                    child:PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      onPageChanged: (index){
                        if(index+1 == state.listResult.length){
                          setState(() {
                            textNextPage="View Result";
                          });
                        }
                      },
                      itemCount: state.listResult.length,
                      itemBuilder: (context, index)=>CardOption(
                        question: state.listResult[index],
                        indexQuestion: index,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: (){
                        print("diem hien tai: "+state.score.toString());
                        pageController.nextPage(duration: Duration(milliseconds: 10), curve: Curves.bounceIn);
                        if(pageController.page!+1==state.listResult.length){
                          timer.cancel();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>ResultScreen(score: state.score,timeSeconds: couter,))
                          );
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(textNextPage, style: TextStyle(fontSize: 18, color: Colors.white),),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
            else{
              return Center(
                  child: CircularProgressIndicator()
              );
            }
          },
        ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }
}

