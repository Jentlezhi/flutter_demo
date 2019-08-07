import 'package:flutter/material.dart';

class BottomSheetDialog extends StatefulWidget {
  @override
  _BottomSheetDialogState createState() => new _BottomSheetDialogState();
}

enum Option { A, B, C }

class _BottomSheetDialogState extends State<BottomSheetDialog> {
  String _content = 'Nothing';
  @override
  void initState() {
    super.initState();
  }

  void _openBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context, Option.A);
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context, Option.B);
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context, Option.B);
                  },
                ),
              ],
            ),
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

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomSheetDialog'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text("Open BottomSheet"),
            onPressed: _openBottomSheet,
          ),
          SizedBox(height: 30,),
          Text(
            'Your choice is $_content',
          )
        ],
      )),
    );
  }
}
