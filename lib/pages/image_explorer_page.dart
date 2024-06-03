import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_images_explorer/config/config_brain.dart';

class ImageExplorerPage extends StatefulWidget {
  @override
  State<ImageExplorerPage> createState() => _ImageExplorerPageState();
}

class _ImageExplorerPageState extends State<ImageExplorerPage> {
  ConfigBrain configBrain = ConfigBrain();
  List<Widget> score = [];

  void checkAnwer(bool userAnswer, String numberQuestion) {
    if (true == userAnswer) {
      score.add(itemScore(numberQuestion, true));
      print("Si es correcto");
    } else {
      score.add(itemScore(numberQuestion, false));
      print("INCORRECTO");
    }
    configBrain.nextQuestion();
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
        title: Text("¿Como se llama el superheroe?"),
        centerTitle: true,
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
                            checkAnwer(configBrain.isHeroAnswerCorrect1(),
                                configBrain.getAnswerNumber());
                          },
                          color: Colors.redAccent,
                          child: Text(
                            configBrain.getHeroAnswerText1(),
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
                            checkAnwer(configBrain.isHeroAnswerCorrect2(),
                                configBrain.getAnswerNumber());
                          },
                          color: Colors.blueAccent,
                          child: Text(configBrain.getHeroAnswerText2()),
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
                            checkAnwer(configBrain.isHeroAnswerCorrect3(),
                                configBrain.getAnswerNumber());
                          },
                          color: Colors.greenAccent,
                          child: Text(configBrain.getHeroAnswerText3()),
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
                            checkAnwer(configBrain.isHeroAnswerCorrect4(),
                                configBrain.getAnswerNumber());
                          },
                          color: Colors.orangeAccent,
                          child: Text(configBrain.getHeroAnswerText4()),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
