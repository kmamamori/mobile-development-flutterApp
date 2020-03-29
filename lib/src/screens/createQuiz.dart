// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/controller/index.dart';

class CreateQuiz extends StatelessWidget {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final Controller c = arguments['c'];
    String n = '0';
    c.loadAllQuiz();
    return Scaffold(
        appBar: AppBar(
          title: Text("CREATE QUIZ"),
        ),
        body: Center(
            child: Form(
          key: this._formKey,
          child: Column(children: [
            Text("Please enter the number of questions that you want to take."),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Number", labelText: "Enter Number"),
                validator: (String inValue) {
                  if (inValue.length == 0) {
                    return "Please enter a number";
                  }
                  if (int.parse(n) > c.getQuestionsNum) {
                    return "You cannot pick greater than ${c.getQuestionsNum}.";
                  }
                  return null;
                },
                onSaved: (String inValue) {
                  n = inValue;
                },
                onChanged: (text) {
                  n = text;
                }),
            RaisedButton(
                child: Text("Take Quiz!"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    c.createQuiz(n);
                    Navigator.pushNamed(context, 'answerQuiz',
                        arguments: {'n': n});
                  }
                  return false;
                }),
          ]),
        )));
  }
}
