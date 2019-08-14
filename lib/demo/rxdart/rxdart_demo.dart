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
    // Observable<int> _observable = Observable.concat([
    //   Observable.timer(1,Duration(seconds: 2)),
    //   Stream.fromIterable([2, 4, 6]),
    //   Stream.fromIterable([3, 6, 9])
    // ]).interval(Duration(seconds: 1));
    // Observable(
    // Stream.fromIterable([1, 2, 3, 4, 5, 6])).map((item)=>item*item).interval(Duration(seconds: 1));
    // Observable.fromFuture(Future.value('future_hello'));
    // Observable.just('hello');
    // Observable.periodic(Duration(seconds: 2),(x) => x.toString());
    // _observable.every((item) => item < 6).asObservable().listen(_onData);

    ///先订阅，再添加数据
    //   PublishSubject<String> _subject = PublishSubject<String>();
    //   _subject.listen(_onDataOne);
    //   _subject.add('one');
    //   _subject.listen(_onData);
    //   _subject.add('two');
    //   _subject.add('three');
    // }

    ///BehaviorSubject
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();
    // _subject.listen(_onDataOne);
    // _subject.add('one');
    // _subject.add('two');

    ///只要有数据流就会调用，不关心调用顺序，但是设置最大接收数据时候需先添加 再订阅
    ReplaySubject _subject = ReplaySubject<String>(maxSize: 2);

    _subject.add('hello');
    _subject.add('hi');
    _subject.add('hola');

    _subject.listen(_onData);
    _subject.listen(_onDataOne);

  }

  void _onData(data) {
    print('$data');
    setState(() {
      _listData.add('onData:$data');
    });
  }

  void _onDataOne(data) {
    print('onDataOne:$data');
    setState(() {
      _listData.add('onDataOne:$data');
    });
  }

  void _onDataTwo(data) {
    print('onDataTwo:$data');
    setState(() {
      _listData.add('onDataTwo:$data');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Text(
            _listData.toString(),
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
