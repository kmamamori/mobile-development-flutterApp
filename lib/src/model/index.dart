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
  List answeringQuestions = List();
  List answeredValue;

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
    // print(n);
    var r = Random();
    var nextNum = 0;
    // n = int.parse(n);
    // n = json.decode(n);
    // n = int.parse(Map<String, dynamic>n);
    // print(n.runtimeType);
    // n = int.parse(n);
    // print("this.questins.length: ${this.questions.length}"); //ok
    // var s = '';
    // var l = questions.asMap();
    // var data;
    // print(this.questions.runtimeType);
    // print(l.runtimeType);

    // print(this.questions[0].runtimeType);
    // print(l[0].runtimeType);

    // data = json.decode(l[0] as String).cast<String>();
    // print(data.runtimeType);

    // print("${this.questions[0]} && ${l[0]}");

    while (n > 0) {
      nextNum = r.nextInt(this.questions.length);
      // s = l[0];
      // print(nextNum);
      // print("questions[nextNum]:$s");
      answeringQuestions.add(this.questions[nextNum]);
      // print(this.questions[nextNum]);
      // this.questions.removeAt(nextNum);
      n--;
    }
    // var j = 0;
    // this.answeringQuestions.forEach((q) {
    //   print(q);
    //   print(j++);
    // });
    // return this.answeringQuestions;
  }

  get getQuestionsNum => questionsNum;

  get getAnsweringQuestions => answeringQuestions;

  String getAtAnsweringQuestion(i) {
    print(this.answeringQuestions[i]);
    return this.answeringQuestions[i];
  }

  //i: questions index, v: value(int)
  Future setAnsweredValue(int i, v){
    this.answeredValue[i] = v;
  }

  Future createAnsweredList(n){
    answeredValue = new List(n);
  }

  List get getAnsweredValue => answeredValue;
  
}
