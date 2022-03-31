import 'dart:math';

import 'package:flutter/material.dart';

class TransformRotatedBoxPage extends StatefulWidget {
  const TransformRotatedBoxPage({Key? key}) : super(key: key);

  @override
  _TransformRotatedBoxPageState createState() =>
      _TransformRotatedBoxPageState();
}

class _TransformRotatedBoxPageState extends State<TransformRotatedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transform  RotatedBox 变换旋转缩放'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          UnconstrainedBox(
            child: Container(
                color: Colors.amber,
                child: Transform.translate(
                    offset: const Offset(7, 7),
                    child: const Text('Transform.translate 平移'))),
          ),
          const Padding(padding: EdgeInsets.all(30)),
          UnconstrainedBox(
            child: Container(
                color: Colors.black,
                child: Transform(
                  // 相对于坐标系原点的对齐方式
                  alignment: Alignment.topLeft,
                  // 沿Y轴倾斜
                  transform: Matrix4.skewY(-0.3),
                  child: Container(
                    color: Colors.green,
                    child: const Text("Matrix4.skewY(-0.3)"),
                  ),
                )),
          ),
          const Padding(padding: EdgeInsets.all(30)),
          UnconstrainedBox(
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              child: Transform.rotate(
                angle: 0.5 * pi,
                child: Container(
                  color: Colors.purpleAccent,
                  child: const Text("Transform.rotate 旋转 90度"),
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(60)),
          UnconstrainedBox(
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              child: Transform.scale(
                scale: 1.8,
                child: const Text("Transform.scale 缩放 放大1.8倍"),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(60)),
          Stack(
            children: [
              UnconstrainedBox(
                child: Transform.rotate(
                  angle: 0.4,
                  child: Transform.translate(
                      offset: const Offset(30, -30),
                      child: Container(
                        color: Colors.red,
                        child: const Text("先旋转再平移字数一样"),
                      )),
                ),
              ),
              UnconstrainedBox(
                child: Transform.translate(
                  offset: const Offset(30, -30),
                  child: Transform.rotate(
                      angle: 0.4, child: const Text("先平移再旋转字数一样")),
                ),
              ),
              const Text("可以看出先旋转再平移 和 先平移再旋转效果不一样 否则会重叠像我1"),
              const Text("可以看出先旋转再平移 和 先平移再旋转效果不一样 否则会重叠像我2"),
            ],
          ),
          const Text("Transform 的变换不会影响组件实际占用位置大小，只是改变组件的显示效果",
              style: TextStyle(fontSize: 20, color: Colors.deepOrange)),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            children: [
              Container(
                color: Colors.red,
                child: const RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      "RotatedBox 和 Transform.rotate 不一样，会改变实际占用位置",
                      textScaleFactor: 2.0,
                    )),
              ),
              Container(
                color: Colors.greenAccent,
                child: const Text("紧跟 RotatedBox"),
              )
            ],
          )
        ],
      ),
    );
  }
}
