import 'dart:async';

import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:percent_indicator/percent_indicator.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int amountOfTrue = 0;
  int amountOfFalse = 0;

  String getResult(){
    if(amountOfTrue>amountOfFalse)
      return "İyi iş çıkardın";
    else if(amountOfTrue==amountOfFalse)
      return "İdare eder";
    else
      return "Berbat";
  }


  void checkAnswer(bool answer){
    bool correctAnswer = quizBrain.getAnswers();
    if(quizBrain.isFinished()){
      Alert(
        style: AlertStyle(
          animationType: AnimationType.grow,
          animationDuration: Duration(milliseconds: 1000,),
          backgroundColor: Colors.deepPurple,
        ),
        context: context,
        title: "Oyun Bitti",
        desc: getResult(),
        buttons: [
          DialogButton(
            child: Text(
              "Yeniden Oyna",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            onPressed: () {
              setState(() {
                quizBrain.reset();
                amountOfFalse=0;
                amountOfTrue=0;
              });
              Navigator.pop(context);
            },
            width: 120,
          )
        ],
      ).show();

      quizBrain.reset();
    }
    else{
      if(correctAnswer == answer)
        amountOfTrue++;
      else
        amountOfFalse++;
      setState(() {
        quizBrain.nextQuestion();
      });
    }
  }

@override
int time = 10;
  void initState(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(time>0) {
        setState(() {
          time--;
        });
      }
      else{
        quizBrain.nextQuestion();
        setState((){
          amountOfFalse++;
          time=10;
        });
      }
    });
  }









//UI kısmı
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Icon(Icons.check, color: Colors.green, size: 45,),
                    Text('$amountOfTrue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                     ),
                    ),
                  ],
                ),
              ), 
              Expanded(
                child: CircularPercentIndicator(
                  radius: 45,
                  lineWidth: 8,
                  percent: (10-time)/10,
                  center: Text('$time',style: TextStyle(color: Colors.white),),
                  progressColor: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple.shade100,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Icon(Icons.close, color: Colors.red, size: 45,),
                    Text('$amountOfFalse',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
    ]


          ),
        ),
        Expanded(
          flex: 4,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                quizBrain.getText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(true);
                time=10;
              },
              child: Text('True'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(false);
                time=10;
              },
              child: Text('False'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),

      ],
    );
  }
}
