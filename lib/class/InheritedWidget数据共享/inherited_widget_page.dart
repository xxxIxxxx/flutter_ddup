// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ddup/class/InheritedWidget%E6%95%B0%E6%8D%AE%E5%85%B1%E4%BA%AB/share_data_widget.dart';

class InheritedWidgetPage extends StatefulWidget {
  const InheritedWidgetPage({Key? key}) : super(key: key);

  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  int _count = 7;
  bool _change = true;
  @override
  Widget build(BuildContext context) {
    print("big build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget'),
      ),
      body: ShareDataWidget(
        data: _count,
        child: Column(children: <Widget>[
          const InheritedCountWidget(),
          if (_change) const InheritedCounterWidget2(),
          if (_change) const InheritedCounterWidget3(),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: const Text("add")),
          ElevatedButton(
              onPressed: () {
                setState(() => _change = false);

                Timer.periodic(const Duration(milliseconds: 20), (timer) {
                  timer.cancel();
                  if (mounted) {
                    setState(() => _change = true);
                  }
                });
              },
              child: const Text("刷新 2，3 。 间隔太短 可能刷新不成功，就是测试用的")),
        ]),
      ),
    );
  }
}

class InheritedCountWidget extends StatefulWidget {
  const InheritedCountWidget({Key? key}) : super(key: key);

  @override
  State<InheritedCountWidget> createState() => _InheritedCountWidgetState();
}

class _InheritedCountWidgetState extends State<InheritedCountWidget> {
  @override
  Widget build(BuildContext context) {
    print("InheritedCountWidget  build");
    //* 如果在 build 中不用这个数据 那么不会刷新
    return Text(
        "使用共有的父组件 ShareDataWidget 读取到的数据      " +
            (ShareDataWidget.of(context)?.data.toString() ?? ''),
        style: Theme.of(context).textTheme.headline6);
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();
  }
}

class InheritedCounterWidget2 extends StatelessWidget {
  const InheritedCounterWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("InheritedCounterWidget222 build");
    return Container(
      color: Colors.amberAccent,
      child: Text(
          "stl InheritedCounterWidget2 使用只读" +
              (ShareDataWidget.onlyRead(context)?.data.toString() ?? ''),
          style: Theme.of(context).textTheme.headline6),
    );
  }
}

class InheritedCounterWidget3 extends StatefulWidget {
  const InheritedCounterWidget3({Key? key}) : super(key: key);

  @override
  State<InheritedCounterWidget3> createState() => _InheritedCounterWidget3();
}

class _InheritedCounterWidget3 extends State<InheritedCounterWidget3> {
  @override
  Widget build(BuildContext context) {
    print("InheritedCounterWidget333  build");
    return Container(
      color: Colors.purpleAccent,
      child: Text(
          "stf InheritedCounterWidget3 使用只读" +
              (ShareDataWidget.onlyRead(context)?.data.toString() ?? ''),
          style: Theme.of(context).textTheme.headline6),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies  333");
  }
}
