// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/controller/index.dart';

class CreateQuiz extends StatelessWidget {
  // final controller c = context.;
  // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
  // final controller c;
  // final String mes = ModalRoute.of(context).settings.arguments.mes;

  // const CreateQuiz(this.c, this.mes, {Key key}) : super(key: key);

  // print(mes);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final Controller c = arguments['c'];
    c.loadAllQuiz();
    return Scaffold(
      appBar: AppBar(
        title: Text("CREATE QUIZ"),
      ),
      body: Center(
          child:
              // Column(
              //   children: [
              // TextFormField(
              //   decoration: InputDecoration(
              //       labelText: "How many questions would you like to answer?"),
              // ),
              // RaisedButton(
              //     child: Text("Take Quiz!"),
              //     onPressed: () => Navigator.pushNamed(context, 'answerQuiz')),
              PageView(
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.cyan,
          ),
          Container(
            color: Colors.deepPurple,
          ),
        ],
      )
          // ]
          //     )
          // RaisedButton(
          //   onPressed: () {
          //     // Navigate back to first screen when tapped.
          //   },
          //   child: Text('Go back!'),
          // ),
          ),
    );
  }
}
