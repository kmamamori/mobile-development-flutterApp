import 'package:flutter/material.dart';
import 'package:flutter_app/src/controller/index.dart';
import 'package:flutter_app/src/screens/radio.dart';

class AnswerQuiz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('Answer Quiz');
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final Controller c = arguments['c'];
    final String n = arguments['n'];
    final List l = arguments['l'];
    c.createAnsweredList(int.parse(n));
 
    return Scaffold(
        appBar: AppBar(
          title: Text("ANSWER QUIZ"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: RaisedButton(
                  onPressed: () async {
                    List l = await c.getAnsweredValue;
                    Navigator.pushNamed(context, 'gradeQuiz',
                        arguments: {'c': c, 'l': l});
                  },
                  child: Text('DONE!'),
                ))
          ],
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
                        Center(
                          child: l[i]['figure'] == null
                              ? Text('')
                              : Image.network(
                                  "http://www.cs.utep.edu/cheon/cs4381/homework/quiz/figure.php?name=${l[i]['figure']}",
                                ),
                        ),
                        Center(child: MyStatefulWidget(l[i]['option'], c, i))
                      ],
                    ));
                  } else {
                    return Container(
                        child: Column(
                      children: <Widget>[
                        Text('Question${i + 1}'),
                        Text("${l[i]['stem']}"),
                        Center(
                          child: l[i]['figure'] == null
                              ? Text('')
                              : Image.network(
                                  "http://www.cs.utep.edu/cheon/cs4381/homework/quiz/figure.php?name=${l[i]['figure']}",
                                ),
                        ),
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
