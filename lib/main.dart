import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/login.dart';
import 'package:flutter_app/src/screens/answerQuiz.dart';
import 'package:flutter_app/src/screens/createQuiz.dart';
import 'package:flutter_app/src/screens/gradeQuiz.dart';
import 'package:flutter_app/src/screens/reviewQuiz.dart';

/// Initial point of the coding
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: 
    <String, WidgetBuilder>{
      '/': (context)=>Login(),
      'answerQuiz': (context) => AnswerQuiz(),
      'createQuiz': (context) => CreateQuiz(),
      'gradeQuiz': (context) => GradeQuiz(),
      'reviewQuiz': (context) => ReviewQuiz(),
    },
  ));
}
