import 'package:flutter/material.dart';
import 'package:widgets_07/widgets/custom_image.dart';

class ImagesPage extends StatelessWidget {
  static const String ROUTE = "/images";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imágenes"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            CustomImage(urlRoute: "https://images.freeimages.com/images/large-previews/afa/black-jaguar-1402097.jpg"),
            SizedBox(width: 8,),
            CustomImage(urlRoute: "https://media.istockphoto.com/photos/black-panther-picture-id460421761"),
            SizedBox(width: 8,),
            CustomImage(urlRoute: "https://media.istockphoto.com/photos/closeup-of-black-jaguar-resting-on-a-tree-branch-picture-id89098241")
          ],
        ),
      ),
    );
  }
}
