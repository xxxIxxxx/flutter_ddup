// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'default_tab_controller_page.dart';

class TabBarViewPage extends StatefulWidget {
  const TabBarViewPage({Key? key}) : super(key: key);

  @override
  _TabBarViewPageState createState() => _TabBarViewPageState();
}

class _TabBarViewPageState extends State<TabBarViewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> labs = ['Tab1', 'Tab2', 'Tab3'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBarView'),
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            indicatorWeight: 5,
            tabs: labs.map((e) => Text(e)).toList()),
      ),
      body: TabBarView(
          controller: _tabController,
          children: labs.map((e) => TabBarPage(text: e)).toList()),
    );
  }
}

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
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
            "TabBarView 和 TabBar 持有一个共同的 TabController \n TabController 需要释放"),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DefaultTabControllerPage();
              }));
            },
            child: const Text("使用 DefaultTabController"))
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
