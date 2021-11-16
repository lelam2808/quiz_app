import 'dart:convert';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:http/http.dart' as http;
class HttpService {
  static Future<List<Results>> getQuizz() async {
    final response = await http.get(
        Uri.parse('https://opentdb.com/api.php?amount=10'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      List<Results> _listMovie=(result["results"] as Iterable)
          .map((e) => Results.fromJson(e)
      ).toList();
      return _listMovie;
    } else {
      throw Exception('Failed to load album');
    }
  }
}