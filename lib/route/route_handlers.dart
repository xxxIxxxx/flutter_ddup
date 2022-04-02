import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ddup/app/home_page.dart';
import '../class/Align,Center对齐与相对定位/align_center_page.dart';
import '../class/Clip剪切组件/clip_page.dart';
import '../class/Container组件/container_page.dart';
import '../class/DecoratedBox装饰容器渐变边框等/decorated_box_page.dart';
import '../class/ElevatedButton,TextButton,OutlinedButton,IconButton按钮/button_page.dart';
import '../class/FittedBox空间适配/fitted_box_page.dart';
import '../class/Flex,Expanded,Spacer弹性布局/flex_expanded_page.dart';
import '../class/Image图片/image_page.dart';
import '../class/LayoutBuilder获取父组件传递的约束信息/layout_builder_page.dart';
import '../class/LinearProgressIndicator,CircularProgressIndicator,Timer进度指示器/progress_page.dart';
import '../class/ListView/list_view_page.dart';
import '../class/Padding填充/padding_page.dart';
import '../class/Row,Column线性布局/row_page.dart';
import '../class/Scaffold,AppBar,Drawer,FloatingActionButton,BottomNavigationBar/scaffold_app_bar_page.dart';
import '../class/ScrollController,ScrollPosition,NotificationListener滚动监听/scroll_controller_page.dart';
import '../class/SingleChildScrollView不会延迟加载的滚动View/single_child_scroll_view_page.dart';
import '../class/Stack,Positioned层叠布局/stack_positioned_page.dart';
import '../class/Switch,Checkbox单选开关复选开关/switch_page.dart';
import '../class/TextField,Form输入框及表单/text_field_page.dart';
import '../class/Text文本及样式/text_page.dart';
import '../class/Transform,RotatedBox变换旋转缩放/transform_rotated_box_page.dart';
import '../class/UnconstrainedBox,ConstrainedBox,SizedBox约束布局/constraints_page.dart';
import '../class/Warp,Flow流式布局/warp_flow_page.dart';
import '../class/widget生命周期/counter_life_cycle_page.dart';
import '../class/路由传值/tipRoute_page.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MyHomePage();
});

var lifeCycleHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//MARK: 通过自定义类 传递参数
  CounterLifeCycleArg? arg;
  if (context?.settings?.arguments is CounterLifeCycleArg) {
    arg = context?.settings?.arguments as CounterLifeCycleArg;
  }
  return CounterLifeCycleWidget(arg: arg);
});

var tipRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  //MARK:通过链接传递参数
  final tipStr = params['tip']?.first ?? "默认值";
  return TipRoutePage(tipStr: tipStr);
});

var textHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const TextPage();
});

var buttonHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ButtonPage();
});

var imageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ImagePage();
});

var switchHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const SwitchPage();
});

var textFieldHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const TextFieldPage();
});

var progressHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ProgressPage();
});

var constraintsHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ConstraintsPage();
});

var rowColumnHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const RowPage();
});

var flexExpandedHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const FlexExpandedPage();
});

var warpFlowHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const WarpFlowPage();
});

var stackPositionedHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const StackPositionedPage();
});

var alignCenterHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const AlignCenterPage();
});

var layoutBuilderHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const LayoutBuilderPage();
});

var paddingHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const PaddingPage();
});

var decoratedBoxHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const DecoratedBoxPage();
});

var transformRotatedHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const TransformRotatedBoxPage();
});

var containerHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ContainerPage();
});

var clipHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ClipPage();
});

var fittedBoxHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const FittedBoxPage();
});

var scaffoldAppBarHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ScaffoldAppBarPage();
});

var singleChildScrollViewHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const SingleChildScrollViewPage();
});

var listViewHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ListViewPage();
});

var scrollControllerViewHandeler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ScrollControllerPage();
});
