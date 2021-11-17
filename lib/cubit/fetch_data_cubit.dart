import 'package:bloc/bloc.dart';
import 'package:quiz_app/http_service/fetch_data.dart';
import 'package:quiz_app/model/quiz_model.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  late HttpService httpService;
  FetchDataCubit() : super(FetchDataInitial());
  Future getResult() async{
    try{
      final List<Results> listResult=await HttpService.getQuizz();
      final int score=0;
      if(listResult==null){
        emit(FetchDataLoadedFailed("error"));
      }
      else{
        // emit(MovieInitial());
        emit(FetchDataLoaded(listResult, score));
      }
    }on Exception catch (e){
      print(e);
    }
  }
}
