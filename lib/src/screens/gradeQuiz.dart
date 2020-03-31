import 'package:flutter/material.dart';
import 'package:flutter_app/src/controller/index.dart';

// A class where user can see the grade received
class GradeQuiz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('Grade Quiz');
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final Controller c = arguments['c'];
    final List l = arguments['l'];

    // grades the quiz
    c.gradeQuestions();

    return Scaffold(
        appBar: AppBar(
          title: Text("GRADE QUIZ"),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Text('Grade: ${c.getGrade}/${l.length}'),
          RaisedButton(
              child: Text('REVIEW'),
              onPressed: () async {
                List l = await c.getUncorrectQuestions;
                Navigator.pushNamed(context, 'reviewQuiz',
                    arguments: {'c': c, 'l': l});
              })
        ])));
  }
}
