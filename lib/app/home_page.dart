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
            child: const Text(
                "ElevatedButton,TextButton,OutlinedButton,IconButton按钮"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.image,
                  transition: TransitionType.native);
            },
            child: const Text("Image图片"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.switchs,
                  transition: TransitionType.native);
            },
            child: const Text("Switch,Checkbox单选开关复选开关"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.textField,
                  transition: TransitionType.native);
            },
            child: const Text("TextField,Form输入框及表单"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.progress,
                  transition: TransitionType.native);
            },
            child: const Text(
                "LinearProgressIndicator,CircularProgressIndicator,Timer进度指示器"),
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
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.decoratedBox,
                  transition: TransitionType.native);
            },
            child: const Text("DecoratedBox 装饰容器"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.transform,
                  transition: TransitionType.native);
            },
            child: const Text("Transform RotatedBox 变换 旋转 缩放"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.container,
                  transition: TransitionType.native);
            },
            child: const Text("Container 大佬组件啊"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.clip,
                  transition: TransitionType.native);
            },
            child: const Text("Clip 剪切"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.fittedBox,
                  transition: TransitionType.native);
            },
            child: const Text("FittedBox 空间适配"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.scaffoldAppBar,
                  transition: TransitionType.native);
            },
            child: const Text(
                "Scaffold,AppBar,Drawer,FloatingActionButton,BottomNavigationBar"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(
                  context, Routes.singleChildScrollView,
                  transition: TransitionType.native);
            },
            child: const Text("SingleChildScrollView 单个子组件的滚动视图，没有延迟加载"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.listView,
                  transition: TransitionType.native);
            },
            child: const Text("ListView 列表视图"),
          ),
          TextButton(
              onPressed: () {
                Application.router.navigateTo(context, Routes.scrollController,
                    transition: TransitionType.native);
              },
              child: const Text(
                  "ScrollController, ScrollPosition, NotificationListener滚动监听")),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.animatedList,
                  transition: TransitionType.native);
            },
            child: const Text("AnimatedList 动画列表"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.gridView,
                  transition: TransitionType.native);
            },
            child: const Text("GridView 网格列表"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.pageView,
                  transition: TransitionType.native);
            },
            child: const Text("PageView,AutomaticKeepAliveClientMixin页面缓存"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.tabBarView,
                  transition: TransitionType.native);
            },
            child: const Text("TabBarView,DefaultTabController 选项卡视图"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.customScrollView,
                  transition: TransitionType.native);
            },
            child:
                const Text("CustomScrollView Sliver 悬浮 NavBar Header 自定义滚动视图"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.nestedScrollView,
                  transition: TransitionType.native);
            },
            child: const Text("NestedScrollView 嵌套滚动视图"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.willPopScope,
                  transition: TransitionType.native);
            },
            child: const Text("WillPopScope 控制返回"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.inheritedWidget,
                  transition: TransitionType.native);
            },
            child: const Text("InheritedWidget 共享状态"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.provider,
                  transition: TransitionType.native);
            },
            child: const Text("Provider 状态管理"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.theme,
                  transition: TransitionType.native);
            },
            child: const Text("Theme 主题 颜色"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(
                  context, Routes.valueListenableBuilder,
                  transition: TransitionType.native);
            },
            child: const Text("ValueListenableBuilder 值变化监听"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.futureStream,
                  transition: TransitionType.native);
            },
            child: const Text("FutureBuilder StreamBuilder 异步UI"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.alertDialog,
                  transition: TransitionType.native);
            },
            child: const Text("AlertDialog 各种弹框 时间日期"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(
                  context, Routes.listenerAbsorbBointer,
                  transition: TransitionType.native);
            },
            child: const Text("Listener AbsorbBointer 指针事件"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(
                  context, Routes.gestureDetectorRecognizer,
                  transition: TransitionType.native);
            },
            child: const Text("GestureDetector 手势检测"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.eventBus,
                  transition: TransitionType.native);
            },
            child: const Text("EventBus 事件总线，单例"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.notification,
                  transition: TransitionType.native);
            },
            child: const Text("Notification 通知"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.animation,
                  transition: TransitionType.native);
            },
            child: const Text("AnimatedBuilder,AnimationController 动画"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.hero,
                  transition: TransitionType.native);
            },
            child: const Text("Hero 动画"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.animationGroup,
                  transition: TransitionType.native);
            },
            child: const Text("交织动画  动画组"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.animatedSwitcher,
                  transition: TransitionType.native);
            },
            child: const Text("AnimatedSwitcher 动画切换  动画过渡组件"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.gradientBtn,
                  transition: TransitionType.native);
            },
            child: const Text("自己实现渐变色按钮 InkWell 涟漪组件"),
          ),
          TextButton(
            onPressed: () {
              Application.router.navigateTo(context, Routes.customPaintCanvas,
                  transition: TransitionType.native);
            },
            child: const Text("自绘组件 CustomPaint Canvas"),
          ),
        ],
      ),
    );
  }
}
