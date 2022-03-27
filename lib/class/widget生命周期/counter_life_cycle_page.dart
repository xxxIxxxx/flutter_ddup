// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';

import '../../route/arg_mixin.dart';

class CounterLifeCycleArg with Arg {
  int initValue = 0;
  CounterLifeCycleArg(this.initValue);
}

class CounterLifeCycleWidget extends StatefulWidget {
  const CounterLifeCycleWidget({Key? key, this.arg}) : super(key: key);
  final CounterLifeCycleArg? arg;

  @override
  State<CounterLifeCycleWidget> createState() => _CounterLifeCycleWidgetState();
}

class _CounterLifeCycleWidgetState extends State<CounterLifeCycleWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.arg?.initValue ?? 0;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget 生命周期'),
      ),
      body: Center(
        child: TextButton(
          child: Text("来点我 $_counter  "),
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterLifeCycleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
