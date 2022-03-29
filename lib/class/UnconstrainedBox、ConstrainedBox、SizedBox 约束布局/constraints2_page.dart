import 'package:flutter/material.dart';

class ConstraintsPage2 extends StatefulWidget {
  const ConstraintsPage2({Key? key}) : super(key: key);

  @override
  _ConstraintsPageState2 createState() => _ConstraintsPageState2();
}

class _ConstraintsPageState2 extends State<ConstraintsPage2> {
  Widget redBox =
      const DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  Widget blackBox =
      const DecoratedBox(decoration: BoxDecoration(color: Colors.black));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constraints'),
      ),
      body: ListView(
        children: <Widget>[
          const Text("在 ListView 中 宽度是无限大的,会传递给子 Widget,导致限制失效"),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 200,
              minHeight: 50,
            ),
            child: Container(child: redBox),
          ),
          const Text("使用 UnconstrainedBox 可以去除父组件的限制"),
          UnconstrainedBox(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 50,
                minHeight: 50,
              ),
              child: Container(child: redBox),
            ),
          ),
          const Text("使用 SizedBox 可以指定子组件的限制"),
          SizedBox(
            width: 100,
            height: 50,
            child: blackBox,
          ),
          const Text("AspectRatio 设置子组件的宽高比"),
          AspectRatio(aspectRatio: 4.0, child: redBox),
          const Text("使用 LimitedBox 限制子组件的大小，在 Column 无法展示"),
          SizedBox(
            height: 100,
            child: LimitedBox(
              maxHeight: 100,
              maxWidth: 100,
              child: blackBox,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("返回 Cloumn 中看看效果"))
        ],
      ),
    );
  }
}
