import 'dart:async';
import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage>
    with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  Timer? _timer;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, //!需要混入 with SingleTickerProviderStateMixin
      duration: const Duration(seconds: 15),
    );
    _animationController.addListener(() {
      setState(() {});
    });
  }

  start() {
    if (!(_timer?.isActive ?? false)) {
      _progress = 0.0;
      _timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
        setState(() {
          _progress += 0.005;
          if (_progress >= 1) {
            t.cancel();
          }
        });
      });
    }

    if (!_animationController.isAnimating) {
      _animationController.value = 0;
      _animationController.forward();
    }
  }

  reset() {
    setState(() {
      _progress = 0.0;
      _timer?.cancel();
      _animationController.value = 0.0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    //! 必须在 super.dispose(); 之前调用
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Progress'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Row(
              children: [
                ElevatedButton(onPressed: start, child: const Text('start')),
                const Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(onPressed: reset, child: const Text('reset')),
              ],
            ),
            LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              // valueColor: ColorTween(begin: Colors.blue, end: Colors.red)
              //     .animate(_animationController),
              minHeight: 5.0,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            // 模糊进度条
            const LinearProgressIndicator(
              backgroundColor: Colors.grey,
            ),
            CircularProgressIndicator(
              value: _animationController.value,
              backgroundColor: Colors.grey,
              valueColor: ColorTween(begin: Colors.blue, end: Colors.red)
                  .animate(_animationController),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: _animationController.value,
                  backgroundColor: Colors.grey,
                  valueColor: ColorTween(begin: Colors.orange, end: Colors.red)
                      .animate(_animationController),
                ),
              ),
            )
          ],
        ));
  }
}
