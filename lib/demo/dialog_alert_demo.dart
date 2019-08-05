import 'package:flutter/material.dart';

class DialogAlertDemo extends StatefulWidget {
  @override
  _DialogAlertDemoState createState() => new _DialogAlertDemoState();
}

class _DialogAlertDemoState extends State<DialogAlertDemo> {
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
            return Container();
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
          '',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
