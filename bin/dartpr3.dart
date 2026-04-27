import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:characters/characters.dart';

enum Mood { happy, sad, excited, tired, angry }

void main() {
  print('Введите ваше имя:');
  String name = stdin.readLineSync(encoding: utf8)!;
  
  print('\nГенерируем случайное настроение...');
  
  List<Mood> moods = Mood.values;
  Random random = Random();
  Mood randomMood = moods[random.nextInt(moods.length)];
  
  String emoji;
  String description;
  int energy;
  
  switch (randomMood) {
    case Mood.happy:
      emoji = '\u{1F60A}';
      description = 'счастливый';
      energy = 8;
      break;
    case Mood.sad:
      emoji = '\u{1F622}';
      description = 'грустный';
      energy = 3;
      break;
    case Mood.excited:
      emoji = '\u{1F60E}';
      description = 'взволнованный';
      energy = 9;
      break;
    case Mood.tired:
      emoji = '\u{1F634}';
      description = 'уставший';
      energy = 2;
      break;
    case Mood.angry:
      emoji = '\u{1F621}';
      description = 'злой';
      energy = 5;
      break;
  }
  
  print('Привет, $name! Твое настроение: $emoji $description (энергия: $energy/10)');
  
  int codePoint = emoji.runes.first;
  print('\nЮникод вашего эмодзи: U+${codePoint.toRadixString(16).toUpperCase()}');
  
  print('\nХотите просмотреть сложные эмодзи? (y/n):');
  String answer = stdin.readLineSync()!;
  
  if (answer.toLowerCase() == 'y') {
    print('Введите комбинацию эмодзи:');
    String complexEmoji = stdin.readLineSync(encoding: utf8)!;
    
    print('\nАнализ строки "$complexEmoji":');
    print('- 16-битных единиц: ${complexEmoji.length}');
    print('- Кодовых точек: ${complexEmoji.runes.length}');
    print('- Реальных символов: ${complexEmoji.characters.length}');
    
    print('\nПодробный вывод юникода:');
    int index = 1;
    for (int rune in complexEmoji.runes) {
      String symbol = String.fromCharCode(rune);
      print('Символ $index: $symbol → U+${rune.toRadixString(16).toUpperCase()}');
      index++;
    }
  }
  
  print('\nСпасибо, приходите снова!');
}