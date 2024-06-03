import 'package:flutter/material.dart';
import 'package:flutter_images_explorer/config/config_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AnswerWidget extends StatefulWidget {
  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  ConfigBrain configBrain = ConfigBrain();
  List<Widget> score = [];

  void checkAnswer(bool userAnswer, String numberQuestion) {
    if (configBrain.isFinished() == true) {
      int totalpuntaje = configBrain.puntaje;
      Alert(
          context: context,
          type: totalpuntaje == 0 ? AlertType.error : AlertType.success,
          title: "QuizApp Heroes",
          desc:
              "El cuestionario ha llegado a su fin, obtuviste $totalpuntaje puntos.",
          buttons: [
            DialogButton(
                child: Text("Aceptar"),
                onPressed: () {
                  configBrain.restarQuizz();
                  score.clear();
                  Navigator.pop(context);
                  setState(() {});
                }),
          ]).show();
    } else {
      if (true == userAnswer) {
        score.add(itemScore(numberQuestion, true));
        configBrain.updatePuntaje(true);
        int totalpuntaje = configBrain.puntaje;
        print("total puntaje=$totalpuntaje");
        print("CORRECTO");
      } else {
        score.add(itemScore(numberQuestion, false));
        configBrain.updatePuntaje(false);
        int totalpuntaje = configBrain.puntaje;
        print("total puntaje=$totalpuntaje");
        print("INCORRECTO");
      }
      configBrain.nextQuestion();
    }
    setState(() {});
  }

  Widget itemScore(String numberQuestion, bool isCorrect) {
    return Row(
      children: [
        Text(
          "$numberQuestion: ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.greenAccent : Colors.redAccent,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
