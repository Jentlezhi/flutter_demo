import 'dart:async';

import 'package:flutter/material.dart';

import 'counter_block_demo.dart';
import 'counter_floating_action_button_demo.dart';

class BlocDemo extends StatefulWidget {
  @override
  _BlocDemoState createState() => new _BlocDemoState();
}

class _BlocDemoState extends State<BlocDemo> {
  int _count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BLoC'),
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  CounterProvider({this.child, this.bloc});

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;
  final StreamController _addStreamController = StreamController<int>();
  StreamSink<int> get counter => _addStreamController.sink;

  final StreamController _countStreamController = StreamController<int>();
  Stream<int> get count => _countStreamController.stream;

  CounterBloc() {
    _addStreamController.stream.listen(_onData);
  }

  void log() {
    print('BLoC');
  }

  void _onData(value) {
    // print(value);
    // print(value.runtimeType);
    _count = _count + value;
    _countStreamController.add(_count);
  }

  void dispose() {
    _addStreamController.close();
  }
}
