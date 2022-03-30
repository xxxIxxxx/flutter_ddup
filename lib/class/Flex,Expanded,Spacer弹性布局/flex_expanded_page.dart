import 'package:flutter/material.dart';

class FlexExpandedPage extends StatefulWidget {
  const FlexExpandedPage({Key? key}) : super(key: key);

  @override
  _FlexExpandedPageState createState() => _FlexExpandedPageState();
}

class _FlexExpandedPageState extends State<FlexExpandedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flex Expanded'),
      ),
      body: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  // 设置所占比例
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    child: const Text("Expanded 只能作为 Flex（Row Column） 的子组件"),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                    height: 100,
                  )),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.blue,
                    height: 100,
                  )),
                ],
              )),
          const Spacer(),
          Column(
            children: [
              Container(
                color: Colors.blue,
                width: 100,
                height: 100,
                child: const Text("上边的大空白是 Spacer"),
              )
            ],
          )
        ],
      ),
    );
  }
}
