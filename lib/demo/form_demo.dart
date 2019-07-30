import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // _textEditingController.text = 'Hello';
    _textEditingController.addListener((){
      debugPrint('textChnage:${_textEditingController.text}');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: TextField(
            controller: _textEditingController,
            // onChanged: (value ){
            //   print("onChanged:$value");
            // },
            onSubmitted: (value) {
              print("onSubmitted:$value");
            },
            decoration: InputDecoration(
              icon: Icon(Icons.subject),
              labelText: 'Telphone',
              hintText: 'Please input telphone',
              hintStyle: TextStyle(color: Colors.green, fontSize: 13.0),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}