import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/cubit/fetch_data_cubit.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/widget/option.dart';

class CardOption extends StatefulWidget {
  const CardOption({
    Key? key, 
    required this.question, 
    required this.indexQuestion,
  }) : super(key: key);
  final Results question;
  final int indexQuestion;
  
  @override
  State<CardOption> createState() => _CardOptionState();
}

class _CardOptionState extends State<CardOption> {

  bool isPress=false;
  Color trueAnswer=Colors.green;
  // Color wrongAnswer=Colors.red;
  Color colorBtn= Colors.grey;
  int score = 0;
  List<String>? newList;
  @override
  void initState() {
    newList= widget.question.incorrectAnswers;
    newList!.insert(widget.question.incorrectAnswers.length, widget.question.correctAnswer);
    newList!.sort();
    setState(() {
      isPress=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          BlocBuilder<FetchDataCubit , FetchDataState>(
          builder: (context, state) {
            if(state is FetchDataLoaded){
              return Column(
                children: [
                  Text("Câu hỏi thứ ${widget.indexQuestion+1}/10", style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  Text(widget.question.question.toString(),style: TextStyle(fontSize: 18, color: Colors.black),),
                  ...List.generate(newList!.length, (index) =>
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isPress=true;
                          });
                          print("click");
                          if(newList![index].contains(widget.question.correctAnswer)){
                            print("dap an dung");
                            state.score+=1;
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top:20),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width:2,
                                  color:isPress ?
                                  newList![index].contains(widget.question.correctAnswer) ?
                                  trueAnswer:
                                  colorBtn :
                                  colorBtn
                              ),
                              borderRadius: BorderRadius.circular(10)

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 230,
                                  child: Text("${index+1}. ${newList![index]}",maxLines: 2, overflow:TextOverflow.visible, style: TextStyle(color: Colors.black),)
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width:2,
                                        color:isPress ?
                                        newList![index].contains(widget.question.correctAnswer) ?
                                        Colors.green:
                                        Colors.red :
                                        colorBtn
                                    )
                                ),
                                child: Center(
                                  child: isPress ?
                                  newList![index].contains(widget.question.correctAnswer)?
                                      Icon(Icons.check,size: 12,color: Colors.green,):
                                      Icon(Icons.clear,size: 12, color: Colors.red,)  :
                                      null
                                ),
                              )

                            ],
                          ),
                        ),
                      )
                    // Option(
                    //   text: newList![index],
                    //   index: index,
                    //   colorBtn: colorBtn,
                    //   press: (){
                    //     print("click");
                    //     if(newList![index].contains(widget.question.correctAnswer)){
                    //       print("dap an dung");
                    //       setState(() {
                    //         colorBtn=trueAnswer;
                    //       });
                    //     }
                    //     else{
                    //       print("dap an sai");
                    //         colorBtn=wrongAnswer;
                    //     }
                    // })
                  ),
                ],
              );
            }
            else{
              return Container() ;
            }
          },
        ),
      ]
      ),
    );
  }


}

