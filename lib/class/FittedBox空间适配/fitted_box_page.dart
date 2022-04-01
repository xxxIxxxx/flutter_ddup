import 'package:flutter/material.dart';

class FittedBoxPage extends StatefulWidget {
  const FittedBoxPage({Key? key}) : super(key: key);

  @override
  _FittedBoxPageState createState() => _FittedBoxPageState();
}

class _FittedBoxPageState extends State<FittedBoxPage> {
  Widget colorBox(BoxFit boxFit) {
    return UnconstrainedBox(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
        child: FittedBox(
          fit: boxFit,
          child: Container(
            width: 90,
            height: 130,
            color: Colors.greenAccent,
          ),
        ),
      ),
    );
  }

  Widget centerText(String text) {
    return Center(
      child: Text(text),
    );
  }

  Widget rowText = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Container(
        padding: const EdgeInsets.all(5),
        child: const Text("A长长长长长长长长长长长长A"),
      ),
      Container(
        padding: const EdgeInsets.all(5),
        child: const Text("B长长长长长长长长长长长长B"),
      ),
      Container(
        padding: const EdgeInsets.all(5),
        child: const Text("C长长长长长长长长长长长长C"),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FittedBox'),
      ),
      body: ListView(
        children: [
          colorBox(BoxFit.none),
          centerText("子组件超出父组件 不剪切"),
          colorBox(BoxFit.contain),
          centerText("子组件超出父组件 使用缩放"),
          ClipRect(
            child: colorBox(BoxFit.none),
          ),
          centerText("子组件超出父组件 使用 ClipRect 将超出部分裁剪掉"),
          const Padding(padding: EdgeInsets.all(30)),
          rowText,
          centerText("上边的长度超出，下边这个可以适配长度"),
          FittedBox(
            child: rowText,
          ),
        ],
      ),
    );
  }
}
