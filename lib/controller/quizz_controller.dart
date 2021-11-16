
import 'dart:core';
import 'package:get/get.dart';
import 'package:quiz_app/http_service/fetch_data.dart';
import 'package:quiz_app/model/quiz_model.dart';

class QuizzController extends GetxController with SingleGetTickerProviderMixin{

  List<Results>_listQuestion=HttpService.getQuizz() as List<Results>;

  List<Results> get getListQuestion => this._listQuestion;

}