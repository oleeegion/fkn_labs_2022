import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/change_color.dart';
import 'package:flutter_application_2/widgets/slider_heroes.dart';
import 'constans.dart';
import 'widgets/background_triangle.dart';
import 'package:provider/provider.dart';

void main() {
  Color bgColor = Colors.blue;
  runApp(ChangeNotifierProvider(
      create: (context) => ChangeColor(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 38, 43),
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackgroundTriangle(),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Image.asset(
                    "assets/marvel_logo.png",
                    height: 100,
                    width: 300,
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text("Выбери своего героя", style: standartStyle)),
                  Expanded(child: SliderHeroes())
                ],
              )),
        ],
      ),
    ));
  }
}
