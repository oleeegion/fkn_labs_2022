import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/models/heroes.dart';
import 'package:flutter_application_2/network/marvel_api.dart';
import 'package:flutter_application_2/providers/change_color.dart';
import 'package:flutter_application_2/widgets/card_hero.dart';
import 'package:provider/provider.dart';

class SliderHeroes extends StatelessWidget {
  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 0.80);

  List<int> marvelIdHeroes;
  List<Future<Heroes>> marvelHeroes = [];
  SliderHeroes(this.marvelIdHeroes, {super.key}) {
    for (int i = 0; i < marvelIdHeroes.length; i++) {
      marvelHeroes.add(MarvelApi().getInfoHeroes(marvelIdHeroes[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: marvelIdHeroes.length,
      onPageChanged: (idCard) {
        marvelHeroes[idCard].then((hero) =>
            Provider.of<ChangeColor>(context, listen: false)
                .setActivColor(hero.color));
      },
      itemBuilder: (context, index) {
        return FutureBuilder<Heroes>(
            future: marvelHeroes[index],
            builder: ((context, hero) {
              if (hero.hasData) {
                return CardHero(hero.data!);
              } else if (hero.hasError) {
                return Center(
                  child: Text(hero.error.toString(), style: subtitleStyle),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
      },
    );
  }
}
