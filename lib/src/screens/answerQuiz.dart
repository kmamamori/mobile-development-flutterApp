import 'package:flutter/material.dart';
import 'package:flutter_app/src/controller/index.dart';
import 'package:flutter_app/src/screens/radio.dart';
// import 'flutter_app/src/assets/placeholder.png' as p; 

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
    // var _selectedValue;
    // var i = 0;
    // print(l[0]);
    // l.forEach((q) {
    //   print("THIS IS A QUIZ");
    //   print(q);
    // });

    // l.forEach((o) {
    //   print(o);
    // });

    return Scaffold(
        appBar: AppBar(
          title: Text("ANSWER QUIZ"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: RaisedButton(
                  onPressed: () async {
                    List l = await c.getAnsweredValue;
                    // l.forEach((ll)=>print(ll));
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
                        // FadeInImage(
                        //     placeholder: Text("null"),
                        //     image: NetworkImage(
                        //         'http://www.cs.utep.edu/cheon/cs4381/homework/qeuiz/figure.php?name=${l[i]['figure']}')),
                        Image.network(
                          'http://www.cs.utep.edu/cheon/cs4381/homework/qeuiz/figure.php?name=quiz00-fig1.png',

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
