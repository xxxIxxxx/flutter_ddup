// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'my_notification.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String _msg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.amberAccent,
              width: double.infinity,
              height: 100,
              child: NotificationListener<MyNotification>(
                  onNotification: (not) {
                    setState(() {
                      _msg = not.msg;
                    });
                    return false;
                  },
                  child: Column(
                    children: [
                      const Text("自定义通知"),
                      Text("通知内容: $_msg"),
                      Builder(builder: ((context) {
                        return ElevatedButton(
                            onPressed: () {
                              // * 发送通知，这里要用 Builder 包裹，
                              // * 如果直接用 context 那是根 context 不会收到通知，NotificationListener 监听的是子树的通知
                              MyNotification("我是通知内容啊，哈哈哈哈哈").dispatch(context);
                            },
                            child: const Text("发送通知"));
                      }))
                    ],
                  )),
            ),
            // ScrollEndNotification 滚动结束通知
            NotificationListener<ScrollEndNotification>(
                onNotification: (not) {
                  print("ScrollEndNotification  仅接受滑动停止的通知" + not.toString());
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    "ScrollEndNotification  仅接受滑动停止的通知",
                    textScaleFactor: 3.0,
                  )));
                  return false;
                },
                child: Expanded(
                  child: ListView.separated(
                    itemCount: 100,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 1,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return const ListTile(
                        title: Text("看看滑动通知"),
                      );
                    },
                  ),
                ))
          ],
        ));
  }
}
