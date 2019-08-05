import 'package:flutter/material.dart';
import 'dart:async';

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

enum Option { A, B, C }

class _DialogDemoState extends State<DialogDemo> {
  String _choice = 'Nothing';
  Future _openSimpleDialog() async {
    final option = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(
              '我是标题',
              style: TextStyle(fontSize: 14.0),
            ),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Option A'),
                onPressed: () {
                  Navigator.pop(context, Option.A);
                },
              ),
              SimpleDialogOption(
                child: Text('Option B'),
                onPressed: () {
                  debugPrint('onPressed1');
                  Navigator.pop(context, Option.B);
                },
              ),
              SimpleDialogOption(
                child: Text('Option C'),
                onPressed: () {
                  Navigator.pop(context, Option.C);
                },
              ),
            ],
          );
        });
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
    setState(() {});
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

enum Action {
  Ok,
  Cancel,
}

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Nothing';
  Future _showAlert()async {
     final result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('Are you sure about this?'),
            actions: <Widget>[
              FlatButton(
                child: Text('ok'),
                onPressed: (){
                  Navigator.pop(context,Action.Ok);
                },
              ),
              FlatButton(
                child: Text('cancel'),
                onPressed: (){
                  Navigator.pop(context,Action.Cancel);
                },
              ),
            ],
          );
        });
        switch (result) {
          case Action.Ok:
            setState(() {
              _choice = 'Ok';
            });
            break;
          case Action.Cancel:
            setState(() {
              _choice = 'Cancel';
            });
            break;
          default:
            _choice = 'Nothing';
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialog'.toUpperCase()),
      ),
      body: Center(
        child: Container(
          child: Text('Your choice is: $_choice'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAlert,
      ),
    );
  }
}
