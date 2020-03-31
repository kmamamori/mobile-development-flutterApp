import 'package:flutter/material.dart';
import 'package:flutter_app/src/controller/index.dart';

/// Class that gets input and creates quiz
class CreateQuiz extends StatelessWidget {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final Controller c = arguments['c'];
    String n = '0';
    // retrieve all quiz
    c.loadAllQuiz();
    print('Create Quiz');
    return Scaffold(
        appBar: AppBar(
          title: Text("CREATE QUIZ"),
        ),
        body: Center(
            child: Form(
          key: this._formKey,
          child: Column(children: [
            Text(
              "Please enter the number of questions that you want to take.",
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Number", labelText: "Enter Number"),
                validator: (String inValue) {
                  if (inValue.length == 0) {
                    return "Please enter a number";
                  }
                  if (int.parse(n) > c.getQuestionsNum) {
                    return "You cannot pick greater than ${c.getQuestionsNum}.";
                  }
                  return null;
                },
                onSaved: (String inValue) {
                  n = inValue;
                },
                onChanged: (text) {
                  n = text;
                }),
            RaisedButton(
                child: Text("Take Quiz!"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // create quiz with passing the input value
                    await c.createQuiz(int.parse(n));
                    /// retrieve quiz
                    List l = await c.getAnsweringQuestions;
                    // navigate to the next page
                    await Navigator.pushNamed(context, 'answerQuiz',
                        arguments: {'n': n, 'c': c, 'l': l});
                  }
                  return false;
                }),
            Text(
                "When the Quiz starts, swipe to left/right to answer all the questions.")
          ]),
        )));
  }
}
