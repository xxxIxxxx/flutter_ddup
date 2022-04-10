import 'package:flutter/material.dart';

class TurnBox extends StatefulWidget {
  const TurnBox(
      {Key? key,
      this.turns = 0.0,
      this.duration = const Duration(milliseconds: 200),
      required this.child})
      : super(key: key);

  /// 角度 1圈是 360度
  final double turns;

  /// 动画时间
  final Duration duration;
  final Widget child;

  @override
  State<TurnBox> createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: widget.duration,
    lowerBound: -double.infinity,
    upperBound: double.infinity,
    value: widget.turns,
  );

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    //! 注意 这里有状态的要注意刷新
    if (oldWidget.turns != widget.turns) {
      animationController.animateTo(widget.turns,
          duration: widget.duration, curve: Curves.easeIn);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animationController,
      child: widget.child,
    );
  }
}
