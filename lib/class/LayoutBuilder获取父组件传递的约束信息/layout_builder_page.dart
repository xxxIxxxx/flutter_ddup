// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatefulWidget {
  const LayoutBuilderPage({Key? key}) : super(key: key);

  @override
  _LayoutBuilderPageState createState() => _LayoutBuilderPageState();
}

class _LayoutBuilderPageState extends State<LayoutBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder'),
      ),
      body: ListView(
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              print(
                  "Blue w = ${constraints.maxWidth}  h = ${constraints.maxHeight}");
              return Container(
                child: const Text("LayoutBuilder 可以获取到父组件的大小"),
                color: Colors.blue,
                width: constraints.maxWidth,
                height: 100,
              );
            },
          ),
          const Padding(padding: EdgeInsets.all(10)),
          SizedBox.fromSize(
            size: const Size.fromHeight(100),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                print(
                    "Red w = ${constraints.maxWidth}  h = ${constraints.maxHeight}");
                return Container(
                  child: const Text("LayoutBuilder 可以获取到父组件的大小"),
                  color: Colors.red,
                  width: constraints.maxWidth,
                  height: 100,
                );
              },
            ),
          ),
          Container(
              color: Colors.green,
              child: const LogLayoutWidget(child: Text("打印出父组件传递的约束"))),
          UnconstrainedBox(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Container(
                  color: Colors.amber,
                  child: const LogLayoutWidget(child: Text("打印出父组件传递的约束"))),
            ),
          )
        ],
      ),
    );
  }
}

class LogLayoutWidget extends StatelessWidget {
  const LogLayoutWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        print("$child = ${constraints.maxWidth}  h = ${constraints.maxHeight}");
        return child;
      },
    );
  }
}
