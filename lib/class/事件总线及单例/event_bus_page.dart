// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'event_bus.dart';

class EventBusPage extends StatefulWidget {
  const EventBusPage({Key? key}) : super(key: key);

  @override
  _EventBusPageState createState() => _EventBusPageState();
}

class _EventBusPageState extends State<EventBusPage> {
  int _count = 0;
  @override
  void initState() {
    super.initState();
    // 注册
    eventBus.on("eventName123", (params) {
      if (params is int) {
        setState(() {
          _count += params;
        });
      }
    });
  }

  @override
  void dispose() {
    //移出
    eventBus.off("eventName123");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventBus'),
      ),
      body: Column(
        children: [
          Text("$_count"),
          ElevatedButton(
              onPressed: () {
                // 通知
                eventBus.emit("eventName123", 100);
              },
              child: const Text("add 100"))
        ],
      ),
    );
  }
}
