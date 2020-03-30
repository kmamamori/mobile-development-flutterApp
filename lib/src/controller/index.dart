import 'package:flutter_app/src/model/index.dart';
import 'package:flutter_app/src/view/index.dart';
import 'dart:io';
import 'dart:core';

class Controller {
  Model m;
  View v;

  Controller(m, v) {
    this.m = m;
    this.v = v;
  }

  void setResponse(res) {
    m.setResponse(res);
  }

  bool get getResponse => m.getResponse;

  void setQuestions(questions) {
    m.setQuestions(questions);
  }

  void setQuizName(name) {
    m.setQuizName(name);
  }

  void setQuizInfo(quiz) {
    m.setQuizName(quiz['name']);
    m.setQuestions(quiz['question']);
  }

  void displayQuestions() {
    v.displayQuestions(m.getQuestions);
  }

  get getQuestions => m.getQuestions;

  void displayQuestion(q) {
    v.displayQuestion(q);
  }

  int displayOptions(o) => v.displayOptions(o);

  int optionInput(l) {
    var cc;
    try {
      var c = stdin.readLineSync();
      cc = int.parse(c);
    } catch (e) {
      print('Pick the number between 1-${l}');
      stdout.write('Invalid Input.\n');
      return optionInput(l);
    }
    if (cc > 0 && cc < l + 1) {
      return cc;
    } else {
      print('Pick the number between 1-${l}');
      return optionInput(l);
    }
  }

  String fillBlankInput() {
    var c;
    try {
      c = stdin.readLineSync();
    } catch (e) {
      stdout.write('Invalid Input');
      return fillBlankInput();
    }
    if (c.length < 3) {
      print('This is a fill-in-the-blank question.');
      return fillBlankInput();
    } else {
      return c;
    }
  }

  void addAnswer(a) {
    m.addAnswer(a);
  }

  int calculateGrades() {
    var s = 0;
    m.getGrades.forEach((g) {
      s += g;
    });
    return s;
  }

  void displayReview() {
    v.displayReview(m.getGrades, m.getQuestions);
  }

  Future<bool> login(username, pin) async {
    return await m.login(username, pin);
  }

  get getUsername => m.getUsername;

  void loadAllQuiz() {
    m.loadAllQuiz();
  }

  Future createQuiz(n) {
    m.createQuiz(n);
  }

  get getQuestionsNum => m.getQuestionsNum;

  get getAnsweringQuestions => m.getAnsweringQuestions;

  getAtAnsweringQuestion(i) {
    return m.getAtAnsweringQuestion(i);
  }

  Future setAnsweredValue(i, v) async {
    await m.setAnsweredValue(i, v);
  }

  Future<void> createAnsweredList(n) async {
    await m.createAnsweredList(n);
  }

  get getAnsweredValue => m.getAnsweredValue;

  void gradeQuestions() {
    m.gradesQuestions();
  }

  get getGrade => m.getGrade;

}
