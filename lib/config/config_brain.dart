import 'package:flutter_images_explorer/models/hero_model.dart';

class ConfigBrain {
  List<HeroModel> heroList = [
    HeroModel(
      name: "Capitán América",
      imageUrl: "assets/image/capitan.png",
      answer: true,
    ),
    HeroModel(
      name: "Iron Man",
      imageUrl: "assets/image/ironman.png",
      answer: true,
    ),
    HeroModel(
      name: "Hulk",
      imageUrl: "assets/image/hulk.png",
      answer: true,
    ),
    HeroModel(
      name: "Spiderman",
      imageUrl: "assets/image/spiderman.png",
      answer: true,
    ),
    HeroModel(
      name: "Mujer maravilla",
      imageUrl: "assets/image/mujer_maravilla.png",
      answer: true,
    ),
    HeroModel(
      name: "Antman",
      imageUrl: "assets/image/antman.png",
      answer: true,
    ),
    HeroModel(
      name: "Pantera Negra",
      imageUrl: "assets/image/pantera.png",
      answer: true,
    )
  ];

  int heroIndex = 0;

  // String getQuestionText() {
  //   return heroList[heroIndex].question;
  // }

  bool getQuestionAnswer() {
    return heroList[heroIndex].answer;
  }

  String getAnswerNumber() {
    return (heroIndex + 1).toString();
  }

  void nextQuestion() {
    if (heroIndex < heroList.length - 1) {
      heroIndex++;
    }
  }
}
