import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/providers/change_color.dart';
import 'package:flutter_application_2/widgets/card_hero.dart';
import 'package:provider/provider.dart';

class SliderHeroes extends StatelessWidget {
  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 0.80);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: marvelHeroes.length,
      onPageChanged: (idCard) {
        Provider.of<ChangeColor>(context, listen: false)
            .setActivColor(marvelHeroes[idCard].color);
      },
      itemBuilder: (context, index) {
        return CardHero(marvelHeroes[index]);
      },
    );
  }
}
