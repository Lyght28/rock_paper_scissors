import 'package:rock_paper_scissors/Janken.dart';


void main(List<String> arguments) {
  int? nbTurn = arguments.isNotEmpty ? int.tryParse(arguments[0]) : null;
  Janken janken = Janken(nbTurn != null ? nbTurn : 1);
  janken.main();
}