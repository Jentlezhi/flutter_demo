import 'package:flutter/material.dart';
import '../model/post.dart';
import 'data_table.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => new _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
      ),
      body: ListView(
        children: posts.map((post) {
          return Card(
            child: Column(
              children: <Widget>[
                // Text(post.title),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0)),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Container(
                      color: randomColor(),
                    ),
                    // child: Image.network(post.imageUrl),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(post.description),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
