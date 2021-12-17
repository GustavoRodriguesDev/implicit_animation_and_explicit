// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class ExpasionTileImplicita extends StatefulWidget {
  const ExpasionTileImplicita({Key? key}) : super(key: key);

  @override
  _ExpasionTileImplicitaState createState() => _ExpasionTileImplicitaState();
}

class _ExpasionTileImplicitaState extends State<ExpasionTileImplicita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ExpasionTile Implicita'),
        ),
        body: Column(
          children: [
            AnimatedExpansiveInplic(pag: 1),
            AnimatedExpansiveInplic(pag: 2),
            AnimatedExpansiveInplic(pag: 3),
            AnimatedExpansiveInplic(pag: 4),
            AnimatedExpansiveInplic(pag: 5),
            AnimatedExpansiveInplic(pag: 6),
          ],
        ));
  }
}

class AnimatedExpansiveInplic extends StatefulWidget {
  final int pag;
  const AnimatedExpansiveInplic({required this.pag, Key? key})
      : super(key: key);

  @override
  _AnimatedExpansiveInplicState createState() =>
      _AnimatedExpansiveInplicState();
}

class _AnimatedExpansiveInplicState extends State<AnimatedExpansiveInplic> {
  bool selecao = false;
  double volta = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selecao = !selecao;
              volta += (1 / 2);
            });
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Texto ${widget.pag}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    AnimatedRotation(
                      turns: volta,
                      duration: Duration(microseconds: 200),
                      child: Icon(Icons.arrow_drop_down_circle_rounded),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedContainer(
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          duration: Duration(microseconds: 200),
          child: AnimatedAlign(
            heightFactor: selecao ? 1 : 0,
            duration: Duration(seconds: 1),
            alignment: Alignment.topCenter,
            child: Text(
                'A pessoa deve saber em que direção nasce o sol (leste). A partir daí é possível posicionar o braço direito em direção ao sol, a parte frontal da pessoa corresponde ao norte, automaticamente o sul se encontra atrás da mesma e consequentemente, o oeste se encontra na direção do braço esquerdo, na qual o sol se põe.'),
          ),
        )
      ],
    );
  }
}
