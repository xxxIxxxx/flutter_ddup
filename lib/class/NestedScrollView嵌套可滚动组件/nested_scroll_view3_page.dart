import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class NestedScrollView3Page extends StatefulWidget {
  const NestedScrollView3Page({Key? key}) : super(key: key);

  @override
  _NestedScrollView3PageState createState() => _NestedScrollView3PageState();
}

class _NestedScrollView3PageState extends State<NestedScrollView3Page> {
  final List<String> labs = ["水果", "饮品", "干粮"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('NestedScrollView3'),
        // ),
        body: DefaultTabController(
      length: labs.length,
      child: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 200.0,
                // 是否一直显示阴影
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('NestedScrollView'),
                  ),
                  background: Assets.images.cat.image(fit: BoxFit.cover),
                ),
                bottom: TabBar(tabs: labs.map((e) => Tab(text: e)).toList()),
              ),
            ];
          }),
          body: TabBarView(
              children: labs.map((e) {
            return Builder(builder: ((context) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      height: 100,
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: Text(e),
                    );
                  }, childCount: 10)),
                ],
              );
            }));
          }).toList())),
    ));
  }
}
