// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/controller/index.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:flutter_app/src/screens/radio.dart';

class AnswerQuiz extends StatelessWidget {
  // final controller c = context.;
  // final Map arguments = ModalRoute.of(context).settings.arguments as Map;
  // final controller c;
  // final String mes = ModalRoute.of(context).settings.arguments.mes;
  // const CreateQuiz(this.c, this.mes, {Key key}) : super(key: key);
  // print(mes);

  @override
  Widget build(BuildContext context) {
    print('Answer Quiz');
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final Controller c = arguments['c'];
    final String n = arguments['n'];
    final List l = arguments['l'];
    c.createAnsweredList(int.parse(n));
    var _selectedValue;
    // var i = 0;
    // print(l[0]);
    // l.forEach((q) {
    //   print("THIS IS A QUIZ");
    //   print(q);
    // });

    l.forEach((o) {
      print(o);
    });

    void updateValue(v) {
      _selectedValue = v;
    }

    // final List l = c.getAnsweringQuestions;
    // c.createQuiz(n);
    // print(l.length);
    // var s;
    // var i = 0;
    // PageController controller = PageController();
    // GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text("ANSWER QUIZ"),
        ),
        body: Center(
            child: PageView.builder(
                itemCount: int.parse(n),
                itemBuilder: (context, int i) {
                  Text('Question${i + 1}');
                  if (l[i]['type'] == 1) {
                    return Container(
                        child: Column(
                      children: <Widget>[
                        Text('Question${i + 1}'),
                        Text("${l[i]['stem']}"),
                        Center(child: MyStatefulWidget(l[i]['option']))
                      ],
                    ));
                  } else {
                    return Container(
                        child: Column(
                      children: <Widget>[
                        Text('Question${i + 1}'),
                        Text("${l[i]['stem']}"),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your answer here.',
                          ),
                          onChanged: (v) async =>
                              await c.setAnsweredValue(i, v),
                        )
                      ],
                    ));
                  }
                })));
  }
}
