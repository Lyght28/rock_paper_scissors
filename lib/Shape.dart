class Shape {

  final String name;
  final List<String> win;
  final List<String> lose;
  final List<String> draw;

  Shape({this.name = "", this.win = const [], this.lose = const [], this.draw = const []});

  factory Shape.fromJson(Map<String, dynamic> json) {
    return Shape(name: json['object'] as String, win: json['win'].cast<String>(), lose: json['lose'].cast<String>(), draw: [json['object'], ...json['draw'].cast<String>()] );
  }

  @override
  String toString() {
    return '$name';
  }
}