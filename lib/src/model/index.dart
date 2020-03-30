import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class Model {
  List questions = List();
  List grades = List();
  var res;
  var quizName;
  var username;
  var pin;
  var reason;
  var questionsNum;
  var grade=0;
  List answeringQuestions = List();
  List answeredValue;
  List uncorrectQuestions = List();

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

  Future loadAllQuiz() async {
    print('load All Quiz');
    var response;
    var data;
    var firsttime = true;
    var i = 0, j = 0;
    while (firsttime || data['response']) {
      response = await http.post(
          'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/post.php',
          body: '{"user": "$username", "pin": "$pin", "quiz":"quiz0$i"}');
      i++;
      j++;
      data = await json.decode(response.body);
      if (data['response'] == true) {
        print(data['quiz']['name']);
        setQuestions(data['quiz']['question']);
      }
      firsttime = false;
    }
    questionsNum = j;
  }

  void createQuiz(int n) {
    print('createQuiz');
    var r = Random();
    var nextNum = 0;
    while (n > 0) {
      nextNum = r.nextInt(this.questions.length);
      answeringQuestions.add(this.questions[nextNum]);
      n--;
    }
  }

  get getQuestionsNum => questionsNum;

  get getAnsweringQuestions => answeringQuestions;

  String getAtAnsweringQuestion(i) {
    print(this.answeringQuestions[i]);
    return this.answeringQuestions[i];
  }

  Future setAnsweredValue(int i, v) {
    this.answeredValue[i] = v;
  }

  Future createAnsweredList(n) {
    answeredValue = new List(n);
  }

  List get getAnsweredValue => answeredValue;

  void setGrade(n){
    this.grade = n;
  }

  get getGrade => this.grade;

  void gradesQuestions() {
    var i = 0;
    // var grade = 0;
    answeringQuestions.forEach((q) {
      if (q['answer'] != answeredValue[0]) {
        uncorrectQuestions.add(q);
        print('Uncorrect');
      } else {
        // this.grade++;
        print('Correct');
        this.setGrade(this.getGrade+1);
      }
      print(i);
      i++;
    });
    print(this.getGrade);
    // this.setGrade(grade);

    uncorrectQuestions.forEach((q) => {print(q)});
    print('Grades');
    print(this.getGrade);
  }
}
