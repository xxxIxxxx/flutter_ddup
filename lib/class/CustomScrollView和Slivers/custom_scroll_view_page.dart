import 'package:flutter/material.dart';
import 'package:flutter_ddup/class/CustomScrollView%E5%92%8CSlivers/sliver_header_delegate.dart';
import 'package:flutter_ddup/gen/assets.gen.dart';

class CustomScrollViewPage extends StatefulWidget {
  const CustomScrollViewPage({Key? key}) : super(key: key);

  @override
  _CustomScrollViewPageState createState() => _CustomScrollViewPageState();
}

class _CustomScrollViewPageState extends State<CustomScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    var sliverAppBar = SliverAppBar(
      pinned: true,
      title: const Text('CustomScrollView'),
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
          // Assets.images.cat.image(height: 100, width: 100, fit: BoxFit.cover),
          background: Assets.images.cat.image(fit: BoxFit.cover)),
    );

    var listView = SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  color: Colors.greenAccent,
                  child: ListTile(
                    title: Text("SliverFixedExtentList $index"),
                  ),
                ),
            childCount: 5),
        itemExtent: 60);

    var gridView = SliverGrid(
      delegate: SliverChildListDelegate(
        List.generate(
            5,
            (index) => Container(
                  color: Colors.redAccent,
                  child: ListTile(title: Text("SliverGrid $index")),
                )),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
    );

    var sliverList = SliverList(
        delegate: SliverChildListDelegate(
      List.generate(
          25,
          (index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: Colors.amber,
                child: ListTile(title: Text("SliverList $index")),
              )),
    ));

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('CustomScrollView'),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppBar,
          SliverToBoxAdapter(
            child: Container(
              color: Colors.blue,
              height: 88,
              child: const Text("SliverToBoxAdapter 可以将一个不是 Sliver 的组件包装起来"),
            ),
          ),
          listView,
          SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegate(
                  maxHeight: 100,
                  minHeight: 100,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    color: Colors.purpleAccent,
                    child: const Text(
                        "SliverPersistentHeader 可悬浮的 Header，需要自己实现一个协议类"),
                  ))),
          // SliverPadding 子组件必须也是 Sliver·
          SliverPadding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0), sliver: gridView),
          SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegate(
                  maxHeight: 100,
                  minHeight: 100,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    color: Colors.purpleAccent,
                    child: const Text(
                        "SliverPersistentHeader 可悬浮的 Header，需要自己实现一个协议类"),
                  ))),
          SliverOpacity(opacity: 0.3, sliver: sliverList),
        ],
      ),
    );
  }
}
