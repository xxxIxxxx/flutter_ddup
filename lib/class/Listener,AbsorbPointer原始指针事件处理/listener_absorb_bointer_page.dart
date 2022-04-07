// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ListenerAbsorbBointerPage extends StatefulWidget {
  const ListenerAbsorbBointerPage({Key? key}) : super(key: key);

  @override
  _ListenerAbsorbBointerPageState createState() =>
      _ListenerAbsorbBointerPageState();
}

class _ListenerAbsorbBointerPageState extends State<ListenerAbsorbBointerPage> {
  double x = 100.0, y = 200.0;
  final GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
      title: const Text('Listener AbsorbBointer'),
    );
    print(appBar2.preferredSize.height);
    return Scaffold(
        appBar: appBar2,
        body: Listener(
          onPointerDown: (PointerDownEvent event) {
            print(MediaQuery.of(context).padding);
            MediaQuery.of(context).padding.top;
          },
          onPointerMove: (PointerMoveEvent event) {
            setState(() {
              x = event.position.dx;
              y = event.position.dy;
            });
          },
          child: Container(
            color: Colors.amber,
            child: Stack(
              key: globalKey,
              children: [
                Positioned(
                    left: 0,
                    bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: AbsorbPointer(
                        child: Container(
                            child: Column(children: [
                              const Text(
                                "AbsorbPointer 的 子组件不能接受事件，但是自己可以",
                                textScaleFactor: 2.0,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    print("object");
                                  },
                                  child: const Text(
                                      "这个 btn 被 AbsorbPointer 包裹， 点击无效果"))
                            ]),
                            color: Colors.red))),
                Positioned(
                  left: x - 40,
                  top: y -
                      40 -
                      // appBar 的高度
                      appBar2.preferredSize.height -
                      // MediaQuery.of(context).padding 屏幕的padiing 获取到状态栏的高度
                      MediaQuery.of(context).padding.top,
                  width: 80,
                  height: 80,
                  child: Container(
                      color: Colors.blue, child: const Text("点击并移动 会跟着你")),
                ),
              ],
            ),
          ),
        ));
  }
}
