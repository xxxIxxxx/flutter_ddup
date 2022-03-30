import 'package:flutter/material.dart';

class WarpFlowPage extends StatefulWidget {
  const WarpFlowPage({Key? key}) : super(key: key);

  @override
  _WarpFlowPageState createState() => _WarpFlowPageState();
}

class _WarpFlowPageState extends State<WarpFlowPage> {
  List<Widget> colorList = () {
    List<Widget> list = [];
    for (int i = 0; i < 9; i++) {
      Widget colorBox = Container(
          color: Colors.red,
          child: SizedBox(
            width: 100,
            height: 100,
            child: Chip(
                avatar: CircleAvatar(child: Text("$i")),
                label: Text("data $i")),
          ));
      list.add(colorBox);
    }
    return list;
  }();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WarpFlow'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Wrap(
              direction: Axis.horizontal,
              //主轴方向
              // spacing: 10,
              alignment: WrapAlignment.spaceAround,
              //交叉轴方向
              // runAlignment: WrapAlignment.spaceAround,
              runSpacing: 10,
              children: colorList,
            ),
            // 可以自由布局
            Flow(delegate: TestFlowdelegate(), children: colorList),
          ],
        ));
  }
}

class TestFlowdelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = 10.0;
    var y = 10.0;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)?.width ?? 0 + x;
      var h = context.getChildSize(i)?.height ?? 0 + y;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x = w + 10;
      } else {
        x = 0;
        y += h + 10;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i)?.width ?? 0 + 10;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return const Size(300, 1000);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
