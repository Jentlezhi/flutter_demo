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

  StreamController<String> _streamControllerDemo;

  StreamSink _sinkDemo;

  String _data = '...';

  @override
  void dispose() {
    _streamControllerDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('Creata a stream.');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // _streamControllerDemo = StreamController();
    ///多次订阅：多播
    _streamControllerDemo = StreamController.broadcast();
    _sinkDemo = _streamControllerDemo.sink;
    print('Strat listening on a stream.');
    // _subscriptionDemo = _streamDemo.listen(onData,onError: onError, onDone:onDone);
    _subscriptionDemo = _streamControllerDemo.stream
        .listen(onData, onError: onError, onDone: onDone);
    _streamControllerDemo.stream
        .listen(onDataTwo, onError: onError, onDone: onDone);
    print('Initialize completed.');
  }

  void onData(String data) {
    print('$data');
    setState(() {
      _data = data;
    });
  }

  void onDataTwo(String data) {
    print('ondataTwo:$data');
  }

  void onError(error) {
    print('Error:$error');
  }

  void onDone() {
    print('Done!');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw 'Something error.';
    return 'Hello!';
  }

  void _pauseStream() {
    print('Pause subscription');
    _subscriptionDemo.pause();
  }

  void _resumeStream() {
    print('Resume subscription');
    _subscriptionDemo.resume();
  }

  ///取消订阅没法再恢复
  void _cancelStream() {
    print('Cancel subscription');
    _subscriptionDemo.cancel();
  }

  Future _addDataToStream() async {
    print('Add data to stream.');
    String data = await fetchData();
    // _streamControllerDemo.add(data);
    _sinkDemo.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text('$_data'),
            StreamBuilder(
              stream: _streamControllerDemo.stream,
              initialData: '...',
              builder: (context,snapshot){
                return Text('${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToStream,
                ),
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
          ],
        ),
      ),
    );
  }
}
