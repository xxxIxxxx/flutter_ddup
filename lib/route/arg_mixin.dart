import 'package:flutter/material.dart';

mixin Arg {
  /// RouteSettings.arguments
  RouteSettings get rs {
    return RouteSettings(arguments: this);
  }
}
