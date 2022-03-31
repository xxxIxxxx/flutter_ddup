import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.amber, Colors.orange, Colors.blue])),
            transform: Matrix4.rotationZ(0.1),
            child:
                const Text("Container 有 padding,decoration,transform 等属性 自己看吧"),
          ),
          const Padding(padding: EdgeInsets.all(30)),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.redAccent,
            child: const Text("padding 是容器内补充", textScaleFactor: 2.0),
          ),
          const Padding(padding: EdgeInsets.all(30)),
          Container(
            color: Colors.greenAccent,
            child: Container(
              margin: const EdgeInsets.all(20),
              color: Colors.redAccent,
              child: const Text("margin 是容器外补充", textScaleFactor: 2.0),
            ),
          )
        ],
      ),
    );
  }
}
