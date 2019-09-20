import 'package:flutter/material.dart';


class ThemeDataDemo extends StatefulWidget {
  @override
  _ThemeDataDemoState createState() => new _ThemeDataDemoState();
}

class _ThemeDataDemoState extends State<ThemeDataDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('LayoutDemo',
        style: TextStyle(fontSize: 18),
        ),
    );
  }
}