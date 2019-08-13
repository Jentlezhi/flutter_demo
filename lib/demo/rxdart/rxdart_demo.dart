import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatefulWidget {
  @override
  _RxDartDemoState createState() => new _RxDartDemoState();
}

class _RxDartDemoState extends State<RxDartDemo> {
  @override
  void initState() {
    super.initState();
    Observable<String> _observable = 
    // Observable(Stream.fromIterable(['hello','你好']));
    // Observable.fromFuture(Future.value('future_hello'));
    // Observable.just('hello');
    Observable.periodic(Duration(seconds: 2),(x) => x.toString());
    _observable.listen(_onData);
  }

  void _onData(data){
    print('$data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart'),
      ),
      body: Center(
        child: Text(
          'LayoutDemo',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
