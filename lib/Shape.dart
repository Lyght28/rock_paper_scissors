class Shape {

  final String name;
  final List<String> alternativeNames;
  final List<String> win;
  final List<String> lose;
  final List<String> draw;


  Shape({this.name = "", this.alternativeNames = const [], this.win = const [], this.lose = const [], this.draw = const []});

  factory Shape.fromJson(Map<String, dynamic> json) {
    return Shape(name: json['object'] as String, alternativeNames: [json['object'], ...json['alternativeNames'].cast<String>()], win: json['win'].cast<String>(), lose: json['lose'].cast<String>(), draw: [json['object'], ...json['draw'].cast<String>()] );
  }

  @override
  String toString() {
    return '$name';
  }

  bool asWin(Shape opponent) => win.contains(opponent.name) ? true : false;
  bool asLose(Shape opponent) => lose.contains(opponent.name) ? true : false;
  bool asDraw(Shape opponent) => draw.contains(opponent.name) ? true : false;

  String fight(Shape opponent) {
    if (asWin(opponent)) {
      return 'win';
    } else if (asLose(opponent)) {
      return 'lose';
    } else if (asDraw(opponent)) {
      return 'draw';
    } else {
      throw 'no state between each shape';
    }
  }



}