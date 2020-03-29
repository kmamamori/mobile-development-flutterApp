// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/controller/index.dart';

class AnswerQuiz extends StatelessWidget {
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

    GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    c.loadAllQuiz();
    return Scaffold(
        appBar: AppBar(
          title: Text("CREATE QUIZ"),
        ),
        body: Center(
            child: Form(
          child: Column(children: [
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.number,
              validator: (String inValue) {
                if (inValue.length != 4) {
                  return "Pin must be ==4 in length";
                }
                return null;
              },
              // onSaved: (String inValue) {
              //   this._loginData.pin = inValue;
              // },
              // decoration: InputDecoration(hintText: "Pin", labelText: "Pin")
            ),
            RaisedButton(
                child: Text("Take Quiz!"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.pushNamed(context, 'answerQuiz');
                  }
                  return false;
                }),
            //         PageView(
            //   children: <Widget>[
            //     Container(
            //       color: Colors.pink,
            //     ),
            //     Container(
            //       color: Colors.cyan,
            //     ),
            //     Container(
            //       color: Colors.deepPurple,
            //     ),
            //   ],
            // )
            // ]
            //     )
            // RaisedButton(
            //   onPressed: () {
            //     // Navigate back to first screen when tapped.
            //   },
            //   child: Text('Go back!'),
            // ),
          ]),
        )));
  }
}
