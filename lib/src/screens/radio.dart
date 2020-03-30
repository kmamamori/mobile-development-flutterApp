import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget(List list, {Key key}) : super(key: key) {
    this.list = list;
  }
  List list;

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(list);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var _character;
  List list;

  _MyStatefulWidgetState(list) {
    this.list = list;
  }

  Widget build(BuildContext context) {
    return Column(
      children: list
          .map<Widget>((data) => RadioListTile(
                title: Text("$data"),
                groupValue: _character,
                value: data,
                onChanged: (v) async {
                  print(v);
                  setState(() {
                    _character = v;
                  });
                },
              ))
          .toList(),
    );
  }
}
