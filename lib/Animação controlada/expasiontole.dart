// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:math';

import 'package:aula03/Anima%C3%A7%C3%A3o%20controlada/animacaobtn_controlada.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExpansionTileControlada extends StatefulWidget {
  const ExpansionTileControlada({Key? key}) : super(key: key);

  @override
  _ExpansionTileControladaState createState() =>
      _ExpansionTileControladaState();
}

class _ExpansionTileControladaState extends State<ExpansionTileControlada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpasionTile Controlada'),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (_, index) => AnimatedExpansiveControl(pag: index),
      ),
    );
  }
}

class AnimatedExpansiveControl extends StatefulWidget {
  final int pag;
  const AnimatedExpansiveControl({required this.pag}) : super();

  @override
  _AnimatedExpansiveControlState createState() =>
      _AnimatedExpansiveControlState();
}

class _AnimatedExpansiveControlState extends State<AnimatedExpansiveControl>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double?> alignControler;
  late Animation<double> iconAnimation;

  void toggle() {
    if (controller.value == 0) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    alignControler = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller);
    iconAnimation = Tween<double>(
      begin: pi * 2,
      end: pi,
    ).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return GestureDetector(
            onTap: toggle,
            child: Column(
              children: [
                Card(
                  child: Container(
                    height: 50,
                    child: Row(
                      children: [
                        Text('Texto ${widget.pag}'),
                        Transform.rotate(
                          angle: iconAnimation.value,
                          child: Icon(Icons.keyboard_arrow_down_rounded),
                        )
                      ],
                    ),
                  ),
                ),
                ClipRect(
                    child: Container(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: alignControler.value,
                    child: Text(
                        'A pessoa deve saber em que direção nasce o sol (leste). A partir daí é possível posicionar o braço direito em direção ao sol, a parte frontal da pessoa corresponde ao norte, automaticamente o sul se encontra atrás da mesma e consequentemente, o oeste se encontra na direção do braço esquerdo, na qual o sol se põe.'),
                  ),
                ))
              ],
            ),
          );
        });
  }
}
