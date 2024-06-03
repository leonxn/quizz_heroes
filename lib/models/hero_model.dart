import 'package:flutter_images_explorer/models/answer_model.dart';

class HeroModel {
  String name;
  String imageUrl;
  List<AnswerModel> answer;

  //COSTRUCTOR POR DEFECTO
  // HeroModel(this.name, this.imageUrl);

  //CONSTRUCTOR CON PARAMETROS
  // HeroModel.conParametros({required this.name, required this.imageUrl});
  HeroModel({
    required this.name,
    required this.imageUrl,
    required this.answer,
  }); //PARAMETROS REQUIRED O SEA SON NECESARIOS SI O SI
}
