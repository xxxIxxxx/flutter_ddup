// ignore_for_file: file_names, avoid_print

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../class/widget生命周期/counter_life_cycle_page.dart';
import 'package:flutter_ddup/route/routes.dart';
import 'application.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('主页'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 60),
        children: [
          TextButton(
              onPressed: (() {
                Application.router.navigateTo(context, Routes.lifeCycle,
                    routeSettings: CounterLifeCycleArg(100).rs,
                    transition: TransitionType.native);
              }),
              child: const Text("CounterLifeCycleWidget Widget 生命周期")),
          TextButton(
            onPressed: () {
              Application.router
                  .navigateTo(context,
                      Routes.tipRoute + "?tip=${Uri.encodeComponent("哈哈哈哈哈哈")}",
                      transition: TransitionType.native)
                  .then((value) {
                print("navigateTo result = $value");
              });
            },
            child: const Text("路由传值"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.text,
                  transition: TransitionType.native);
            },
            child: const Text("Text 文本及样式"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.button,
                  transition: TransitionType.native);
            },
            child: const Text("按钮"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.image,
                  transition: TransitionType.native);
            },
            child: const Text("图片"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.switchs,
                  transition: TransitionType.native);
            },
            child: const Text("单选开关复选开关"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.textField,
                  transition: TransitionType.native);
            },
            child: const Text("输入框及表单"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.progress,
                  transition: TransitionType.native);
            },
            child: const Text("进度滑块"),
          ),
          TextButton(
              onPressed: () {
                Application.router.navigateTo(context, Routes.constraints,
                    transition: TransitionType.inFromLeft);
              },
              child:
                  const Text("UnconstrainedBox、ConstrainedBox、SizedBox 约束布局")),
          TextButton(
              onPressed: () {
                Application.router.navigateTo(context, Routes.rowColumn,
                    transition: TransitionType.fadeIn);
              },
              child: const Text("Row Column 线性布局")),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.flexExpanded,
                  transition: TransitionType.inFromTop);
            },
            child: const Text("Flex Expanded Spacer 弹性布局"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.warpFlow,
                  transition: TransitionType.native);
            },
            child: const Text("Warp Flow 流式布局"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.stackPositioned,
                  transition: TransitionType.native);
            },
            child: const Text("Stack Positioned 层叠布局"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.alignCenter,
                  transition: TransitionType.native);
            },
            child: const Text("Align Center 对齐与相对定位"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.layoutBuilder,
                  transition: TransitionType.native);
            },
            child: const Text("LayoutBuilder 获取父组件传递的约束信息"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.padding,
                  transition: TransitionType.native);
            },
            child: const Text("Padding 填充"),
          ),
        ],
      ),
    );
  }
}
