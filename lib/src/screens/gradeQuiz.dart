import 'package:flutter/material.dart';
import 'package:flutter_app/src/controller/index.dart';
import 'package:flutter_app/src/screens/radio.dart';

class GradeQuiz extends StatelessWidget {
  // final controller c = context.;
  // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
  // final controller c;
  // final String mes = ModalRoute.of(context).settings.arguments.mes;
  // const CreateQuiz(this.c, this.mes, {Key key}) : super(key: key);
  // print(mes);

  @override
  Widget build(BuildContext context) {
    print('Grade Quiz');
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final Controller c = arguments['c'];
    final List l = arguments['l'];

    // print('-----------------------');
    // c.getAnsweredValue.forEach((v) => print(v));
    // print('-----------------------');
    // c.getAnsweringQuestions.forEach((v) => print(v));
    // print('-----------------------');
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
            onPressed: (){
              print('pressed');
              Navigator.pushNamed(context, 'reviewQuiz',
                        arguments: {'c': c});
          })
        ])));
  }
}
