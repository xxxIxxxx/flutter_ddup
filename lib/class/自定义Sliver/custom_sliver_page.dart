// import 'dart:math';
//! 这一章好乱。。
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class CustomSliverPage extends StatefulWidget {
//   const CustomSliverPage({Key? key}) : super(key: key);

//   @override
//   _CustomSliverPageState createState() => _CustomSliverPageState();
// }

// class _CustomSliverPageState extends State<CustomSliverPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CustomSliver'),
//       ),
//       body: const CustomScrollView(
//         // 打开弹性
//         physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//         slivers: [],
//       ),
//     );
//   }
// }

// typedef SliverFlexibleHeaderBuilder = Widget Function(
//   BuildContext context,
//   double maxExtent,
//   ScrollDirection direction,
// );

// class SliverFlexibleHeader extends StatelessWidget {
//   const SliverFlexibleHeader({
//     Key? key,
//     this.visibleExtent = 0,
//     required this.builder,
//   }) : super(key: key);

//   final SliverFlexibleHeaderBuilder builder;
//   final double visibleExtent;

//   @override
//   Widget build(BuildContext context) {
//     return _SliverFlexibleHeader(
//       visibleExtent: visibleExtent,
//       child: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           return builder(context, 
//           constraints.maxHeight,
//           (constraints as ExtraInfoBoxConstraints<ScrollDirection>.extra)
//           );
//         },
//       ),
//     );
//   }
// }

// class _SliverFlexibleHeader extends SingleChildRenderObjectWidget {
//   const _SliverFlexibleHeader({
//     Key? key,
//     required Widget child,
//     this.visibleExtent = 0,
//   }) : super(key: key, child: child);

//   final double visibleExtent;

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return _FlexibleHeaderRenderSliver(visibleExtent);
//   }

//   @override
//   void updateRenderObject(
//       BuildContext context, covariant RenderObject renderObject) {
//     renderObject..visibleExtent = visibleExtent;
//   }
// }

// class _FlexibleHeaderRenderSliver extends RenderSliverToBoxAdapter {
//   _FlexibleHeaderRenderSliver(double visibleExtent)
//       : _visibleExtent = visibleExtent;

//   double _lastOverScroll = 0;
//   double _lastScrollOffset = 0;
//   late double _visibleExtent = 0;

//   set visibleExtent(double value) {
//     if (_visibleExtent == value) return;
//     // 可视长度发生变化
//     _lastOverScroll = 0;
//     _visibleExtent = value;
//     markNeedsLayout();
//   }

//   @override
//   void performLayout() {
//     // 滑动距离大于 _visibleExtent 时，表示子节点已经在屏幕外了
//     if (child == null || (constraints.scrollOffset > _visibleExtent)) {
//       geometry = SliverGeometry(scrollExtent: _visibleExtent);
//       return;
//     }

//     // 测试 overlap，下拉过程中 overlap 会变化
//     double overScroll = constraints.overlap < 0 ? constraints.overlap.abs() : 0;
//     var scrollOffset = constraints.scrollOffset;

//     // 在Viewport中顶部的可视空间为该 Sliver 可绘制的最大区域。
//     // 1. 如果Sliver已经滑出可视区域则 constraints.scrollOffset 会大于 _visibleExtent，
//     //    这种情况我们在一开始就判断过了。
//     // 2. 如果我们下拉超出了边界，此时 overScroll>0，scrollOffset 值为0，所以最终的绘制区域为
//     //    _visibleExtent + overScroll.
//     double paintExtent = _visibleExtent + overScroll - constraints.scrollOffset;
//     // 绘制高度不超过最大可绘制空间
//     paintExtent = min(paintExtent, constraints.remainingPaintExtent);

//     //对子组件进行布局，关于 layout 详细过程我们将在本书后面布局原理相关章节详细介绍，现在只需知道
//     //子组件通过 LayoutBuilder可以拿到这里我们传递的约束对象（ExtraInfoBoxConstraints）
//     child!.layout(
//       ExtraInfoBoxConstraints(
//           direction, constraints.asBoxConstraints(maxExtent: paintExtent)),
//       parentUsesSize: false,
//     );

//     //最大为_visibleExtent，最小为 0
//     double layoutExtent = min(_visibleExtent, paintExtent);

//     //设置geometry，Viewport 在布局时会用到
//     geometry = SliverGeometry(
//       scrollExtent: layoutExtent,
//       paintOrigin: -overScroll,
//       paintExtent: paintExtent,
//       maxPaintExtent: paintExtent,
//       layoutExtent: layoutExtent,
//     );
//   }
// }

// typedef SliverFlexibleHeaderBuilder = Widget Function(
//   BuildContext context,
//   double maxExtent,
//   //ScrollDirection direction,
// );

// class SliverFlexibleHeader extends StatelessWidget {
//   const SliverFlexibleHeader({
//     Key? key,
//     this.visibleExtent = 0,
//     required this.builder,
//   }) : super(key: key);

//   final SliverFlexibleHeaderBuilder builder;
//   final double visibleExtent;

//   @override
//   Widget build(BuildContext context) {
//     return _SliverFlexibleHeader(
//       visibleExtent: visibleExtent,
//       child: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           return builder(context, constraints.maxHeight);
//         },
//       ),
//     );
//   }
// }

// class ExtraInfoBoxConstraints<T> extends BoxConstraints {
//   ExtraInfoBoxConstraints(
//     this.extra,
//     BoxConstraints constraints,
//   ) : super(
//           minWidth: constraints.minWidth,
//           minHeight: constraints.minHeight,
//           maxWidth: constraints.maxWidth,
//           maxHeight: constraints.maxHeight,
//         );

//   // 额外的信息
//   final T extra;

//   // 重载 == 运算符
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     return other is ExtraInfoBoxConstraints &&
//         super == other &&
//         other.extra == extra;
//   }

//   @override
//   int get hashCode {
//     return hashValues(super.hashCode, extra);
//   }
// }
