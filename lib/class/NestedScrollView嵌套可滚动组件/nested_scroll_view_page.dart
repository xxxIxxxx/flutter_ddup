import 'package:flutter/material.dart';
import 'package:flutter_ddup/gen/assets.gen.dart';

import 'nested_scroll_view2_page.dart';
import 'nested_scroll_view3_page.dart';

class NestedScrollViewPage extends StatefulWidget {
  const NestedScrollViewPage({Key? key}) : super(key: key);

  @override
  _NestedScrollViewPageState createState() => _NestedScrollViewPageState();
}

class _NestedScrollViewPageState extends State<NestedScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: ((context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
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
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NestedScrollView2Page()));
                    },
                    child: const Text('解决动画问题 SliverOverlapAbsorber')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NestedScrollView3Page()));
                    },
                    child: const Text('结合 TabBar')),
              ],
            ),
          ),
        ];
      }),
      body: ListView.separated(
        itemCount: 100,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return const ListTile(
            title: Text("动画有点问题，因为 SliverAppBar snap 为 true"),
          );
        },
      ),
    ));
  }
}
