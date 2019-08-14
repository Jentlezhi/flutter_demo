import 'package:flutter/material.dart';

import 'bloc_demo.dart';

class CounterActionButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        _counterBloc.counter.add(1);
        _counterBloc.log();
      },
    );
  }
}