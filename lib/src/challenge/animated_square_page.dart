import 'package:flutter/material.dart';

class AnimatedSquarePage extends StatelessWidget {
  const AnimatedSquarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _AnimatedSquare(),
      ),
    );
  }
}

class _AnimatedSquare extends StatefulWidget {
  @override
  State<_AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<_AnimatedSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> moveRight;
  late Animation<double> moveLeft;
  late Animation<double> moveUp;
  late Animation<double> moveDown;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4500));

    moveRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.25, curve: Curves.bounceOut)));

    moveUp = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.25, 0.5, curve: Curves.bounceOut)));

    moveLeft = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 0.75, curve: Curves.bounceOut)));

    moveDown = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
              moveRight.value + moveLeft.value, moveUp.value + moveDown.value),
          child: child,
        );
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
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
