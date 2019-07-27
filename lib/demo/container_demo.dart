import 'package:flutter/material.dart';

class ContainerDemo extends StatefulWidget {
  @override
  _ContainerDemoState createState() => _ContainerDemoState();
}

class _ContainerDemoState extends State<ContainerDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueAccent,
      height: 100.0,
      width: 100.0,
      margin: EdgeInsets.all(10.0),
      child: Icon(
        Icons.poll,
        size: 64,
        color: Colors.white, 
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        // border: Border.all(
        //   color: Colors.red,
        //   width: 3.0,
        //   style: BorderStyle.solid
        // )
        // border: Border(top: BorderSide(
        //   color: Colors.red,
        //   width: 3.0,
        //   style: BorderStyle.solid
        // ))
        // borderRadius: BorderRadius.vertical(top: Radius.circular(10),bottom: Radius.circular(20)),
        // borderRadius: BorderRadius.circular(10.0)
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            offset: Offset(0,10),
            blurRadius: 10.0,
            spreadRadius: 2.0
        ),
        ],
        shape: BoxShape.circle,
        ///放射渐变
        // gradient: RadialGradient(
        //   colors: [
        //     Colors.pink,
        //     Colors.green,
        //   ],
        // ),
        ///线性渐变
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.green,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}
