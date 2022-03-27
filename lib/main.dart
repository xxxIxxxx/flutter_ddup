import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ddup/app/app_component.dart';

void collectLog(String line) {
  //收集日志
}
void reportErrorAndLog(FlutterErrorDetails details) {
  //上报错误和日志逻辑
}

void main() {
  var onError = FlutterError.onError; //先将 onerror 保存起来
  FlutterError.onError = (FlutterErrorDetails details) {
    onError?.call(details); //调用默认的onError
    reportErrorAndLog(details); //上报
  };
  runZoned(
    () => runApp(const AppComponent()),
    zoneSpecification: ZoneSpecification(
      // 拦截print 蜀西湖
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        collectLog(line);
        parent.print(zone, "Interceptor: $line");
      },
      // 拦截未处理的异步错误
      handleUncaughtError: (Zone self, ZoneDelegate parent, Zone zone,
          Object error, StackTrace stackTrace) {
        parent.print(zone, '${error.toString()} $stackTrace');
      },
    ),
  );
}
