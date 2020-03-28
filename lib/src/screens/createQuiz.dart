import 'package:flutter/material.dart';

class CreateQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "How many questions would you like to answer?"),
          ),
          RaisedButton(
            child: Text("Take Quiz!"),
            onPressed: ()=> Navigator.pushNamed(context, 'answerQuiz')
          )
      ])
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
