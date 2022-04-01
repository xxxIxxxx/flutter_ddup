import 'package:flutter/material.dart';

class SingleChildScrollViewPage extends StatefulWidget {
  const SingleChildScrollViewPage({Key? key}) : super(key: key);

  @override
  _SingleChildScrollViewPageState createState() =>
      _SingleChildScrollViewPageState();
}

class _SingleChildScrollViewPageState extends State<SingleChildScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView'),
      ),
      body: Scrollbar(
          //  滚动条
          child: SingleChildScrollView(
        child: Column(
          children: "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
              .split("")
              .map((letter) => Container(
                    color: Colors.orange,
                    constraints: const BoxConstraints.expand(height: 60),
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      letter,
                      style: const TextStyle(fontSize: 50),
                    ),
                  ))
              .toList(),
        ),
      )),
    );
  }
}
