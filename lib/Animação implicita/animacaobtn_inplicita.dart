// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AnimatedInpBtn extends StatefulWidget {
  const AnimatedInpBtn({Key? key}) : super(key: key);

  @override
  _AnimatedInpBtnState createState() => _AnimatedInpBtnState();
}

class _AnimatedInpBtnState extends State<AnimatedInpBtn> {
  bool animeted = false;
  final tempo = Duration(seconds: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animação inplicita btn '),
      ),
      body: AnimatedContainer(
        duration: tempo,
        alignment: animeted ? Alignment.bottomRight : Alignment.topCenter,
        child: GestureDetector(
          onTap: () {
            setState(() {
              animeted = !animeted;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: AnimatedContainer(
              duration: tempo,
              height: animeted ? 50 : 50,
              width: animeted ? 50 : 100,
              alignment: animeted ? Alignment.bottomRight : Alignment.topCenter,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: animeted
                      ? BorderRadius.circular(50)
                      : BorderRadius.circular(0)),
            ),
          ),
        ),
      ),
    );
  }
}
