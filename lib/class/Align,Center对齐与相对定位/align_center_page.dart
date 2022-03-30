import 'package:flutter/material.dart';

class AlignCenterPage extends StatefulWidget {
  const AlignCenterPage({Key? key}) : super(key: key);

  @override
  _AlignCenterPageState createState() => _AlignCenterPageState();
}

class _AlignCenterPageState extends State<AlignCenterPage> {
  Widget textWidget(String text) {
    return Container(
      color: Colors.purple,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Align Center'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text("紫色是 Align，背景色是父 widget"),
            ),
            Container(
              color: Colors.amber,
              child: Align(
                // 自己在父组件中的位置
                alignment: Alignment.bottomCenter,
                // 自己的宽度系数 不设置就尽可能的大
                widthFactor: 2.0,
                // 自己的高度系数 不设置就尽可能的大
                heightFactor: 2.0,
                child: textWidget('Align Center'),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Container(
              color: Colors.redAccent,
              child: Align(
                heightFactor: 2.0,
                alignment: Alignment.topRight,
                child: textWidget(
                    'Alignment 是以矩形的中心点为原点 Alignment.topRight = Alignment(1.0, -1.0);'),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Container(
              color: Colors.blueAccent,
              child: Align(
                alignment: const Alignment(-1, 2),
                heightFactor: 2.0,
                child: textWidget("Alignment 是个类哦，可以自己传入坐标的"),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Container(
                color: Colors.greenAccent,
                child: Align(
                  heightFactor: 1.5,
                  alignment: const FractionalOffset(1.0, 1.0),
                  child: textWidget("FractionalOffset 继承自 Alignment，坐标原点为左上点"),
                )),
            const Padding(padding: EdgeInsets.all(20)),
            Center(
              child: textWidget("Center 继承自 Align"),
            )
          ],
        ));
  }
}
