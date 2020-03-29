import 'dart:convert';
import 'package:http/http.dart' as http;

class Model {
  List questions = List();
  List grades = List();
  var res;
  var quizName;
  var username;
  var pin;
  var reason;

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

  void setReason(reason) {
    this.reason = reason;
  }

  void setUsername(username) {
    this.username = username;
  }

  get getUsername => username;

  void setPin(pin) {
    this.pin = pin;
  }

  Future<bool> login(username, pin) async {
    // http.post('http://www.cs.utep.edu/cheon/cs4381/homework/quiz/post.php')
    this.setUsername(username);
    this.setPin(pin);
    var response = await http.post(
        'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/post.php',
        body: '{"user": "$username", "pin": "$pin", "quiz":"quiz01"}');
    var data = await json.decode(response.body);
    if (data['response'] == false) {
      this.setReason(data['reason']);
      return false;
    }
    return true;
  }

  void loadAllQuiz() async {
    var response;
    var data;
    var firsttime = true;
    var i = 0;
    while (firsttime || data['response']) {
      response = await http.post(
          'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/post.php',
          body: '{"user": "$username", "pin": "$pin", "quiz":"quiz0$i"}');
      i++;
      data = await json.decode(response.body);
      if (data['response'] == true) {
        // data['quiz']['question'].forEach((q) {
        //   print(q);
        // });
        print(data['quiz']['name']);
        setQuestions(data['quiz']['question']);
      }
      firsttime = false;
    }
  }
}
