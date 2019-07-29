import 'package:flutter/material.dart';

class GridViewExtentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 160.0,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      // scrollDirection: Axis.vertical,
      children: _buildItems(num: 100),
    );
  }

  List<Widget> _buildItems({int num}) {
    return List.generate(num, (int index) {
      return Container(
        child: Center(
          child: Text(
            '$index',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        alignment: Alignment.center,
        color: Colors.pink,
      );
    });
  }
}
