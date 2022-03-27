import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ddup/app/home_page.dart';
import '../class/widget生命周期/counter_life_cycle_page.dart';
import '../class/路由传值/tipRoute_page.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MyHomePage();
});

var lifeCycleHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
//MARK: 通过自定义类 传递参数
  final arg = context?.settings?.arguments as CounterLifeCycleArg;
  return CounterLifeCycleWidget(arg: arg);
});

var tipRouteHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  //MARK:通过链接传递参数
  final tipStr = params['tip']?.first ?? "默认值";
  return TipRoutePage(tipStr: tipStr);
});
