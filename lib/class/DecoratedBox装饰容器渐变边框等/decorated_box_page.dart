import 'package:flutter/material.dart';

class DecoratedBoxPage extends StatefulWidget {
  const DecoratedBoxPage({Key? key}) : super(key: key);

  @override
  _DecoratedBoxPageState createState() => _DecoratedBoxPageState();
}

class _DecoratedBoxPageState extends State<DecoratedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DecoratedBox'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.orange,
                width: 5,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text('text 被 DecoratedBox 包裹，四周边角为圆角'),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          const DecoratedBox(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(color: Colors.black, blurRadius: 10),
                ],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(0.3),
                    colors: [
                      Colors.greenAccent,
                      Colors.blueAccent,
                      Colors.orangeAccent
                    ])),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text("设置渐变色 加阴影"),
            ),
          ),
        ],
      ),
    );
  }
}
