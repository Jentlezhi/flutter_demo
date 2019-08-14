import 'package:flutter/material.dart';

import 'bloc_demo.dart';

class CounterHome extends StatefulWidget {

  @override
  _CounterHomeState createState() => new _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
        child: StreamBuilder(
          initialData: 0,
          stream: _counterBloc.count,
          builder: (context,snapShot){
            return ActionChip(
          label: Text('${snapShot.data}'),
          onPressed: (){
            _counterBloc.counter.add(1);
            _counterBloc.log();
          },
        );
          },
        ),
      );
  }
}