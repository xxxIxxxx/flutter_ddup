import 'package:flutter/material.dart';

class WillPopScopePage extends StatefulWidget {
  const WillPopScopePage({Key? key}) : super(key: key);

  @override
  _WillPopScopePageState createState() => _WillPopScopePageState();
}

class _WillPopScopePageState extends State<WillPopScopePage> {
  DateTime? _lastTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WillPopScope'),
      ),
      body: WillPopScope(
          child: const Center(
            child: Text("1s 内连续点击两次返回按钮 返回"),
          ),
          onWillPop: () async {
            if (_lastTime == null ||
                DateTime.now().difference(_lastTime!) >
                    const Duration(seconds: 1)) {
              _lastTime = DateTime.now();
              return false;
            }
            return true;
          }),
    );
  }
}
