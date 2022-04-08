// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_ddup/gen/assets.gen.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  late AnimationController animationController1;
  late Animation<double> animation1;

//MARK:
  late AnimationController animationController2 = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this, // 当有多个 AnimationController 时要继承自 TickerProviderStateMixin
  );
  late Animation<Color?> animation2 =
      ColorTween(begin: Colors.red, end: Colors.blue)
          .animate(animationController2)
        ..addListener(() {
          setState(() {});
        });
//MARK:
  late AnimationController animationController3 = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this, // 当有多个 AnimationController 时要继承自 TickerProviderStateMixin
  );
  late Animation<double> animation3 =
      Tween(begin: 0.0, end: 1.0).animate(animationController3)
        ..addListener(() {
          setState(() {});
        });

//MARK:
  late AnimationController animationController4 = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this, // 当有多个 AnimationController 时要继承自 TickerProviderStateMixin
  );
  late Animation<Color?> animation4 =
      ColorTween(begin: Colors.amber, end: Colors.greenAccent)
          .animate(animationController4);

  @override
  void initState() {
    super.initState();
    configAnimation1();
    refresh();
  }

  void refresh() {
    animationController1.reset();
    animationController1.forward();

    animationController2.reset();
    animationController2.forward();

    animationController3.reset();
    animationController3.forward();

    animationController4.reset();
    animationController4.forward();
  }

  void configAnimation1() {
    // * 1.创建动画控制器
    animationController1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this, // 当有多个 AnimationController 时要继承自 TickerProviderStateMixin
    );
    // * 2.创建动画线性曲线，这一步可以不要 那就是匀速动画曲线
    animation1 =
        CurvedAnimation(parent: animationController1, curve: Curves.easeIn);
    // * 3.创建动画范围
    animation1 = Tween<double>(begin: 40, end: 80).animate(animation1)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        print("动画状态: $status");
      });
    // * 启动动画
    // animationController1.forward();
  }

  @override
  void dispose() {
    animationController1.dispose();
    animationController2.dispose();
    animationController3.dispose();
    animationController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: refresh,
          ),
        ],
      ),
      body: ListView(children: <Widget>[
        bigText("1. 使用 AnimationController 三步 实现动画"),
        Assets.images.cat
            .image(width: animation1.value, height: animation1.value),
        bigText("2. 使用 AnimationController  实现颜色动画"),
        Container(
          height: 20,
          color: animation2.value,
        ),
        FadeTransition(
            opacity: animation3, child: bigText("3. 使用 FadeTransition 实现渐隐渐现")),
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.red,
          child: bigText(
              "小总结：Tween<double>,ColorTween,SizeTween 还有很多自己点进去看, FadeTransition 也有很多点进去看"),
        ),
        AnimatedBuilder(
          animation: animation4,
          child: bigText("4. 使用 AnimatedBuilder 组件，可以不用自己写动画状态监听"),
          // (BuildContext context, Widget? child)  注意 Widget? 可空
          builder: (BuildContext context, Widget? child) {
            return Container(
              height: 180,
              color: animation4.value,
              child: child,
            );
          },
        ),
      ]),
    );
  }

  Text bigText(String text) => Text(text, style: const TextStyle(fontSize: 30));
}
