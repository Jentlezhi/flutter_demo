import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => new _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banan',
    'Lemon',
    'Peach',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'Banan',
              'Lemon',
              'Peach',
            ];
          });
        },
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 10.0,
          runSpacing: 1.0,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // SizedBox(width: 10.0,),
            Chip(
              label: Text('Life'),
            ),
            // SizedBox(width: 10.0,),
            Chip(
              label: Text('is'),
              backgroundColor: Colors.orange,
            ),
            // SizedBox(width: 10.0,),
            Chip(
                label: Text('so'),
                labelStyle: TextStyle(color: Colors.red),
                // labelPadding: EdgeInsets.all(1.0),
                // deleteIcon: Icon(Icons.delete),
                avatar: CircleAvatar(
                  child: Text('S'),
                  backgroundColor: Colors.black,
                )),
            // SizedBox(width: 10.0,),
            Chip(
                label: Text('good'),
                avatar: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'http://i2.sinaimg.cn/ast/t/2013-08-30/U5593P54T3D98619F63DT20130830114013.jpg'),
                  backgroundColor: Colors.black,
                )),
            // SizedBox(width: 10.0,),
            Chip(
                label: Text('Google'),
                avatar: CircleAvatar(
                  child: Text('G'),
                  backgroundColor: Colors.black,
                )),
            Chip(
                label: Text('Apple'),
                onDeleted: () {},
                deleteIcon: Icon(Icons.delete),
                deleteButtonTooltipMessage: "",
                avatar: CircleAvatar(
                  child: Text('G'),
                  backgroundColor: Colors.black,
                )),
            Divider(
              color: Colors.grey,
              height: 0.5,
              indent: 10.0,
              endIndent: 10.0,
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  onDeleted: () {
                    setState(() {
                      _tags.remove(tag);
                    });
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
