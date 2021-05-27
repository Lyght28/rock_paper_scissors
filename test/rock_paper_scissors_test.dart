import 'package:rock_paper_scissors/rock_paper_scissors.dart';
import 'package:test/test.dart';

void main(List<String> arguments) {
  int? nbTurn = arguments.isNotEmpty ? int.tryParse(arguments[0]) : 1;
  Janken janken = Janken(nbTurn != null ? nbTurn : 1);
  janken.main();
}
