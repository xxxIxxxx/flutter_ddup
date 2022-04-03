import 'package:flutter/material.dart';

typedef SliverHeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({
    required this.maxHeight,
    this.minHeight = 0,
    required Widget child,
  }) : builder = ((a, b, c) => child);

  /// 最大最小高度相同 构造方法
  SliverHeaderDelegate.fixHeight(
      {required double height, required Widget child})
      : builder = ((a, b, c) => child),
        maxHeight = height,
        minHeight = height;

  /// 自定义 builder
  SliverHeaderDelegate.builder(
      {required this.maxHeight, this.minHeight = 0, required this.builder});

  final double maxHeight;
  final double minHeight;
  final SliverHeaderBuilder builder;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxHeight ||
        oldDelegate.minExtent != minHeight;
  }
}
