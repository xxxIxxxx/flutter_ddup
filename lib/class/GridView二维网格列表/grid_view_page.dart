import 'package:flutter/material.dart';

enum GridViewType {
  normal,
  builder,
  extent,
  count,
}

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  late List<Widget> widgetList = [];
  GridViewType gridViewType = GridViewType.normal;
  late Widget gridView;

  //* 确定数量
  SliverGridDelegateWithFixedCrossAxisCount
      sliverGridDelegateWithFixedCrossAxisCount =
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    // 主轴间距
    mainAxisSpacing: 8,
    // 交叉轴间距
    crossAxisSpacing: 8,
    // 交叉轴边长 / 主轴边长
    // childAspectRatio: 3.0,
  );

  //* 确定宽度
  SliverGridDelegateWithMaxCrossAxisExtent
      sliverGridDelegateWithMaxCrossAxisExtent =
      const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    mainAxisExtent: 300,
  );
  bool isCount = false;

  @override
  void initState() {
    super.initState();
    initGridView();
  }

  initData() {
    String text = "";
    Color color;
    switch (gridViewType) {
      case GridViewType.normal:
        text = "GridView 默认构造函数";
        color = Colors.amberAccent;
        break;
      case GridViewType.builder:
        text = "GridView.builder 构造函数";
        color = Colors.greenAccent;
        break;
      case GridViewType.extent:
        text = "GridView.extent 构造函数";
        color = Colors.blueAccent;
        break;
      case GridViewType.count:
        text = "GridView.count 构造函数";
        color = Colors.purpleAccent;
        break;
    }
    widgetList = [];
    for (var i = 0; i < 100; i++) {
      Widget w = Container(
        alignment: Alignment.center,
        color: color,
        child: Text(text + "$i"),
      );
      widgetList.add(w);
    }
  }

  initGridView() {
    initData();
    switch (gridViewType) {
      case GridViewType.normal:
        gridView = GridView(
          scrollDirection: Axis.vertical,
          gridDelegate: isCount
              ? sliverGridDelegateWithFixedCrossAxisCount
              : sliverGridDelegateWithMaxCrossAxisExtent,
          children: widgetList,
        );
        break;
      case GridViewType.builder:
        gridView = GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: widgetList.length,
          itemBuilder: (BuildContext context, int index) {
            return widgetList[index];
          },
        );
        break;
      case GridViewType.extent:
        gridView = GridView.extent(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          maxCrossAxisExtent: 200,
          children: widgetList,
        );
        break;
      case GridViewType.count:
        gridView = GridView.count(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          children: widgetList,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GridView'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Stack(
            fit: StackFit.expand,
            children: [
              gridView,
              Positioned(
                  bottom: 80,
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              gridViewType = GridViewType.normal;
                              initGridView();
                            });
                          },
                          child: const Text("GridView")),
                      const Padding(padding: EdgeInsets.all(10)),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              gridViewType = GridViewType.builder;
                              initGridView();
                            });
                          },
                          child: const Text("GridView.builder")),
                    ],
                  )),
              Positioned(
                  bottom: 20,
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              gridViewType = GridViewType.extent;
                              initGridView();
                            });
                          },
                          child: const Text("GridView.extent")),
                      const Padding(padding: EdgeInsets.all(10)),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              gridViewType = GridViewType.count;
                              initGridView();
                            });
                          },
                          child: const Text("GridView.count"))
                    ],
                  ))
            ],
          ),
        ));
  }
}
