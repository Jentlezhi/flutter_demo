import 'package:flutter/material.dart';

class LayoutDemo extends StatefulWidget {
  @override
  _LayoutDemoState createState() => _LayoutDemoState();
}

class _LayoutDemoState extends State<LayoutDemo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //主轴方向
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //交叉轴方向
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300.0,
            height: 100.0,
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            color: Colors.grey,
            child: Icon(Icons.alarm_add),
            alignment: Alignment.bottomCenter,
            constraints: BoxConstraints(
              minWidth: 200.0,
              minHeight: 300.0,
            ),
          ),
          IconBadge(Icons.poll, size:64.0),
          IconBadge(Icons.beach_access, size:64.0, top: 10.0,),
          IconBadge(Icons.airport_shuttle, size:64.0, top: 10.0,),
          Container(
            width: 300.0,
            height: 100.0,
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            color: Color.fromRGBO(3, 54, 255, 1.0),
            // alignment: Alignment.bottomCenter,
            constraints: BoxConstraints(
              minWidth: 200.0,
              minHeight: 300.0,
            ),
            child: Stack(
              ///Color.fromRGBO(3, 54, 255, 1.0),
              alignment: Alignment.topLeft,
              children: <Widget>[
                Container(
                  // alignment: Alignment(0.0, 0.0),
                  width: 100,
                  height: 100,
                  child: Icon(Icons.brightness_2,size: 32,color: Colors.white,),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Color.fromRGBO(7, 102, 255, 1.0),
                        Color.fromRGBO(3, 54, 255, 1.0),
                      ]
                    ),
                  ),
                ),
                Positioned(
                  right: 20, 
                  top: 20,
                  child: Container(
                  child: Icon(Icons.ac_unit,size: 20.0,color: Colors.white,),
                ),
                ),
                Positioned(
                  right: 40, 
                  top: 80,
                  child: Container(
                  child: Icon(Icons.ac_unit,size: 16.0,color: Colors.white,),
                ),
                ),
                Positioned(
                  right: 20, 
                  top: 100,
                  child: Container(
                  child: Icon(Icons.ac_unit,size: 10.0,color: Colors.white,),
                ),
                ),
                Positioned(
                  right: 50, 
                  top: 130,
                  child: Container(
                  child: Icon(Icons.ac_unit,size: 25.0,color: Colors.white,),
                ),
                ),
                Positioned(
                  right: 80, 
                  top: 100,
                  child: Container(
                  child: Icon(Icons.ac_unit,size: 18.0,color: Colors.white,),
                ),
                ),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: AspectRatio(
              aspectRatio: 3.0/2.0,
              child: Container(
                color: Color.fromRGBO(3, 54, 255, 1.0),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 100.0,
              
            ),
            child: Container(
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {

  final IconData icon;
  final double size;
  final double top;

  const IconBadge(this.icon,{
    this.size = 32.0,
    this.top = 0.0,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top),
      child: Icon(icon,size: size, color: Colors.white,),
      width: size + 60.0,
      height: size + 60.0,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}