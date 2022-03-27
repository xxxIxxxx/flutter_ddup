// ignore_for_file: file_names

import 'package:flutter/material.dart';

///路由传值
class TipRoutePage extends StatelessWidget {
  const TipRoutePage({Key? key, required this.tipStr}) : super(key: key);
  final String tipStr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由传值'),
      ),
      body: Column(
        children: <Widget>[
          Text(tipStr),
          ElevatedButton(
            child: const Text('返回并传值'),
            onPressed: () {
              // 返回并传值
              Navigator.pop(context, '我是返回值');
            },
          )
        ],
      ),
    );
  }
}
