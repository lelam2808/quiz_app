import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quiz_app/cubit/fetch_data_cubit.dart';
import 'package:quiz_app/screen/home_screen.dart';
import 'package:quiz_app/screen/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<FetchDataCubit>(
              create: (_)=>FetchDataCubit(),
          ),
        ],
          child: HomeScreen()
      ),
    );
  }
}

