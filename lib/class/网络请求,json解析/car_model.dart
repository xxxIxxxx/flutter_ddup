import 'package:json_annotation/json_annotation.dart';
part 'car_model.g.dart';

// 使用代码块 jsf 和 jsc 可快速创建
// 使用 VSCode 显示命令(shift + cmd + p) -> 运行任务 -> flutter:flutter pub run build_runner watch

@JsonSerializable()
class CarModel {
  final String name;
  final double price;
  final String img;

  CarModel(this.name, this.price, this.img);

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarModelToJson(this);
}
