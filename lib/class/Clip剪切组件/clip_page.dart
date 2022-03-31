import 'package:flutter/material.dart';

class ClipPage extends StatefulWidget {
  const ClipPage({Key? key}) : super(key: key);

  @override
  _ClipPageState createState() => _ClipPageState();
}

class _ClipPageState extends State<ClipPage> {
  Widget redBox(String text) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      width: 100,
      height: 100,
      child: Text(
        text,
        textScaleFactor: 1.2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clip'),
      ),
      body: ListView(
        children: <Widget>[
          UnconstrainedBox(child: ClipOval(child: redBox("ClipOval 裁剪为圆形"))),
          UnconstrainedBox(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: redBox("ClipRRect 裁剪为圆角矩形"))),
          UnconstrainedBox(
            child: Row(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 0.5,
                    child: redBox("将宽度缩小一半")),
                const Text("紧跟 RebBox")
              ],
            ),
          ),
          const Text("ClipRect 将溢出部分裁剪掉"),
          UnconstrainedBox(
            child: Row(
              children: [
                ClipRect(
                  child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 0.5,
                      child: redBox("将宽度缩小一半")),
                ),
                const Text("紧跟 RebBox")
              ],
            ),
          ),
          const Text("ClipPath 自定义剪切路径 需要实现一个 clipper 继承自 CustomClipper"),
          UnconstrainedBox(
              child: Container(
            color: Colors.blueAccent,
            child: ClipPath(
              clipper: MyClipper(),
              child: redBox("ClipPath"),
            ),
          ))
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  MyClipper() : super();

  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width / 2.0, 0)
      ..lineTo(size.width / 2.0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
