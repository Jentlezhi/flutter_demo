import 'package:flutter/material.dart';
import 'package:jentle_flutter/demo/container_demo.dart';
import 'package:jentle_flutter/demo/text_demo.dart';

class BasicDemo extends StatefulWidget {
  @override
  _BasicDemoState createState() => _BasicDemoState();
}

class _BasicDemoState extends State<BasicDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://photo.16pic.com/00/54/12/16pic_5412218_b.jpg'),
              fit: BoxFit.cover    
                  )),
      child: Column(
        ///主轴方向
        mainAxisAlignment: MainAxisAlignment.center,

        ///交叉轴方向
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextDemo(),
          ContainerDemo(),
        ],
      ),
      // child: TextDemo(),
    );
  }
}
