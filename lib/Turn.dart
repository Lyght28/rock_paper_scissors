import 'dart:io';
import 'dart:math';

class Janken {
  final random = Random();//init random class

  //different list to recognize error of user
  static const List rock = ['rock', 'rocks', 'r', '1'];
  static const List paper = ['paper', 'papers', 'p', '2'];
  static const List scissors = ['scissor', 'scissors', 's', '3'];
  final List symbols = const [rock, paper, scissors];

  final rule = const {
    'rock': ['scissors', 'paper', 'rock'],
    'paper': ['rock', 'scissors', 'paper'],
    'scissors': ['paper', 'rock', 'scissors'],
  }; //first item : win against, second : lose, third draw.

  int win = 0;
  int draw = 0;
  int lose = 0;

  int nbTurn = 0;

  Janken(this.nbTurn);

  String question() => 'Do you want to play rock, paper or scissors ?';

  String askQuestion() {
    print(question());
    String? answer = stdin.readLineSync();
    answer = answer ?? '';
    return answer.toLowerCase();
  }

  bool verifyQuestion(String answer) {
    if (symbols.any((symbol) => symbol.contains(answer))) //check in the list of symbols if the answer is in.
      return true;
    else
      return false;
  }

  String convertAnswer(String answer) {
    int value = 0;
    symbols.forEach((symbol) { if(symbol.contains(answer)) value = symbols.indexOf(symbol); } );//return the index of the list which contain the right answer.
    switch (value) {
      case 0:
        return 'rock';
      case 1:
        return 'paper';
      case 2:
        return 'scissors';
      default:
        return '';
    }
  }

  //to get the right answer
  String getAnswer() {
    String answer = askQuestion();
    while (!verifyQuestion(answer)) {
      print('Your answer is not correct, please try again.');
      answer = askQuestion();
    }
    return convertAnswer(answer);
  }

  //to make the computer play
  String playRandom() {
    switch (random.nextInt(2)) {
      case 0:
        return 'rock';
      case 1:
        return 'paper';
      case 2:
        return 'scissors';
      default:
        return '';
    }
  }

  bool? results(String player, String computer) {
    switch(rule[player]!.indexOf(computer)) {
      case 0:
        print('Player win.');
        return true;
      case 1:
        print('Player lose.');
        return false;
      case 2:
        print('Draw.');
        return null;
    }
  }

  void printAgainst(String player, String computer) {
    print('$player against $computer.');
  }

  //each turn, this should be called
  void turn() {
    String player = getAnswer();
    String computer = playRandom();
    printAgainst(player, computer);
    switch (results(player, computer)) {
      case true:
        win++;
        break;
      case false:
        lose++;
        break;
      default:
        draw++;
    }
  }


  void main() {
    for (int i = 0; i < nbTurn; i++) {
      turn();
    }
    print('Win : $win\nLose : $lose\nDraw : $draw');
  }
}