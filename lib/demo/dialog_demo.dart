import 'package:flutter/material.dart';
import 'dart:async';

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

enum Option{
  A,B,C
}

class _DialogDemoState extends State<DialogDemo> {

  String _choice = 'Nothing';
  Future _openSimpleDialog() async{
    final option = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return SimpleDialog(
          title: Text('我是标题',style: TextStyle(fontSize: 14.0),),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Option A'),
              onPressed: (){
                Navigator.pop(context,Option.A);
              },
            ),
            SimpleDialogOption(
              child: Text('Option B'),
              onPressed: (){
                debugPrint('onPressed1');
                Navigator.pop(context,Option.B);
              },
            ),
            SimpleDialogOption(
              child: Text('Option C'),
              onPressed: (){
                Navigator.pop(context,Option.C);
              },
            ),
          ],
        );
      }
    );
    switch (option) {
      case Option.A:
        _choice = 'A';
        break;
      case Option.B:
        _choice = 'B';
        break;
      case Option.C:
        _choice = 'C';
        break;
      default:
    }
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'.toUpperCase()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.show_chart),
        onPressed: _openSimpleDialog,
      ),
      body: Container(
      child: Center(
        child: Text('Your choice is $_choice'),
      ),
    ),
    );
  }
}