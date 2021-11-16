import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/src/provider.dart';
import 'package:quiz_app/controller/quizz_controller.dart';
import 'package:quiz_app/cubit/fetch_data_cubit.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/widget/card_option.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchDataCubit>().getResult();
  }
  @override
  Widget build(BuildContext context) {
    // QuizzController quizzController=Get.put(QuizzController());
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFD4418E), Color(0xFF0652C5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150,),
              Text("Câu hỏi thứ 1", style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),
              BlocBuilder<FetchDataCubit, FetchDataState>(
              builder: (context, state) {
                if(state is FetchDataLoaded){
                  return Expanded(
                    child:PageView.builder(
                      itemCount: state.listResult.length,
                      itemBuilder: (context, index)=>CardOption(question: state.listResult[index],),
                    ),
                  );
                }
                else{
                  return CircularProgressIndicator();
                }
                },
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text("Next Question", style: TextStyle(fontSize: 18, color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

