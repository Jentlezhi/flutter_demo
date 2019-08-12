import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {

  StreamSubscription _subscriptionDemo;

  @override
  void initState() {
    super.initState();
    print('Creata a stream.');
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print('Strat listening on a stream.');
    _subscriptionDemo = _streamDemo.listen(onData,onError: onError, onDone:onDone);
    print('Initialize completed.');
  }

  void onData(String data){
    print('$data');
  }

  void onError(error){
    print('Error:$error');
  }

  void onDone(){
    print('Done!');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw 'Something error.';
    return 'Hello!';
  }

  void _pauseStream(){
    print('Pause subsciption');
    _subscriptionDemo.pause();
  }

  void _resumeStream(){
    print('Resume subsciption');
    _subscriptionDemo.resume();
  }

///取消订阅没法再恢复
  void _cancelStream(){
    print('Cancel subsciption');
    _subscriptionDemo.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('Pause'),
              onPressed: _pauseStream,
            ),
            FlatButton(
              child: Text('Resume'),
              onPressed: _resumeStream,
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: _cancelStream,
            ),
          ],
        ),
      ),
    );
  }
}
