import 'dart:math';

import 'package:flutter/material.dart';
import '/models/hero_model.dart';

class ImageExplorerPage extends StatefulWidget {
  @override
  State<ImageExplorerPage> createState() => _ImageExplorerPageState();
}

class _ImageExplorerPageState extends State<ImageExplorerPage> {
  int indexHeroList = Random().nextInt(6);
  List<HeroModel> heroList = [
    HeroModel(
      name: "Capitán América",
      imageUrl: "assets/image/capitan.png",
    ),
    HeroModel(
      name: "Iron Man",
      imageUrl: "assets/image/ironman.png",
    ),
    HeroModel(
      name: "Hulk",
      imageUrl: "assets/image/hulk.png",
    ),
    HeroModel(
      name: "Spiderman",
      imageUrl: "assets/image/spiderman.png",
    ),
    HeroModel(
      name: "Mujer maravilla",
      imageUrl: "assets/image/mujer_maravilla.png",
    ),
    HeroModel(
      name: "Antman",
      imageUrl: "assets/image/antman.png",
    ),
    HeroModel(
      name: "Pantera Negra",
      imageUrl: "assets/image/pantera.png",
    )
  ];
  String heroName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Explorer"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(heroList[indexHeroList].imageUrl),
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
            Text(
              heroName,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    heroName = heroList[indexHeroList].name;
                    setState(() {});
                  },
                  child: Text("Mostrar superheroe"),
                ),
                ElevatedButton(
                  onPressed: () {
                    indexHeroList = Random().nextInt(6);
                    heroName = "";
                    setState(() {});
                  },
                  child: Text("Siguiente"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
