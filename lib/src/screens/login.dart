import "package:flutter/material.dart";

import 'package:flutter_app/src/model/index.dart';
import 'package:flutter_app/src/view/index.dart';
import 'package:flutter_app/src/controller/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class LoginData {
  String username = "";
  String pin = "";
}

class _MyApp extends State {
  LoginData _loginData = new LoginData();
  static View v = View();
  static Model m = Model();
  Controller c = Controller(m, v);
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext inContext) {
    print('Login');
    return MaterialApp(
        home: Scaffold(
            body: Container(
                padding: EdgeInsets.all(50.0),
                child: Form(
                    key: this._formKey,
                    child: Column(children: [
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (String inValue) {
                            if (inValue.length == 0) {
                              return "Please enter username";
                            }
                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.username = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "username", labelText: "Username")),
                      TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          validator: (String inValue) {
                            if (inValue.length != 4) {
                              return "Pin must be ==4 in length";
                            }
                            return null;
                          },
                          onSaved: (String inValue) {
                            this._loginData.pin = inValue;
                          },
                          decoration: InputDecoration(
                              hintText: "Pin", labelText: "Pin")),
                      RaisedButton(
                          child: Text("Log In!"),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              if (await c.login(
                                      _loginData.username, _loginData.pin) ==
                                  true) {
                                Navigator.pushNamed(context, 'createQuiz',
                                    arguments: {'c': c});
                              } else {
                                return false;
                              }
                            } else {
                              return false;
                            }
                          })
                    ])))));
  }
}
