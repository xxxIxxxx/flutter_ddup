import 'package:flutter/material.dart';

class AnimationGroupPage extends StatefulWidget {
  const AnimationGroupPage({Key? key}) : super(key: key);

  @override
  _AnimationGroupPageState createState() => _AnimationGroupPageState();
}

class _AnimationGroupPageState extends State<AnimationGroupPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画组合'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _controller.reset();
              _controller.forward();
            },
          ),
        ],
      ),
      body: MoreAnimation(animationController: _controller),
    );
  }
}

class MoreAnimation extends StatelessWidget {
  MoreAnimation({Key? key, required this.animationController})
      : super(key: key) {
    color = ColorTween(begin: Colors.red, end: Colors.greenAccent)
        .animate(CurvedAnimation(
            parent: animationController,
            // 设置动画执行区间和曲线
            curve: const Interval(0.6, 1.0, curve: Curves.easeInOut)));
    height = Tween<double>(begin: 10, end: 300).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn)));

    left = Tween<double>(begin: 10, end: 200).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.6, 1, curve: Curves.easeIn)));
  }
  final AnimationController animationController;
  late final Animation<Color?> color;
  late final Animation<double> height;
  late final Animation<double> left;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.only(left: left.value, top: left.value),
          child: Container(
            color: color.value,
            height: height.value,
            width: 80,
          ),
        );
      },
    );
  }
}
