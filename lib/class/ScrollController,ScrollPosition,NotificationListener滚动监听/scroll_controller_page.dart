// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'scroll_notification_listener_page.dart';

class ScrollControllerPage extends StatefulWidget {
  const ScrollControllerPage({Key? key}) : super(key: key);

  @override
  _ScrollControllerPageState createState() => _ScrollControllerPageState();
}

class _ScrollControllerPageState extends State<ScrollControllerPage> {
  final ScrollController _scrollController = ScrollController();

  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    //监听滚动信息
    _scrollController.addListener(() {
      print(_scrollController.offset);
      if (_scrollController.offset < 600 && showToTopBtn == true) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 600 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });

//* _scrollController 持有几个ScrollPosition， 每一个都对应一个 widget
    // _scrollController.positions.length;
    //* 控制 _scrollController 持有的某一个 滚动到某一个位置
// _scrollController.positions.elementAt(1).animateTo(0.0, duration: const Duration(seconds: 1), curve: Curves.ease);}
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScrollController'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ScrollNotificationListenerPage();
                }));
              },
              icon: const Icon(Icons.navigate_next))
        ],
      ),
      body: Scrollbar(
        //! Scrollbar 的 controller 要和子widget 的 controller 保持一致
        controller: _scrollController,
        child: ListView.separated(
          controller: _scrollController,
          itemCount: 700,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 1,
              color: Colors.grey,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.deepPurpleAccent,
              alignment: Alignment.center,
              height: 60,
              child: Text("继续滑动 返回顶部    $index"),
            );
          },
        ),
      ),
      floatingActionButton: showToTopBtn
          ? FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              })
          : null,
    );
  }
}
