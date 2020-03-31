import 'package:flutter/material.dart';
import 'package:flutter_app/src/controller/index.dart';

/// Displays uncorrect answered questions with the right answer
class ReviewQuiz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('Review Quiz');
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final Controller c = arguments['c'];
    final List l = arguments['l'];

    return Scaffold(
        appBar: AppBar(
          title: Text("REVIEW QUIZ"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: RaisedButton(
                  onPressed: () async {
                    // initialized all data for new quiz
                    c.initialize();
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: Text('New Quiz.'),
                ))
          ],
        ),
        body: Center(
          /// Listview to display all the questions
          child: ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, index) {
                if (l[index]['type'] == 1) {
                  return ListTile(
                    title: Text('${l[index]['stem']}'),
                    subtitle: Text(
                        "Answer: ${l[index]['option'][l[index]['answer'] - 1]}"),
                  );
                } else {
                  return ListTile(
                    title: Text('${l[index]['stem']}'),
                    subtitle: Text("  Answer: ${l[index]['answer'][0]}"),
                  );
                }
              }),
        ));
  }
}
