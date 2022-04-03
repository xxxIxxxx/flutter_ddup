// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  List<Widget> pageViewList = [];
  List<Widget> builderList = [];
  List<Widget> customList = [];

  @override
  void initState() {
    super.initState();
    pageViewList = initData("PageView");
    builderList = initData("PageView.builder");
    customList = initData("PageView.Custom");
  }

  List<Widget> initData(String text) {
    var colors = [
      Colors.redAccent,
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.purpleAccent,
      Colors.orangeAccent
    ];
    List<Widget> list = [];
    for (var i = 0; i < 5; i++) {
      list.add(PageText(
        text: text + i.toString(),
        color: colors[i],
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView'),
      ),
      body: Column(children: [
        const Text("PageView"),
        SizedBox(
          height: 100,
          child: PageView(
            //预渲染页面
            allowImplicitScrolling: true,
            children: pageViewList,
          ),
        ),
        const Text("PageView.builder"),
        SizedBox(
          height: 100,
          child: PageView.builder(
            itemCount: builderList.length,
            itemBuilder: (context, index) {
              return builderList[index];
            },
          ),
        ),
        const Text("PageView.custom"),
        SizedBox(
          height: 100,
          child: PageView.custom(
              // childrenDelegate: SliverChildListDelegate(widgetList)
              childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return customList[index];
            },
            childCount: customList.length,
          )),
        )
      ]),
    );
  }
}

class PageText extends StatefulWidget {
  const PageText({Key? key, required this.text, required this.color})
      : super(key: key);
  final String text;
  final Color color;
  @override
  State<PageText> createState() => _PageTextState();
}

//MARK:  保持缓存 需要混入 AutomaticKeepAliveClientMixin
//*  AutomaticKeepAlive 看起来没用到啊
class _PageTextState extends State<PageText>
    with AutomaticKeepAliveClientMixin {
  //*  true 开启缓存
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    //* 需要调用父类的build方法
    super.build(context);
    print("build    ${widget.text}");
    return Container(
      color: widget.color,
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: Text(widget.text),
      ),
    );
  }
}
