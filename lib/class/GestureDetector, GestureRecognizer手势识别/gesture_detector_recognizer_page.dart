// ignore_for_file: avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddup/class/%E9%A2%9C%E8%89%B2%E5%92%8C%E4%B8%BB%E9%A2%98/color.dart';
import 'package:flutter_ddup/gen/assets.gen.dart';

class GestureDetectorRecognizerPage extends StatefulWidget {
  const GestureDetectorRecognizerPage({Key? key}) : super(key: key);

  @override
  _GestureDetectorRecognizerPageState createState() =>
      _GestureDetectorRecognizerPageState();
}

class _GestureDetectorRecognizerPageState
    extends State<GestureDetectorRecognizerPage> {
  String _operation = 'No Gesture detected!';
  double _wh = 200, _t = 200;
  // GestureRecognizer
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  Color textColor = Colors.red;

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GestureDetector GestureRecognizer 手势识别'),
        ),
        body: Column(
          children: [
            GestureDetector(
                onTap: () => updateText('单击'),
                onDoubleTap: () => updateText('双击'),
                onLongPress: () => updateText('长按'),
                onPanDown: (DragDownDetails details) => updateText('点击'),
                onPanUpdate: (DragUpdateDetails details) => updateText('移动'),
                onPanEnd: (DragEndDetails details) => updateText('移动结束'),
                // 还有很多手势识别事件，可以根据需要添加
                // onVerticalDragUpdate: ,
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.amberAccent,
                    width: double.infinity,
                    height: 100,
                    child: Text("GestureDetector 当前事件：$_operation"))),
            const Text("缩放猫猫"),
            GestureDetector(
                onScaleStart: (_) {
                  // 记录开始时的大小
                  _t = _wh;
                },
                onScaleUpdate: (s) {
                  setState(() {
                    // 缩放倍数 限制在 0.8 - 2 之间
                    _wh = _t * s.scale.clamp(0.8, 2.0);
                    print(s.scale);
                  });
                },
                onScaleEnd: (s) {
                  print("onScaleEnd");
                },
                child: Assets.images.cat.image(width: _wh, height: _wh)),
            Text.rich(TextSpan(children: [
              const TextSpan(text: "我是富文本 我来展示 GestureRecognizer 的用法"),
              TextSpan(
                  text: "点我触发 TapGestureRecognizer  变色吧",
                  style: TextStyle(color: textColor),
                  recognizer: _tapGestureRecognizer
                    ..onTap = () {
                      setState(() {
                        textColor = ColorX.random;
                      });
                    })
            ])),
          ],
        ));
  }
}
