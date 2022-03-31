import 'package:flutter/material.dart';

class PaddingPage extends StatefulWidget {
  const PaddingPage({Key? key}) : super(key: key);

  @override
  _PaddingPageState createState() => _PaddingPageState();
}

class _PaddingPageState extends State<PaddingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Padding'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            height: 100,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                color: Colors.blue,
                child: const Text('蓝色被 Padding 包裹，四周间距 8'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(7)),
          Container(
            height: 100,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Container(
                color: Colors.blue,
                child: const Text('蓝色被 Padding 包裹，上左右间距 8'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(7)),
          Container(
            height: 100,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
              child: Container(
                color: Colors.blue,
                child: const Text('蓝色被 Padding 包裹，右下间距 8'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(7)),
          Container(
            height: 100,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                color: Colors.blue,
                child: const Text('蓝色被 Padding 包裹，左右间距 8'),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(7)),
          Container(
            height: 100,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: Colors.blue,
                child: const Text('蓝色被 Padding 包裹，上下间距 8'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
