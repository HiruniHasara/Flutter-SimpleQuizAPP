import 'package:fc01/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    //map class
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 8},
        {'text': 'Blue', 'score': 6},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Cat', 'score': 8},
        {'text': 'Dog', 'score': 10},
        {'text': 'Rabbit', 'score': 7},
        {'text': 'Squirell', 'score': 5},
      ],
    },
    {
      'questionText': 'Who\'s your favourite singer?',
      'answers': [
        {'text': 'Sia', 'score': 8},
        {'text': 'Adam', 'score': 9},
        {'text': 'Alan', 'score': 10},
        {'text': 'Shawn', 'score': 6},
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore=0;

  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore+score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
