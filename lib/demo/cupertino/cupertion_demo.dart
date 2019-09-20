import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertionDemo extends StatefulWidget {
  @override
  _CupertionDemoState createState() => new _CupertionDemoState();
}

class _CupertionDemoState extends State<CupertionDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupertion'),
      ),
      body: Center(
        child: CupertinoButton(
            child: Text("show dialog"),
            onPressed: () {
              _showDialog(context);
            }),
      ),
    );
  }
}

void _showDialog(BuildContext cxt) {
  showCupertinoModalPopup<int>(
      context: cxt,
      builder: (cxt) {
        var dialog = CupertinoActionSheet(
          title: Text("This is Title"),
          message: Text('Chose a item !'),
          cancelButton: CupertinoActionSheetAction(
              onPressed: () {}, child: Text("Cancel")),
          actions: <Widget>[
            CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(cxt, 1);
                },
                child: Text('Apple')),
            CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(cxt, 2);
                },
                child: Text('Windows')),
            CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(cxt, 3);
                },
                child: Text('Linux')),
          ],
        );
        return dialog;
      });
}