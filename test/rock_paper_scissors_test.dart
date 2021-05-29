import 'dart:convert';
import 'dart:math';

import 'package:rock_paper_scissors/Shape.dart';
import 'package:test/test.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _r = Random();

String generateRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_r.nextInt(_chars.length))));

String stringToJsonFormat(String string) => '"' + string + '"';

List<String> generateRandomArrayWithString(int len) {
  List<String> list = [];
  for (int i = 0; i < len; i++) {
    list.add(generateRandomString(_r.nextInt(15)));
  }
  return list;
}

List<String> listToJsonFormat(List<String> list) {
  for (int i = 0; i < list.length; i++) {;
    list[i] = stringToJsonFormat(list[i]);
  } return list;
}

void main() {


  test('Creation of a shape from json', () {
    String name = generateRandomString(5);

    List<String> alternativeNames = generateRandomArrayWithString(1 + _r.nextInt(5));
    List<String> alternativeNamesJson = List<String>.from(alternativeNames);
    listToJsonFormat(alternativeNamesJson);

    List<String> win = generateRandomArrayWithString(1 + _r.nextInt(5));
    List<String> winJson = List<String>.from(win);
    listToJsonFormat(winJson);

    List<String> lose = generateRandomArrayWithString(1 + _r.nextInt(5));
    List<String> loseJson = List<String>.from(lose);
    listToJsonFormat(loseJson);

    List<String> draw = generateRandomArrayWithString(1 + _r.nextInt(5));
    List<String> drawJson = List<String>.from(draw);
    listToJsonFormat(drawJson);

    Shape shape = Shape.fromJson(jsonDecode("""{
    "object": "$name",
    "alternativeNames": $alternativeNamesJson,

    "win": $winJson,
    "lose": $loseJson,
        "draw": $drawJson
    }"""));
    expect(shape.name, name);
    expect(shape.alternativeNames, [name, ...alternativeNames]);
    expect(shape.win, win);
    expect(shape.lose, lose);
    expect(shape.draw, [name, ...draw]);
  });
}