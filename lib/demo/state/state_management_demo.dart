import 'dart:convert';

import 'package:flutter/material.dart';

// class StateManageMentDemo extends StatelessWidget {
//   int _count = 0;
//   @override
//   Widget build(BuildContext context) {
// return Scaffold(
//   appBar: AppBar(
//     title: Text('StateManagement'),
//   ),
//   body: Center(
//       child: Chip(
//     label: Text('$_count'),
//   )),
//   floatingActionButton: FloatingActionButton(
//     child: Icon(Icons.add),
//     onPressed: () {
//       _count += 1;
//       print('count:$_count');
//     },
//   ),
// );
//   }
// }

class StateManageMentDemo extends StatefulWidget {
  @override
  _StateManageMentDemoState createState() => new _StateManageMentDemoState();
}

class _StateManageMentDemoState extends State<StateManageMentDemo> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
  }

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('StateManagement'),
  //     ),
  //     body: CounterWrapper(_count, _increaseCount),
  //     floatingActionButton: FloatingActionButton(
  //       child: Icon(Icons.add),
  //       onPressed: _increaseCount,
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagement'),
        ),
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}

///boby：单独提出来
// class Counter extends StatelessWidget {
//   final int count;
//   final VoidCallback increaseCount;
//   Counter(this.count, this.increaseCount);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: ActionChip(
//           label: Text('$count'),
//           onPressed: increaseCount,
//         ),
//       ),
//     );
//   }
// }

///中间添加CounterWrapper
// class CounterWrapper extends StatelessWidget {
//   final int count;
//   final VoidCallback increaseCount;
//   CounterWrapper(this.count, this.increaseCount);
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Counter(count, increaseCount),
//     );
//   }
// }
class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

// class Counter extends StatelessWidget {
//   final int count;
//   final VoidCallback increaseCount;
//   Counter(this.count, this.increaseCount);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: ActionChip(
//           label: Text('$count'),
//           onPressed: increaseCount,
//         ),
//       ),
//     );
//   }
// }
class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;
    return Center(
      child: Container(
        child: ActionChip(
          label: Text('$count'),
          onPressed: increaseCount,
        ),
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child);

///静态方法：获取给定类型的最近窗口小部件
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
