import 'package:flutter/material.dart';
import 'package:jentle_flutter/demo/popup_menu_demo.dart';

class MaterialComponentsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Components'),
        ),
        body: ListView(
          children: <Widget>[
            ListItem(
              title: 'FloatingActionButton',
              page: FloatingActionButtonDemo(),
            ),
            ListItem(
              title: 'Button',
              page: ButtonDemo(),
            ),
            ListItem(
              title: 'PopupMenu',
              page: PopupMenuDemo(),
            )
          ],
        ));
  }
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonDemo"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FlatButtonDemo(),
              RaiseButtonDemo(),
              OutLineButtonDemo(),
              ButtonBarDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        FlatButton(
          child: Text('ButtonBarBtnA'),
          onPressed: () {},
        ),
        FlatButton(
          child: Text('ButtonBarBtnB'),
          onPressed: () {},
        ),
      ],
    );
  }
}

class OutLineButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            OutlineButton(
              child: Text('OutlineButton'),
              onPressed: () {},
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
              highlightedBorderColor: Colors.green,
            ),
            SizedBox(
              width: 20.0,
            ),
            OutlineButton.icon(
              icon: Icon(Icons.add),
              label: Text('OutlineButton'),
              onPressed: () {},
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
              highlightedBorderColor: Colors.green,
              textColor: Colors.pink,
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Container(
              width: 150.0,
              child: OutlineButton(
                padding: EdgeInsets.all(10.0),
                child: Text('OutlineButtonFixWidth'),
                onPressed: () {},
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
                highlightedBorderColor: Colors.green,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: OutlineButton(
                padding: EdgeInsets.all(30.0),
                child: Text('OutlineButtonFillWidth'),
                onPressed: () {},
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
                highlightedBorderColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: OutlineButton(
                padding: EdgeInsets.all(10.0),
                child: Text('ExpandedButtonA'),
                onPressed: () {},
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
                highlightedBorderColor: Colors.green,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              flex: 2,
              child: OutlineButton(
                padding: EdgeInsets.all(10.0),
                child: Text('ExpandedButtonB-----------'),
                onPressed: () {},
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
                highlightedBorderColor: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RaiseButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text(
            'RaisedButton',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            print('RaisedButton');
          },
          color: Colors.orange,
          textColor: Colors.pink,
        ),
        SizedBox(
          width: 20.0,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text(
            'RaisedButton',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            print('RaisedButton');
          },
          color: Colors.orange,
          textColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ],
    );
  }
}

class FlatButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FlatButton(
          child: Text('FlatButton'),
          onPressed: () {
            print('FlatButton');
          },
          color: Colors.green,
        ),
        SizedBox(
          width: 20.0,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('FlatButtonIcon'),
          onPressed: () {
            print('FlatButtonIcon');
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.red,
        ),
      ],
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _floatingActionButton = FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        print("object");
      },
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );

    Widget _floatActionButtonExtended = FloatingActionButton.extended(
      icon: Icon(Icons.add),
      label: Text('add'),
      onPressed: () {
        print("FloatingActionButton.extended");
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
      ),
      body: Center(
        child: Container(
          child: Text('FloatingActionButtonDemo'),
        ),
      ),
      floatingActionButton: _floatActionButtonExtended,
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
