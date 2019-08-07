import 'package:flutter/material.dart';


class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => new _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  String _choice = 'Nothing';
  final _bottomSheetScaffloldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void _showBottomSheet(){
    print('_showBottomSheet');
    _bottomSheetScaffloldKey.currentState.showBottomSheet((BuildContext context){
      return BottomAppBar(
          child: Container(
            height: 90.0,
            width: double.infinity,
            color: Colors.red,
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffloldKey,
      appBar: AppBar(
        title: Text('AlertDialog'.toUpperCase()),
      ),
      body: Center(
        child: Container(
          // child: Text('Your choice is: $_choice'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showBottomSheet,
      ),
    );
  }
}