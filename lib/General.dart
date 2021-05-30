import 'dart:io';

class General {
  String askQuestion(String question) {
    print(question);
    String? answer = stdin.readLineSync();
    answer = answer ?? '';
    return answer.toLowerCase();
  }
}