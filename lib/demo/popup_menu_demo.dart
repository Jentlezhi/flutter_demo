import 'package:flutter/material.dart';

class PopupMenuDemo extends StatefulWidget {
  @override
  _PopupMenuDemoState createState() => new _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<PopupMenuDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenu'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          PopupMenuButton(
            onSelected: (value) {
              print(value);
            },
            offset: Offset(10, 30),
            padding: EdgeInsets.all(0),
            // elevation: 0.0,
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(
                  // height: 30.0,
                  value: 'a',
                  child: Center(
                    child: Text('A'),
                  ),
                ),
                PopupMenuDivider(height: 1.0),
                // PopupMenuDivider(height: 1.0),
                PopupMenuItem(
                  // height: 20.0,
                  value: 'b',
                  child: Container(
                    // color: Colors.pink,
                    // width: 50.0,
                    child: Center(
                      child: Text('B'),
                    ),
                  ),
                ),
                PopupMenuDivider(height: 1.0),
                PopupMenuItem(
                  // height: 20.0,
                  value: 'c',
                  child: Center(
                    child: Text('C'),
                  ),
                ),
              ];
            },
          ),
          SizedBox(
            height: 30.0,
          ),
          Text("A"),
          SizedBox(
            height: 30.0,
          ),
          Text("B"),
          SizedBox(
            height: 30.0,
          ),
          Text("C"),
        ],
      )),
    );
  }
}
