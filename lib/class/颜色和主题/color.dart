import 'dart:math';
import 'package:flutter/material.dart';

extension ColorX on Color {
  static Color get random {
    return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
  }

  static Color get randomLight {
    return Color.fromARGB(255, Random().nextInt(200), Random().nextInt(200),
        Random().nextInt(200));
  }

  static Color get randomDark {
    return Color.fromARGB(255, Random().nextInt(100), Random().nextInt(100),
        Random().nextInt(100));
  }

  static Color hex(String hexString) {
    hexString = hexString.replaceAll('#', '');
    if (hexString.length == 6) {
      hexString = 'ff' + hexString;
    }
    if (hexString.length == 8) {
      return Color.fromARGB(
          int.parse('0x${hexString.substring(0, 2)}'),
          int.parse('0x${hexString.substring(2, 4)}'),
          int.parse('0x${hexString.substring(4, 6)}'),
          int.parse('0x${hexString.substring(6, 8)}'));
    } else {
      throw FormatException('"$hexString" is not a valid hex color');
    }
  }
}

extension ListRandom on List {
  T random<T>() {
    return elementAt(Random().nextInt(length - 1));
  }
}
