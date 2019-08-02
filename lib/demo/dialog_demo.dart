import 'package:flutter/material.dart';

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => new _DialogDemoState();
}

enum Option { A, B, C }

class _DialogDemoState extends State<DialogDemo> {
  String _content = 'Nothing';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future _showDialog() async {
      final option = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text('我是标题', style: TextStyle(fontSize: 16.0)),
              children: <Widget>[
                SimpleDialogOption(
                  child: Text('Option A'),
                  onPressed: () => Navigator.pop(context, Option.A),
                ),
                SimpleDialogOption(
                  child: Text('Option B'),
                  onPressed: () => Navigator.pop(context, Option.B),
                ),
                SimpleDialogOption(
                  child: Text('Option C'),
                  onPressed: () => Navigator.pop(context, Option.C),
                ),
              ],
            );
          });
      switch (option) {
        case Option.A:
          _content = 'A';
          break;
        case Option.B:
          _content = 'B';
          break;
        case Option.C:
          _content = 'C';
          break;
        default:
      }
      setState(() {
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('dialog'.toUpperCase()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.menu),
        onPressed: _showDialog,
      ),
      body: Center(
        child: Text(
          'Your choice is $_content',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
