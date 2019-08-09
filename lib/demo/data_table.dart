import 'package:flutter/material.dart';
import 'package:jentle_flutter/model/post.dart';
import '../model/post.dart';
import 'dart:math';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text('手动生成表格'),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Title')),
                DataColumn(label: Text('Author')),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(
                      Text('青花瓷'),
                    ),
                    DataCell(
                      Text('周杰伦'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('一剪梅'),
                    ),
                    DataCell(
                      Text('费玉清'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('龙的传人'),
                    ),
                    DataCell(
                      Text('王力宏'),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text('列表生成表格'),
            ),
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                  label: Text('Title'),
                  onSort: (int columnIndex, bool ascending) {
                    print('columnIndex:$columnIndex,ascending:$ascending');
                    setState(() {
                      _sortColumnIndex = 0;
                      _sortAscending = ascending;
                      posts.sort((a, b) {
                        if (!ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                ),
                DataColumn(
                  label: Text('Author'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
              ],
              rows: posts.map((post) {
                return DataRow(
                    selected: post.selected,
                    onSelectChanged: (value) {
                      setState(() {
                        post.selected = value;
                      });
                    },
                    cells: [
                      DataCell(
                        Text(post.title),
                      ),
                      DataCell(
                        Text(post.author),
                      ),
                      DataCell(
                        Container(
                          // width: 60,
                          height: 30.0,
                          color: randomColor(),
                          // child: Image.network(post.imageUrl,fit: BoxFit.cover,),
                        ),
                      ),
                    ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class PostDataSource extends DataTableSource {
  int _selectedRowCount = 0;

  @override
  DataRow getRow(int index) {
    final post = posts[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          Text(post.title),
        ),
        DataCell(
          Text(post.author),
        ),
        DataCell(
          Container(
            // width: 60,
            height: 30.0,
            color: randomColor(),
            // child: Image.network(post.imageUrl,fit: BoxFit.cover,),
          ),
        ),
      ],
    );
  }

  @override
  int get rowCount => posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedRowCount;
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() =>
      new _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  final PostDataSource _postDataSource = PostDataSource();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTable'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text('分页表格'),
            ),
            PaginatedDataTable(
              rowsPerPage: 8,
              header: Text('Posts'),
              columns: [
                DataColumn(
                  label: Text('Title'),
                  onSort: (int columnIndex, bool ascending) {
                    print('columnIndex:$columnIndex,ascending:$ascending');
                    setState(() {
                      // _sortColumnIndex = 0;
                      // _sortAscending = ascending;
                      posts.sort((a, b) {
                        if (!ascending) {
                          final c = a;
                          a = b;
                          b = c;
                        }
                        return a.title.length.compareTo(b.title.length);
                      });
                    });
                  },
                ),
                DataColumn(
                  label: Text('Author'),
                ),
                DataColumn(
                  label: Text('Image'),
                ),
              ],
              source: _postDataSource,
            ),
          ],
        ),
      ),
    );
  }
}

Color randomColor() {
  return Color.fromARGB(255, Random().nextInt(256) + 0,
      Random().nextInt(256) + 0, Random().nextInt(256) + 0);
}
