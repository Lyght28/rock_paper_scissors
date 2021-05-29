import 'dart:convert';
import 'dart:io';

import 'Shape.dart';

class ShapesFactory {
  final String path;

  ShapesFactory([this.path = 'lib/shapes/Shapes.json']);

  String readFile() => File(path).readAsStringSync();

  List<dynamic> toJson(String file) => jsonDecode(file);

  List<Shape> getShapesFromJson(List<dynamic> json) {
    List<Shape> shapeList = [];
    json.forEach((shape) {shapeList.add(Shape.fromJson(shape as Map<String, dynamic> ));});
    return shapeList;
  }

  List<Shape> getShapes() => getShapesFromJson(toJson(readFile()));

}


