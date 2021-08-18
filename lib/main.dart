import 'package:flutter/material.dart';
import 'package:widgets_07/pages/box2_page.dart';
import 'package:widgets_07/pages/box_page.dart';
import 'package:widgets_07/pages/images_page.dart';
import 'package:widgets_07/pages/login_register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App widgets',
      debugShowCheckedModeBanner: false,
      initialRoute: BoxPage.ROUTE,
      theme:  ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.orange
      ),
      routes: {
        LoginRegister.ROUTE : (_) => LoginRegister(),
        BoxPage.ROUTE : (_) => BoxPage(),
        Box2Page.ROUTE : (_) => Box2Page(),
        ImagesPage.ROUTE : (_) => ImagesPage(),
      },
    );
  }
}
