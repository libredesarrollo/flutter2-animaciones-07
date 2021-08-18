import 'dart:math' as Math;

import 'package:flutter/material.dart';

class BoxPage extends StatefulWidget {
  static const String ROUTE = "/box";

  @override
  _BoxPageState createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation, _rotationAnimation, _opacityAnimation;

  late Animation<Offset> _translateAnimate;

  late Animatable<Color> backgroundAnimate;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _sizeAnimation = Tween<double>(begin: 1.0, end: 6.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, .25, curve: Curves.linear)));

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.25, .5, curve: Curves.linear)));

    _rotationAnimation = Tween<double>(begin: 0.0, end: 2.0 * Math.pi).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.3, .75, curve: Curves.linear)));

    _translateAnimate =
        Tween<Offset>(begin: Offset.zero, end: Offset(20.0, 200.0)).animate(
            CurvedAnimation(
                parent: _animationController,
                curve: Interval(0.75, 1.0, curve: Curves.linear)));

    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (_animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    //_animationController.repeat();

    //**************COLORES */

    backgroundAnimate = TweenSequence<Color>([
      TweenSequenceItem(
          weight: 2.0,
          tween: Tween(begin: Colors.red, end: Colors.green)), //ColorTween
      TweenSequenceItem(
          weight: 1.0, tween: Tween(begin: Colors.green, end: Colors.blue)),
      TweenSequenceItem(
          weight: 1.0, tween: Tween(begin: Colors.blue, end: Colors.purple))
    ]);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();

    return Scaffold(
      appBar: AppBar(
        title: Text("Cuadrado animado"),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        child: Center(
          child: Container(
            width: 60,
            height: 60,
            color: Colors.blue,
            //color: backgroundAnimate.evaluate(_animationController)
          ),
        ),
        builder: (_, Widget? widget) {
          // todo lo que tenga que ver con la animacion
          return Opacity(
            opacity: _opacityAnimation.value,
            child: Transform.translate(
              offset: _translateAnimate.value,
              child: Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Transform.scale(
                    scale: _sizeAnimation.value,
                    child: Container(
                        width: 60,
                        height: 60,
                        //color: Colors.blue,
                        color:
                            backgroundAnimate.evaluate(_animationController)),
                  )),
            ),
          );
        },
      ),
    );
  }
}
