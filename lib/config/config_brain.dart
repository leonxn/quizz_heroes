import 'package:flutter_images_explorer/models/hero_model.dart';
import 'package:flutter_images_explorer/models/answer_model.dart';

class ConfigBrain {
  List<HeroModel> heroList = [
    HeroModel(
      name: "Capitán América",
      imageUrl: "assets/image/capitan.png",
      answer: [
        AnswerModel(textAnswer: "El Americano", isCorrect: false),
        AnswerModel(textAnswer: "Capitán Americano", isCorrect: false),
        AnswerModel(textAnswer: "Capitán America", isCorrect: true),
        AnswerModel(textAnswer: "Sr Capitán", isCorrect: false),
      ],
    ),
    HeroModel(
      name: "Iron Man",
      imageUrl: "assets/image/ironman.png",
      answer: [
        AnswerModel(textAnswer: "Iron Trooper", isCorrect: false),
        AnswerModel(textAnswer: "Hombre de Acero", isCorrect: false),
        AnswerModel(textAnswer: "Iron Man", isCorrect: true),
        AnswerModel(textAnswer: "Iron Maiden", isCorrect: false),
      ],
    ),
    HeroModel(
      name: "Hulk",
      imageUrl: "assets/image/hulk.png",
      answer: [
        AnswerModel(textAnswer: "Hulk", isCorrect: true),
        AnswerModel(textAnswer: "Hombre Verde", isCorrect: false),
        AnswerModel(textAnswer: "Super Hulk", isCorrect: false),
        AnswerModel(textAnswer: "Hulk Hogan", isCorrect: false),
      ],
    ),
    HeroModel(
      name: "Spiderman",
      imageUrl: "assets/image/spiderman.png",
      answer: [
        AnswerModel(textAnswer: "Mr Araña", isCorrect: false),
        AnswerModel(textAnswer: "El hombre tarantula", isCorrect: false),
        AnswerModel(textAnswer: "Spidermen", isCorrect: false),
        AnswerModel(textAnswer: "Spiderman", isCorrect: true),
      ],
    ),
    HeroModel(
      name: "Mujer maravilla",
      imageUrl: "assets/image/mujer_maravilla.png",
      answer: [
        AnswerModel(textAnswer: "Mujer Maravilla", isCorrect: true),
        AnswerModel(textAnswer: "Srta Maravilla", isCorrect: false),
        AnswerModel(textAnswer: "Sra Maravilla", isCorrect: false),
        AnswerModel(textAnswer: "Super Maravilla", isCorrect: false),
      ],
    ),
    HeroModel(
      name: "Antman",
      imageUrl: "assets/image/antman.png",
      answer: [
        AnswerModel(textAnswer: "Araña Grande", isCorrect: false),
        AnswerModel(textAnswer: "El Insecto", isCorrect: false),
        AnswerModel(textAnswer: "Antman", isCorrect: true),
        AnswerModel(textAnswer: "El abejorro", isCorrect: false),
      ],
    ),
    HeroModel(
      name: "Pantera Negra",
      imageUrl: "assets/image/pantera.png",
      answer: [
        AnswerModel(textAnswer: "Gato Negro", isCorrect: false),
        AnswerModel(textAnswer: "Pantera Negra", isCorrect: true),
        AnswerModel(textAnswer: "Don Gato", isCorrect: false),
        AnswerModel(textAnswer: "Black Tiger", isCorrect: false),
      ],
    )
  ];

  int heroIndex = 0;
  int puntaje = 0;
  String getHeroImg() {
    return heroList[heroIndex].imageUrl;
  }

  // Respuestas solo Texto
  String getHeroAnswerText1() {
    return heroList[heroIndex].answer[0].textAnswer;
  }

  String getHeroAnswerText2() {
    return heroList[heroIndex].answer[1].textAnswer;
  }

  String getHeroAnswerText3() {
    return heroList[heroIndex].answer[2].textAnswer;
  }

  String getHeroAnswerText4() {
    return heroList[heroIndex].answer[3].textAnswer;
  }

  // Respuestas validacion si es correcta

  bool isHeroAnswerCorrect1() {
    return heroList[heroIndex].answer[0].isCorrect;
  }

  bool isHeroAnswerCorrect2() {
    return heroList[heroIndex].answer[1].isCorrect;
  }

  bool isHeroAnswerCorrect3() {
    return heroList[heroIndex].answer[2].isCorrect;
  }

  bool isHeroAnswerCorrect4() {
    return heroList[heroIndex].answer[3].isCorrect;
  }

  String getAnswerNumber() {
    return (heroIndex + 1).toString();
  }

  void nextQuestion() {
    if (heroIndex < heroList.length - 1) {
      heroIndex++;
    }
  }

  bool isFinished() {
    print(heroIndex);
    print(heroList.length - 1);
    return heroIndex > heroList.length - 2 ? true : false;
  }

  void restarQuizz() {
    heroIndex = 0;
    puntaje = 0;
  }

  void updatePuntaje(bool isCorrect) {
    if (isCorrect) {
      puntaje++;
    }
  }
}
