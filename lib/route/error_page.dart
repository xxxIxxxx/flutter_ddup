// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyErrorPage extends StatelessWidget {
  const MyErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('出错啦'),
      ),
      body: const Text("出错啦"),
    );
  }
}
