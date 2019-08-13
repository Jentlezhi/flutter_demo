import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatefulWidget {
  @override
  _RxDartDemoState createState() => new _RxDartDemoState();
}

class _RxDartDemoState extends State<RxDartDemo> {
  List<String> _listData = [];
  @override
  void initState() {
    super.initState();
    Observable<int> _observable = Observable.concat([
      Observable.timer(1,Duration(seconds: 2)),
      Stream.fromIterable([2, 4, 6]),
      Stream.fromIterable([3, 6, 9])
    ]).interval(Duration(seconds: 1));
    // Observable(
    // Stream.fromIterable([1, 2, 3, 4, 5, 6])).map((item)=>item*item).interval(Duration(seconds: 1));
    // Observable.fromFuture(Future.value('future_hello'));
    // Observable.just('hello');
    // Observable.periodic(Duration(seconds: 2),(x) => x.toString());
    _observable.every((item) => item < 6).asObservable().listen(_onData);

    // PublishSubject<String> _subject = PublishSubject<String>();
  }

  void _onData(data) {
    print('$data');
    setState(() {
      _listData.add('$data');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart'),
      ),
      body: Center(
        child: Text(
          _listData.toString(),
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
