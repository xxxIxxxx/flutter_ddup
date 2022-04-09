import 'package:flutter/material.dart';
import 'package:flutter_ddup/class/AnimatedSwitcher%E5%8A%A8%E7%94%BB%E5%88%87%E6%8D%A2%E7%BB%84%E4%BB%B6/slide_transition_x.dart';

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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            ElevatedButton(
              child: const Text('Switch'),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget textWidget(String text) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          textScaleFactor: 2,
        ));
  }
}
