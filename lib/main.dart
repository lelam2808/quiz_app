import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:quiz_app/controller/quizz_controller.dart';
import 'package:quiz_app/cubit/fetch_data_cubit.dart';
import 'package:quiz_app/http_service/fetch_data.dart';
import 'package:quiz_app/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HttpService.getQuizz();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<FetchDataCubit>(
              create: (context)=>FetchDataCubit(),
          )
        ],
          child: HomeScreen()
      ),
    );
  }
}

