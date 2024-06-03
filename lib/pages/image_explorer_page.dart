import 'package:flutter/material.dart';
import 'package:flutter_images_explorer/config/config_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ImageExplorerPage extends StatefulWidget {
  @override
  State<ImageExplorerPage> createState() => _ImageExplorerPageState();
}

class _ImageExplorerPageState extends State<ImageExplorerPage> {
  ConfigBrain configBrain = ConfigBrain();
  List<Widget> score = [];

  void checkAnswer(bool userAnswer, String numberQuestion) {
    if (configBrain.isFinished() == true) {
      Alert(
          context: context,
          type: AlertType.error,
          title: "QuizApp Heroes",
          desc: "El cuestionario ha llegado a su fin",
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
        print("CORRECTO");
      } else {
        score.add(itemScore(numberQuestion, false));
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: double.infinity, // Alto máximo
                        child: MaterialButton(
                          onPressed: () {
                            checkAnswer(configBrain.isHeroAnswerCorrect1(),
                                configBrain.getAnswerNumber());
                          },
                          color: Color(0xff564788),
                          child: Text(
                            configBrain.getHeroAnswerText1(),
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: double.infinity, // Alto máximo
                        child: MaterialButton(
                          onPressed: () {
                            checkAnswer(configBrain.isHeroAnswerCorrect2(),
                                configBrain.getAnswerNumber());
                          },
                          color: Color(0xff6CCDC3),
                          child: Text(
                            configBrain.getHeroAnswerText2(),
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: double.infinity, // Alto máximo
                        child: MaterialButton(
                          onPressed: () {
                            checkAnswer(configBrain.isHeroAnswerCorrect3(),
                                configBrain.getAnswerNumber());
                          },
                          color: Color(0xffF3C566),
                          child: Text(
                            configBrain.getHeroAnswerText3(),
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: double.infinity, // Alto máximo
                        child: MaterialButton(
                          onPressed: () {
                            checkAnswer(configBrain.isHeroAnswerCorrect4(),
                                configBrain.getAnswerNumber());
                          },
                          color: Color(0xffF06060),
                          child: Text(
                            configBrain.getHeroAnswerText4(),
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
