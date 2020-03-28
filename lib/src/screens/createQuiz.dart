import 'package:flutter/material.dart';

class CreateQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
