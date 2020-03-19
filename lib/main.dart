import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

void main() =>
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzler',
      home: Scaffold(backgroundColor: Colors.black, body: QuizPage(),),));

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];

  List<Question> questionBank = [
    Question(q: 'The sun rises from the east', a: true),
    Question(q: 'All dogs are tigers in origin', a: false),
    Question(q: 'Funny games are always supper funny', a: true),
    Question(q: 'The sun rises from the east', a: true),
    Question(q: 'All dogs are tigers in origin', a: false),
    Question(q: 'The sun rises from the east', a: true),
    Question(q: 'All dogs are tigers in origin', a: false),
    Question(q: 'The sun rises from the east', a: true),
    Question(q: 'All dogs are tigers in origin', a: false),
    Question(q: 'The sun rises from the east', a: true),
    Question(q: 'All dogs are tigers in origin', a: false),
    Question(q: 'The sun rises from the east', a: true),
    Question(q: 'All dogs are tigers in origin', a: false),
    Question(q: 'The sun rises from the east', a: true),
    Question(q: 'All dogs are tigers in origin', a: false),
  ];
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //for the question
          Expanded(flex: 5,
            child: Center(child: Text(
              questionBank[questionNumber].questionText, textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,),),),), //for the choices
          Expanded(flex: 2,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 1,
                  child: ClipRRect(borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(50),),
                    child: FlatButton(
                      padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text('True', style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,),),
                      onPressed: () {
                        bool correctAnswer = questionBank[questionNumber].questionAnswer;
                        if (correctAnswer == true) {
                          setState(() {
                            scoreKeeper.add(
                              Icon(Icons.check, color: Colors.green,),);
                          });
                        } else {
                          setState(() {
                            scoreKeeper.add(
                              Icon(Icons.close, color: Colors.red,),);
                          });
                        }
                        setState(() {
                          questionNumber++;
                        });
                      },),),),
                Expanded(flex: 1,
                  child: ClipRRect(borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(50),),
                    child: FlatButton(
                      padding: EdgeInsets.fromLTRB(0, 16, 16, 16),
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text('False', style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,),),
                      onPressed: () {
                        bool correctAnswer = questionBank[questionNumber].questionAnswer;
                        if (correctAnswer == false) {
                          setState(() {
                            scoreKeeper.add(
                              Icon(Icons.check, color: Colors.green,),);
                          });
                        } else {
                          setState(() {
                            scoreKeeper.add(
                              Icon(Icons.close, color: Colors.red,),);
                          });
                        }
                        setState(() {
                          questionNumber++;
                        });
                      },),),),
              ],),), //for the score keeper
          Container(height: 25,
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: scoreKeeper,),)
        ],),);
  }
}