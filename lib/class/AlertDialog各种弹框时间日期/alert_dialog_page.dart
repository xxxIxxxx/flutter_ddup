// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddup/class/%E9%A2%9C%E8%89%B2%E5%92%8C%E4%B8%BB%E9%A2%98/color.dart';

class AlertDialogPage extends StatefulWidget {
  const AlertDialogPage({Key? key}) : super(key: key);

  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  Future<bool?> showMyAlertDialog() {
    // *  showDialog 这个方法是 组件库提供的
    return showDialog(
        // * 点击空白处是否关闭对话框
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            // * 是否能滑动
            // scrollable: true,
            title: const Text('AlertDialog  title'),
            content: const Text('AlertDialog  contentAlertDialog'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              ElevatedButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  Future<String?> showMySimepeDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("SimpleDialog"),
            children: <Widget>[
              SimpleDialogOption(
                child: const Text("Option A"),
                onPressed: () {
                  Navigator.pop(context, "A");
                },
              ),
              SimpleDialogOption(
                child: const Text("Option B"),
                onPressed: () {
                  Navigator.pop(context, "B");
                },
              ),
              SimpleDialogOption(
                child: const Text("Option C"),
                onPressed: () {
                  Navigator.pop(context, "C");
                },
              ),
            ],
          );
        });
  }

  Future<int?> showMyDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: ListView.separated(
              itemCount: 100,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 1,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () {
                    Navigator.pop(context, index);
                  },
                );
              },
            ),
          );
        });
  }

  Future<bool?> showMyGenerDialog() async {
    return showGeneralDialog(
        context: context,
        barrierColor: ColorX.random.withAlpha(200),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return AlertDialog(
            title: const Text('AlertDialog  title'),
            content: const Text('AlertDialog  contentAlertDialog'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              ElevatedButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  Future<List?> showMyModalBottomSheet1() async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          var ck = false;

          return SafeArea(
              child: Column(
            // * 控制大小刚好，如果子内容过多 自己换成ListView
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // * 状态管理使用  StatefulBuilder 包裹  CheckboxListTile 否则不会刷新
              StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return CheckboxListTile(
                      title: const Text('使用 StatefulBuilder 改变弹窗内部状态'),
                      value: ck,
                      onChanged: (_) {
                        setState(() {
                          ck = !ck;
                        });
                      });
                },
              ),
              ListTile(
                title: const Text('Option A'),
                onTap: () {
                  Navigator.of(context).pop(['A', ck]);
                },
              ),
              ListTile(
                title: const Text('Option B'),
                onTap: () {
                  Navigator.of(context).pop(['B', ck]);
                },
              ),
              ListTile(
                title: const Text('Option C'),
                onTap: () {
                  Navigator.of(context).pop(['C', ck]);
                },
              )
            ],
          ));
        });
  }

  Future showLoading() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text('正在加载中...'),
                )
              ],
            ),
          );
        });
  }

  Future<DateTime?> showDateTime() async {
    var date = DateTime.now();
    return showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date,
        lastDate: date.add(const Duration(days: 360)),
        // 设置那一天不能选
        selectableDayPredicate: (itemDate) {
          if (date.add(const Duration(days: 2)).year == itemDate.year &&
              date.add(const Duration(days: 2)).month == itemDate.month &&
              date.add(const Duration(days: 2)).day == itemDate.day) {
            return false;
          }
          return true;
        });
  }

  Future<DateTime?> showDateTime2() async {
    DateTime selDate = DateTime.now();
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(children: [
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context, selDate);
                        },
                        child: const Text("确定")),
                  ]),
                  SizedBox(
                    height: 200,
                    child: CupertinoDatePicker(onDateTimeChanged: (date) {
                      selDate = date;
                    }),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                ],
              ));
        });
  }

  Future<Duration?> showDateTime3() async {
    Duration duration = const Duration();
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context, duration);
                          },
                          child: const Text("确定"))
                    ],
                  ),
                  CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.hm,
                      onTimerDurationChanged: (t) {
                        duration = t;
                      }),
                  const Padding(padding: EdgeInsets.all(10))
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listData = [
      ElevatedButton(
          onPressed: () async {
            bool? v = await showMyAlertDialog();
            if (v == true) {
              print('ok');
            } else {
              print('cancel');
            }
          },
          child: const Text("AlertDialog")),
      ElevatedButton(
        onPressed: () async {
          String? v = await showMySimepeDialog();
          print(v);
        },
        child: const Text("SimpleDialog"),
      ),
      ElevatedButton(
        onPressed: () async {
          int? v = await showMyDialog();
          print(v);
        },
        child: const Text("Dialog 自定义内部组件"),
      ),
      ElevatedButton(
        onPressed: () async {
          bool? v = await showMyGenerDialog();
          print(v);
        },
        child: const Text("showGeneralDialog 可自定义动画等"),
      ),
      ElevatedButton(
        onPressed: () async {
          var v = await showMyModalBottomSheet1();
          print(v);
        },
        child: const Text("showModalBottomSheet 底部弹窗 + 内部状态管理"),
      ),
      ElevatedButton(
        onPressed: () async {
          await showLoading();
        },
        child: const Text("showDialog 加载中"),
      ),
      ElevatedButton(
        onPressed: () async {
          var v = await showDateTime();
          print(v);
        },
        child: const Text("showDatePicker"),
      ),
      ElevatedButton(
        onPressed: () async {
          var v = await showDateTime2();
          print(v);
        },
        child: const Text("showDatePicker iOS 风格"),
      ),
      ElevatedButton(
        onPressed: () async {
          var v = await showDateTime3();
          print(v);
        },
        child: const Text("timePicker iOS 风格"),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertDialog'),
      ),
      body: ListView.separated(
        itemCount: listData.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 1);
        },
        itemBuilder: (BuildContext context, int index) {
          return listData[index];
        },
      ),
    );
  }
}
