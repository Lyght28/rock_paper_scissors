import 'dart:io';
import 'dart:math';

import 'package:rock_paper_scissors/Shape.dart';
import 'package:rock_paper_scissors/shapesFactory.dart';

class Janken {
  late Random random; //init random class
  late ShapesFactory shapesFactory;
  late List<Shape> shapes;

  Map<String, int> results = {
    'win': 0,
    'lose': 0,
    'draw': 0,
  };

  int nbTurn = 0;

  Janken([int nbTurn = 1]) {
    this.nbTurn = nbTurn;
    init();
  }

  void init() {
    random = Random();
    shapesFactory = ShapesFactory();
    shapes = shapesFactory.getShapes();
  }


  String question() => 'Do you want to play rock, paper or scissors ?';

  String askQuestion() {
    print(question());
    String? answer = stdin.readLineSync();
    answer = answer ?? '';
    return answer.toLowerCase();
  }

  bool verifyQuestion(String answer) {
    if (shapes.any((shape) => (shape.alternativeNames).contains(answer))) //check in the list of symbols if the answer is in.
      return true;
    else
      return false;
  }

  Shape convertUserShape(String answer) {
    late Shape userShape;
    shapes.forEach((shape) {
      if ((shape.alternativeNames).contains(answer)) {
        userShape = shape;
      }});
    return userShape;
  }

  //to get the right answer
  Shape getUserShape() {
    String answer = askQuestion();
    while (!verifyQuestion(answer)) {
      print('Your answer is not correct, please try again.');
      answer = askQuestion();
    }
    return convertUserShape(answer);
  }

  //to make the computer play
  Shape playRandom() => shapes[random.nextInt(shapes.length)];

  void printAgainst(Shape user, Shape computer) {
    print('$user against $computer.');
  }

  static const Map<String, String> resultSentences = {
    'win' : 'GG, you win !',
    'lose': 'Oh no, you lose.',
    'draw': 'Just a draw',
  };

  void result(Shape user, Shape computer) {
    String result = user.fight(computer);
    if (results[result] != null && results.containsKey(result)) {
      results[result] = results[result] is int ? results[result]! + 1 : 1;
    }
    print(resultSentences[result]);
  }

  void printFinalResult() {
    results.forEach((key, value) {print('$key : $value');});
  }

  //each turn, this should be called
  void turn() {
    Shape user = getUserShape();
    Shape computer = playRandom();
    printAgainst(user, computer);
    result(user, computer);
  }

  void main() {
    for (int i = 0; i < nbTurn; i++) {
      turn();
    }
    printFinalResult();
  }
}
