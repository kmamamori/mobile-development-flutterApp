import 'dart:convert';
import 'package:http/http.dart' as http;

class model {
  List questions = List();
  List grades = List();
  var res;
  var quizName;

  void setResponse(res) {
    this.res = res;
  }

  bool get getResponse => res;

  void setQuestions(questions) {
    questions.forEach((q) {
      this.questions.add(q);
    });
  }

  void setQuizName(name) {
    quizName = name;
  }

  get getQuestions => questions;

  void addAnswer(a) {
    grades.add(a);
  }

  get getGrades => grades;
}

Future<bool> login(username, pin) async {
  // http.post('http://www.cs.utep.edu/cheon/cs4381/homework/quiz/post.php')
  var response = await http.post(
      'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/post.php',
      body: '{"user": "$username", "pin": "$pin", "quiz":"quiz01"}');
  var data = await json.decode(response.body);
  if (data['response'] == false) {
    return false;
  }
  return true;
}
