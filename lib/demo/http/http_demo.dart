import 'dart:convert';
import 'package:gbk2utf8/gbk2utf8.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => new _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  String _responseJson = '';
  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  void fetchPost() async {
    final response = await http.get(
        'https://tcc.taobao.com/cc/json/mobile_tel_segment.htm?tel=13223452345');
    setState(() {
      ///解决中文乱码
       _responseJson = gbk.decode(response.bodyBytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http'),
      ),
      body: Center(
        child: Text('$_responseJson'),
      ),
    );
  }
}
