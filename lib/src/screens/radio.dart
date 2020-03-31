import 'package:flutter/material.dart';
import 'package:flutter_app/src/controller/index.dart';

/// statefulwidgets to keep track of user input value
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget(List list, Controller c, int i, {Key key}) : super(key: key) {
    this.list = list;
    this.c = c;
    this.i = i;
  }
  List list;
  Controller c;
  int i;

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(list, c, i);
}

/// A class where actual radio buttons will be created
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var _character;
  List list;
  Controller c;
  int i;

  _MyStatefulWidgetState(list, Controller c, int i) {
    this.list = list;
    this.c = c;
    this.i = i;
  }
   /// creates radio buttons
  Widget build(BuildContext context) {
    return Column(
      children: list
          .map<Widget>((data) => RadioListTile(
                title: Text("$data"),
                groupValue: _character,
                value: data,
                onChanged: (v) async {
                  // update value
                  setState(() {
                    _character = v;
                  });
                  // i:quiz index, user's answer
                  c.setAnsweredValue(i, list.indexOf(v)+1);
                },
              ))
          .toList(),
    );
  }
}
