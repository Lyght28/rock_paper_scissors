import 'dart:convert';
import 'dart:io';

import 'Shape.dart';

class ShapesFactory {
  final String path;

  ShapesFactory([this.path = 'shapes/Shapes.json']);

  String readFile() => File(path).readAsStringSync();

  List<dynamic> toJson(String file) => jsonDecode(file);

  List<Shape> getShapesFromJson(List<dynamic> json) {
    List<Shape> shapeList = [];
    json.forEach((shape) {shapeList.add(Shape.fromJson(shape as Map<String, dynamic> ));});
    return shapeList;
  }

  List<Shape> getShapes() => getShapesFromJson(toJson(readFile()));

}


void main() {


  ShapesFactory shapesFactory = ShapesFactory();

  var json = shapesFactory.toJson(shapesFactory.readFile());
  var test = json[0]['draw'].cast<String>();
  test.add("test");
  print(test.runtimeType);
  List<Shape> shapeList = shapesFactory.getShapes();

  shapeList.forEach((element) {print(element);});
  print(shapeList[0].draw);
}