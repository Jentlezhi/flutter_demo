import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void increaseCount() {
    _count += 1;

    ///Should be called only by [Model] when the model has changed.
    notifyListeners();
  }
}

class ScopedModelStateManageMent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ScopedModel'),
        ),
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount,
          ),
        ),
      ),
    );
  }
}

///中间包裹件
class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Counter();
  }
}

///通过ScopedModelDescendant直接传递数据
class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) {
        return Center(
          child: ActionChip(
            label: Text('${model.count}'),
            onPressed: model.increaseCount,
          ),
        );
      },
    );
  }
}
