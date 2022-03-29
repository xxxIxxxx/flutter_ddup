import 'package:flutter/material.dart';
import 'package:flutter_ddup/class/UnconstrainedBox%E3%80%81ConstrainedBox%E3%80%81SizedBox%20%E7%BA%A6%E6%9D%9F%E5%B8%83%E5%B1%80/constraints2_page.dart';

class ConstraintsPage extends StatefulWidget {
  const ConstraintsPage({Key? key}) : super(key: key);

  @override
  _ConstraintsPageState createState() => _ConstraintsPageState();
}

class _ConstraintsPageState extends State<ConstraintsPage> {
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
      body: Column(
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
          const Text("使用 LimitedBox 限制子组件的大小，在 Column 无法展示，宽度为0"),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ConstraintsPage2();
                }));
              },
              child: const Text("同一套代码在 ListView 中看看效果"))
        ],
      ),
    );
  }
}
