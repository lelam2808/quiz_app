part of 'fetch_data_cubit.dart';


class FetchDataState {}

class FetchDataInitial extends FetchDataState {}
class FetchDataLoaded extends FetchDataState {
  List<Results> listResult;
  int score;
  FetchDataLoaded(this.listResult, this.score);
}
class FetchDataLoadedFailed extends FetchDataState {
  String message;
  FetchDataLoadedFailed(this.message);
}