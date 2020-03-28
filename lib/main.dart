import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/account.dart';
// import 'package:flutter_app/src/screens/home.dart';
import 'package:flutter_app/src/screens/settings.dart';
import 'package:flutter_app/src/screens/login.dart';
import 'package:flutter_app/src/screens/answerQuiz.dart';
import 'package:flutter_app/src/screens/createQuiz.dart';

void main() {
  runApp(MaterialApp(
    // debugShowCheckedModeBanner: false,
    home: MyApp(), // route for home is '/' implicitly
    routes: 
    <String, WidgetBuilder>{
      // define the routes
      SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
      AccountScreen.routeName: (BuildContext context) => AccountScreen(),
      'answerQuiz': (context) => AnswerQuiz(),
      'createQuiz': (context) => CreateQuiz(),
    },
  ));
}
