import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SquareAnimation(),
      ),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({
    Key? key,
  }) : super(key: key);

  @override
  State<SquareAnimation> createState() => _SquareAnimationState();
}

class _SquareAnimationState extends State<SquareAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> rotation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));

    animationController.addListener(() {
      print('Status: ${animationController.status}');
      if (animationController.status == AnimationStatus.completed) {
        animationController.reset();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Play / Reproduction
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      //child: _Rectangulo(),
      builder: (context, child) {
        return Transform.rotate(angle: rotation.value, child: _Rectangulo());
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
