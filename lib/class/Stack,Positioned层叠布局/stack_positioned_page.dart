import 'package:flutter/material.dart';

class StackPositionedPage extends StatefulWidget {
  const StackPositionedPage({Key? key}) : super(key: key);

  @override
  _StackPositionedPageState createState() => _StackPositionedPageState();
}

class _StackPositionedPageState extends State<StackPositionedPage> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Positioned'),
      ),
      body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            fit: isExpand ? StackFit.expand : StackFit.loose,
            children: <Widget>[
              Container(
                child: const Text("orange 没有定位\n 受 alignment 和 fit 影响"),
                color: Colors.orange,
              ),
              Positioned(
                left: 20,
                top: 100,
                child: Container(
                    color: Colors.red, child: const Text("距离左20 上200")),
              ),
              Positioned(
                  right: 20,
                  child: Container(
                    color: Colors.blue,
                    child: const Text("距离右20，\n上下为设置 \n使用alignment"),
                  )),
              Positioned(
                bottom: 50,
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isExpand = !isExpand;
                        });
                      },
                      child: const Text("切换 Stack fit 模式")),
                ),
              )
            ],
          )),
    );
  }
}
