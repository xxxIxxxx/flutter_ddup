import 'package:flutter/material.dart';

import 'gradient_button_widget.dart';
import 'turn_box_widget.dart';

class GradientBtnPage extends StatefulWidget {
  const GradientBtnPage({Key? key}) : super(key: key);

  @override
  _GradientBtnPageState createState() => _GradientBtnPageState();
}

class _GradientBtnPageState extends State<GradientBtnPage> {
  double _turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自己实现渐变色按钮'),
      ),
      body: ListView(
        children: [
          GradientButton(
              colors: const [Colors.orange, Colors.red],
              child: const Text('渐变色按钮,顺便控制 TurnBox'),
              onPressed: () {
                setState(() {
                  _turns += 0.01;
                });
              }),
          UnconstrainedBox(
              child: TurnBox(
                  turns: _turns,
                  child: Container(
                    color: Colors.amber,
                    width: 100,
                    height: 60,
                    child: const Text("组合实现可旋转任意角度的组件"),
                  )))
        ],
      ),
    );
  }
}
