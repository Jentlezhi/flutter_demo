import 'package:flutter/material.dart';

class TextDemo extends StatefulWidget {
  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.lightBlue,
      child: Column(
        children: <Widget>[
          SizedBox(height: 30.0,),
          Text('hello',style: TextStyle(color: Colors.black38,fontSize: 20.0),),
          RichText(text: TextSpan(
            text: 'G',
            style: TextStyle(color: Color.fromRGBO(80, 135, 236, 1.0),fontSize: 20.0),
            children: [
              TextSpan(
                text: 'o',	
                style: TextStyle(color: Color.fromRGBO(217, 80, 63, 1.0),fontSize: 20.0),
              ),
              TextSpan(
                text: 'o',	
                style: TextStyle(color:Color.fromRGBO(242, 189, 66, 1.0),fontSize: 20.0),
              ),
              TextSpan(
                text: 'g',	
                style: TextStyle(color: Color.fromRGBO(80, 135, 236, 1.0),fontSize: 20.0),
              ),
              TextSpan(
                text: 'l',	
                style: TextStyle(color: Color.fromRGBO(88, 165, 92, 1.0),fontSize: 20.0),
              ),
              TextSpan(
                text: 'e',
                style: TextStyle(color: Color.fromRGBO(217, 80, 63, 1.0),fontSize: 20.0),
              ),
            ]
          ),)
        ],
      ),
    );
  }
}