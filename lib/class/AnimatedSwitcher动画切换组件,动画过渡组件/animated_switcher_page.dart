import 'package:flutter/material.dart';

import '../颜色和主题/color.dart';
import 'slide_transition_x.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  const AnimatedSwitcherPage({Key? key}) : super(key: key);

  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    var text = Text(
      '$_count',
      //!  新旧widget类型相同 需要指示不同的key
      key: ValueKey<int>(_count * -1),
      style: Theme.of(context).textTheme.headline4,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                if (_count == 10) {
                  _count = 0;
                }
                _count++;
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          textWidget("缩放切换动画"),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: text,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
          ),
          textWidget("上下切换动画"),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: text,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                  child: child,
                  position: Tween<Offset>(
                          begin: const Offset(0, -1), end: const Offset(0, 0))
                      .animate(animation));
            },
          ),
          textWidget("自定义切换动画，继承自 AnimatedWidget"),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: text,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransitionX(
                child: child,
                position: animation,
                direction: AxisDirection.right,
              );
            },
          ),
          textWidget("以下内置 动画过渡组件"),
          AnimatedPadding(
              padding: EdgeInsets.only(left: _count * 10),
              duration: const Duration(milliseconds: 300),
              child: Container(
                height: 50,
                color: Colors.deepOrange,
                child: const Text("AnimatedPadding"),
              )),
          AnimatedOpacity(
              opacity: _count * 0.1,
              duration: const Duration(milliseconds: 300),
              child: Container(
                height: 50,
                color: Colors.deepOrange,
                child: const Text("AnimatedOpacity"),
              )),
          AnimatedDefaultTextStyle(
            style: TextStyle(
              color: ColorX.random,
              fontSize: _count + 20,
            ),
            duration: const Duration(milliseconds: 300),
            child: const Text("AnimatedDefaultTextStyle"),
          ),
          AnimatedContainer(
              color: ColorX.random,
              height: 50 + _count * 50,
              duration: const Duration(milliseconds: 300),
              child: textWidget("AnimatedContainer")),
        ],
      ),
    );
  }

  Widget textWidget(String text) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          textScaleFactor: 2,
        ));
  }
}
