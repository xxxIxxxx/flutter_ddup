import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text 文本及样式'),
      ),
      body: ListView(
        children: <Widget>[
          const Text("简单文本"),
          const Padding(padding: EdgeInsets.all(10)),
          const Text(
            "右对齐，限制两行\n文本以...截断截断截断截断截断截断截断截断截断截断截断截断截断",
            maxLines: 2,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Text(
            'Text 使用 TextStyle 属性',
            style: TextStyle(
              color: Colors.blue,
              // backgroundColor: Colors.orange,
              // 效果等于 backgroundColor: Colors.orange,
              background: Paint()..color = Colors.orange,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          DefaultTextStyle(
              style: const TextStyle(fontSize: 20, color: Colors.black),
              child: Column(
                children: const [
                  Text(
                    "使用 DefaultTextStyle（子 Widget 继承样式,inherit: false 指定不继承） + TextSpan",
                    style: TextStyle(color: Colors.amber),
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "红的", style: TextStyle(color: Colors.red)),
                    TextSpan(
                        text: "黄的", style: TextStyle(color: Colors.yellow)),
                    TextSpan(text: "蓝的", style: TextStyle(color: Colors.blue)),
                    TextSpan(text: "绿的", style: TextStyle(color: Colors.green)),
                  ])),
                ],
              ))
        ],
      ),
    );
  }
}
