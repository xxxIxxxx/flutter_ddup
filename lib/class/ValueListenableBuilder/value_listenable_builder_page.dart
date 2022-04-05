// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ValueListenableBuilderPage extends StatefulWidget {
  const ValueListenableBuilderPage({Key? key}) : super(key: key);

  @override
  _ValueListenableBuilderPageState createState() =>
      _ValueListenableBuilderPageState();
}

class _ValueListenableBuilderPageState
    extends State<ValueListenableBuilderPage> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    print(" _ValueListenableBuilderPageState build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueListenableBuilder'),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _counter,
            builder: (BuildContext context, dynamic value, Widget? child) {
              print("ValueListenableBuilder  build");
              return Center(
                child: Text(
                    "可以看到控制台只有 ValueListenableBuilder 组件 build \n ${_counter.value}",
                    textScaleFactor: 2.0),
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                //* 通过.value 读取值 并改变， 不用  setState(() {  });
                _counter.value += 1;
              },
              child: const Text("add   不用  setState(() {  });"))
        ],
      ),
    );
  }
}
