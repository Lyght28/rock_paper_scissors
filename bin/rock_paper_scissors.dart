import 'package:rock_paper_scissors/Janken.dart';
import 'package:rock_paper_scissors/General.dart';


void main() {
  General general = General();

  do {
    int? nbTurn = int.tryParse(general.askQuestion('How many turns do you want to play ?'));
    Janken janken = Janken(nbTurn != null ? nbTurn : 1);
    janken.main();
  } while (general.askQuestion('Do you want to play again (y/n) ?') == 'y');


}