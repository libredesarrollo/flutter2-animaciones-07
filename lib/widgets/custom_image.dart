import 'package:flutter/material.dart';

class CustomImage extends StatefulWidget {
  final String urlRoute;

  const CustomImage({required this.urlRoute});

  @override
  _CustomImageState createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _aligmnentAnimation;

  late NetworkImage _image;

  @override
  void initState() {
    _image = NetworkImage(widget.urlRoute);

    _image
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener((_, call) {
      //Se cargo la imagen
      _animationController.forward();
    }));

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 8000));

    _aligmnentAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));

    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (_animationController.status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, child) {
          return FadeInImage(
              fit: BoxFit.cover,
              alignment: Alignment(_aligmnentAnimation.value, 0),
              width: 120,
              height: 200,
              placeholder: AssetImage('assets/images/load.jpg'),
              image: _image);
        },
      ),
    );
  }
}
