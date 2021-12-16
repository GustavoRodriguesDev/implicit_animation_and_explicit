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
          title: Text('Animação implicita drop'),
        ),
        body: Column(
          children: [
            TESTE(pag: 1),
            TESTE(pag: 2),
            TESTE(pag: 3),
            TESTE(pag: 4),
            TESTE(pag: 5),
            TESTE(pag: 6),
          ],
        ));
  }
}

class TESTE extends StatefulWidget {
  final int pag;
  const TESTE({required this.pag, Key? key}) : super(key: key);

  @override
  _TESTEState createState() => _TESTEState();
}

class _TESTEState extends State<TESTE> {
  bool selecao = false;
  double volta = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
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
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
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
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.white,
              duration: Duration(microseconds: 200),
              child: AnimatedAlign(
                heightFactor: selecao ? 1 : 0,
                duration: Duration(seconds: 1),
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                      'A pessoa deve saber em que direção nasce o sol (leste). A partir daí é possível posicionar o braço direito em direção ao sol, a parte frontal da pessoa corresponde ao norte, automaticamente o sul se encontra atrás da mesma e consequentemente, o oeste se encontra na direção do braço esquerdo, na qual o sol se põe.'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
