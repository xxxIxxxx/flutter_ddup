import 'package:flutter/material.dart';
import 'package:flutter_ddup/class/%E8%87%AA%E7%BB%98%E7%BB%84%E4%BB%B6/gradient_circular_progress_indicator.dart';

class CustomWidgetPage extends StatefulWidget {
  const CustomWidgetPage({Key? key}) : super(key: key);

  @override
  _CustomWidgetPageState createState() => _CustomWidgetPageState();
}

class _CustomWidgetPageState extends State<CustomWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自绘组件'),
      ),
      body: const GradientCircularProgressIndicator(
        radius: 170,
        value: 0.9,
        stroeWidth: 8,
        colors: [Colors.amber, Colors.red],
      ),
    );
  }
}
