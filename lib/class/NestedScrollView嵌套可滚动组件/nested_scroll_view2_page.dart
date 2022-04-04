import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class NestedScrollView2Page extends StatefulWidget {
  const NestedScrollView2Page({Key? key}) : super(key: key);

  @override
  _NestedScrollView2PageState createState() => _NestedScrollView2PageState();
}

class _NestedScrollView2PageState extends State<NestedScrollView2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
      return <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 200.0,
            // 是否一直显示阴影
            forceElevated: innerBoxIsScrolled,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('NestedScrollView'),
              background: Assets.images.cat.image(fit: BoxFit.cover),
            ),
          ),
        ),
      ];
    }), body: Builder(builder: (BuildContext context) {
      return CustomScrollView(
        slivers: <Widget>[
          SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return const ListTile(
              title: Text(
                  "SliverOverlapAbsorber + SliverOverlapInjector 也还是有点问题啊。。  还是不要 snap = true 的好"),
            );
          }, childCount: 20)),
        ],
      );
    })));
  }
}
