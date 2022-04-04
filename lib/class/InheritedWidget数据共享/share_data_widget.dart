import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  final int data;

  /// 读取并依赖数据 会刷新
  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  /// 只读取数据，不会刷新
  static ShareDataWidget? onlyRead(BuildContext context) {
    var w = context
        .getElementForInheritedWidgetOfExactType<ShareDataWidget>()
        ?.widget;
    if (w is ShareDataWidget) {
      return w;
    }
    return null;
  }

  /// 数据发生变化时  是否通知子树中依赖数据的 widget 重新 build
  @override
  bool updateShouldNotify(covariant ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}
