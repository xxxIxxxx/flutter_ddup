// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class DefaultTabControllerPage extends StatefulWidget {
  const DefaultTabControllerPage({Key? key}) : super(key: key);

  @override
  _DefaultTabControllerPageState createState() =>
      _DefaultTabControllerPageState();
}

class _DefaultTabControllerPageState extends State<DefaultTabControllerPage> {
  List<String> labs = ['Tab1', 'Tab2', 'Tab3'];
  @override
  Widget build(BuildContext context) {
    //* 设置一个默认的 DefaultTabController 可以减少混入 以及生命周期管理
    return DefaultTabController(
        length: labs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('DefaultTabController'),
            bottom: TabBar(
                indicatorColor: Colors.black,
                indicatorWeight: 5,
                tabs: labs.map((e) => Text(e)).toList()),
          ),
          body: TabBarView(
              children: labs.map((e) => TabBarPage2(text: e)).toList()),
        ));
  }
}

class TabBarPage2 extends StatefulWidget {
  const TabBarPage2({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<TabBarPage2> createState() => _TabBarPage2State();
}

class _TabBarPage2State extends State<TabBarPage2>
    with AutomaticKeepAliveClientMixin {
  //* 使用 AutomaticKeepAliveClientMixin 保持页面缓存
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("build" + widget.text);
    return Container(
      color: Colors.deepOrange,
      child: Column(children: [
        Text(widget.text),
        const Text(
            "TabBarView 和 TabBar 没有主动设置 TabController  他们会向父级查找 TabController"),
        const Text("设置一个默认的 DefaultTabController 可以减少混入 以及生命周期管理"),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("返回"))
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
