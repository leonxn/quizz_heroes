import 'package:flutter/material.dart';
import 'package:flutter_images_explorer/config/config_brain.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter_images_explorer/widgets/button_answer_widget.dart';
import 'package:flutter_images_explorer/constans/constans.dart';

class ImageExplorerPage extends StatefulWidget {
  @override
  State<ImageExplorerPage> createState() => _ImageExplorerPageState();
}

class _ImageExplorerPageState extends State<ImageExplorerPage> {
  ConfigBrain configBrain = ConfigBrain();
  List<Widget> score = [];
  List<Widget> buttonAnswer = [];

  void generateButtonAnswer() {
    for (int i = 0; i < 4; i++) {
      buttonAnswer.add(
        ButtonAnswerWidget(
          colorAnswer: configBrain.getColorButtonAnswer(i),
          nameAnswer: configBrain.getHeroAnswerText(i),
          onPressed: () {
            checkAnswer(configBrain.isHeroAnswerCorrect(i),
                configBrain.getAnswerNumber());
          },
        ),
      );
      // buttonAnswer.add(
      //   Expanded(
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         height: double.infinity,
      //         child: MaterialButton(
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(10.0),
      //           ),
      //           onPressed: () {
      //             print(configBrain.getHeroAnswerText(i));
      //             checkAnswer(configBrain.isHeroAnswerCorrect(i),
      //                 configBrain.getAnswerNumber());
      //             // buttonAnswer.clear();
      //             // generateButtonAnswer();
      //           },
      //           color: configBrain.getColorButtonAnswer(i),
      //           child: Text(
      //             configBrain.getHeroAnswerText(i),
      //             style: textoButton,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // );
    }
    print(buttonAnswer[0]);
  }

  void checkAnswer(bool userAnswer, String numberQuestion) {
    if (configBrain.isFinished() == true) {
      int totalpuntaje = configBrain.puntaje;
      // Alert(
      //     context: context,
      //     type: totalpuntaje == 0 ? AlertType.error : AlertType.success,
      //     title: "QuizApp Heroes",
      //     desc:
      //         "El cuestionario ha llegado a su fin, obtuviste $totalpuntaje puntos.",
      //     buttons: [
      //       DialogButton(
      //           color: Color(0xff564788),
      //           child: Text(
      //             "Aceptar",
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           onPressed: () {
      //             configBrain.restarQuizz();
      //             score.clear();
      //             Navigator.pop(context);
      //             setState(() {});
      //           }),
      //     ]).show();

      QuickAlert.show(
        context: context,
        type: totalpuntaje == 0 ? QuickAlertType.error : QuickAlertType.success,
        title: 'QuizApp Heroes',
        // text:
        //     'El cuestionario ha llegado a su fin, obtuviste $totalpuntaje puntos.',
        widget: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'El cuestionario ha llegado a su fin,',
                style: textoSpamPrimary,
              ),
              TextSpan(
                text: 'obtuviste $totalpuntaje puntos.',
                style: textoSpamSecondary,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        titleColor: Colors.black,
        textColor: Colors.black,
        confirmBtnText: 'Aceptar',
        onConfirmBtnTap: () {
          configBrain.restarQuizz();
          score.clear();
          buttonAnswer.clear();
          generateButtonAnswer();
          //buttonAnswer.clear();
          Navigator.pop(context);
          setState(() {});
        },
      );
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
      buttonAnswer.clear();
      generateButtonAnswer();
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
            fontSize: 20,
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
  void initState() {
    // TODO: implement initState
    super.initState();
    generateButtonAnswer();
  }

  //String heroName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "¿Como se llama el superheroe?",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(
                    configBrain.getHeroImg(),
                  ),
                  // NetworkImage(
                  //   heroList[indexHeroList].imageUrl,
                  // ),
                  fit: BoxFit.cover,
                ),
              ),
              // child: Image.network(
              //   heroList[indexHeroList],
              //   fit: BoxFit.cover,
              // ),
            ),

            Divider(),
            // Text(
            //   heroName,
            //   style: TextStyle(
            //     fontSize: 25,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // Divider(),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  buttonAnswer[0],
                  buttonAnswer[1],
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Container(
                  //       height: double.infinity,
                  //       child: MaterialButton(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //         ),
                  //         onPressed: () {
                  //           checkAnswer(configBrain.isHeroAnswerCorrect(0),
                  //               configBrain.getAnswerNumber());
                  //         },
                  //         color: configBrain.getColorButtonAnswer(0),
                  //         child: Text(
                  //           configBrain.getHeroAnswerText(0),
                  //           style: textoButton,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Container(
                  //       height: double.infinity,
                  //       child: MaterialButton(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //         ),
                  //         onPressed: () {
                  //           checkAnswer(configBrain.isHeroAnswerCorrect(1),
                  //               configBrain.getAnswerNumber());
                  //         },
                  //         color: configBrain.getColorButtonAnswer(1),
                  //         child: Text(
                  //           configBrain.getHeroAnswerText(1),
                  //           style: textoButton,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  buttonAnswer[2],
                  buttonAnswer[3],
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Container(
                  //       height: double.infinity,
                  //       child: MaterialButton(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //         ),
                  //         onPressed: () {
                  //           checkAnswer(configBrain.isHeroAnswerCorrect(2),
                  //               configBrain.getAnswerNumber());
                  //         },
                  //         color: configBrain.getColorButtonAnswer(2),
                  //         child: Text(
                  //           configBrain.getHeroAnswerText(2),
                  //           style: textoButton,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Container(
                  //       height: double.infinity,
                  //       child: MaterialButton(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(10.0),
                  //         ),
                  //         onPressed: () {
                  //           checkAnswer(configBrain.isHeroAnswerCorrect(3),
                  //               configBrain.getAnswerNumber());
                  //         },
                  //         color: configBrain.getColorButtonAnswer(3),
                  //         child: Text(
                  //           configBrain.getHeroAnswerText(3),
                  //           style: textoButton,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: score,
            )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () {
            //         heroName = heroList[indexHeroList].name;
            //         setState(() {});
            //       },
            //       child: Text("Mostrar superheroe"),
            //     ),
            //     ElevatedButton(
            //       onPressed: () {
            //         indexHeroList = Random().nextInt(6);
            //         heroName = "";
            //         setState(() {});
            //       },
            //       child: Text("Siguiente"),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
