// ignore_for_file: prefer_const_constructors, annotate_overrides, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

class AnimatedControlBtn extends StatefulWidget {
  const AnimatedControlBtn({Key? key}) : super(key: key);

  @override
  _AnimatedControlBtnState createState() => _AnimatedControlBtnState();
}

class _AnimatedControlBtnState extends State<AnimatedControlBtn>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Size?> sizeAnimation;
  late Animation<Color?> colorAnimaiton;
  late Animation<Alignment?> alignmentAnimation;
  late Animation<BorderRadius?> radiusAnimated;

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
      duration: Duration(seconds: 1),
    );

    sizeAnimation = SizeTween(
      begin: Size(50, 50),
      end: Size(100, 50),
    ).animate(controller);

    colorAnimaiton = ColorTween(
      begin: Colors.yellowAccent,
      end: Colors.blue,
    ).animate(controller);

    alignmentAnimation = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.topCenter,
    ).animate(controller);
    radiusAnimated =
        BorderRadiusTween(begin: BorderRadius.circular(50), end: null)
            .animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Button Controlada')),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
                alignment: alignmentAnimation.value,
                child: GestureDetector(
                  onTap: toggle,
                  child: Container(
                    width: sizeAnimation.value?.width,
                    height: sizeAnimation.value?.height,
                    decoration: BoxDecoration(
                      borderRadius: radiusAnimated.value,
                      color: colorAnimaiton.value,
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
