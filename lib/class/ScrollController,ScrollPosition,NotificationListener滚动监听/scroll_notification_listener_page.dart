// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ScrollNotificationListenerPage extends StatefulWidget {
  const ScrollNotificationListenerPage({Key? key}) : super(key: key);

  @override
  _ScrollNotificationListenerPageState createState() =>
      _ScrollNotificationListenerPageState();
}

class _ScrollNotificationListenerPageState
    extends State<ScrollNotificationListenerPage> {
  String progress = '0%';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationListener'),
      ),
      //* 使用 NotificationListener 监听滚动事件
      body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            print(notification);
            double pro = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              progress = "${(pro * 100).toInt()}%";
            });
            return false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListView.separated(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('$index'),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
              Text("当前滑动进度 " + progress),
            ],
          )),
    );
  }
}
