import 'package:flutter/material.dart';
import 'package:flutter_app/src/controller/index.dart';
import 'package:flutter_app/src/screens/radio.dart';

class ReviewQuiz extends StatelessWidget {
  // final controller c = context.;
  // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
  // final controller c;
  // final String mes = ModalRoute.of(context).settings.arguments.mes;
  // const CreateQuiz(this.c, this.mes, {Key key}) : super(key: key);
  // print(mes);

  @override
  Widget build(BuildContext context) {
    print('Review Quiz');
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final Controller c = arguments['c'];
    final List l = arguments['l'];
    // c.gradeQuestions();

    // print('------------------------------------------------');
    // l.forEach((ll)=>print(ll));
    // print('------------------------------------------------');

    return Scaffold(
        appBar: AppBar(
          title: Text("REVIEW QUIZ"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: RaisedButton(
                  onPressed: () async {
                    // List l = await c.getAnsweredValue;
                    // l.forEach((ll)=>print(ll));
                    c.initialize();
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: Text('Take another quiz.'),
                ))
          ],
        ),
        body: Center(
          child: ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, index) {
                // print(index);
                if (l[index]['type'] == 1) {
                  return ListTile(
                    title: Text('${l[index]}'),
                    subtitle: Text(
                        "Answer: ${l[index]['option'][l[index]['answer'] - 1]}"),
                  );
                } else {
                  return ListTile(
                    title: Text('${l[index]}'),
                    subtitle: Text("Answer: ${l[index]['answer'][0]}"),
                  );
                }
                // return ListTile(
                //   title: Text('${l[index]}'),
                //   subtitle: Text('dd'),
                // );
              }),
        ));
  }
}
