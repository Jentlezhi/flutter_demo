import 'package:flutter/material.dart';

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
          pageSnapping: true,
          controller: PageController(
            initialPage: 1,
            viewportFraction: 0.8
          ),
          children: <Widget>[
            Container(
             color: Colors.orange,
             alignment: Alignment.center,
             child: Text('ONE',style: TextStyle(fontSize: 20.0),),
          ),
          Container(
             color: Colors.blue,
             alignment: Alignment.center,
             child: Text('TWO',style: TextStyle(fontSize: 20.0),),
          ),
          Container(
             color: Colors.pink,
             alignment: Alignment.center,
             child: Text('THREE',style: TextStyle(fontSize: 20.0),),
          ),
          ],
    )
    );
  }
}