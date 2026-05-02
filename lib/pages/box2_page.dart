import 'dart:math' as math;

import 'package:flutter/material.dart';

class Box2Page extends StatefulWidget {
  static const String route = "/box2";

  const Box2Page({super.key});

  @override
  State<Box2Page> createState() => _Box2PageState();
}

class _Box2PageState extends State<Box2Page> {
  double _width = 50, _height = 50;
  Color _color = Colors.purple;
  final BorderRadius _borderRadius = BorderRadius.circular(8);

  Offset _offset = Offset(1.5, 2.0);

  @override
  Widget build(BuildContext context) {
    final random = math.Random();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.update),
        onPressed: () {
          _width = random.nextInt(200).toDouble();
          _height = random.nextInt(200).toDouble();

          _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
              random.nextInt(256), random.nextDouble());

          _offset = Offset(
            random.nextInt(15).toDouble(),
            random.nextInt(15).toDouble(),
          );

          setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
              boxShadow: [
                BoxShadow(
                    offset: _offset, color: Colors.black38, blurRadius: random.nextInt(50).toDouble())
              ]),
          width: _width,
          height: _height,
          child: Text("$_width x $_height"),
        ),
      ),
    );
  }
}
