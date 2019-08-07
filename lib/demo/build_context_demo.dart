import 'package:flutter/material.dart';


class BuildContextDemo extends StatefulWidget {
  @override
  _BuildContextDemoState createState() => new _BuildContextDemoState();
}

class _BuildContextDemoState extends State<BuildContextDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('跳转'),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
          },
        ),
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: Container(
        color: Colors.blueAccent,
      ),
    );
  }
}