import 'package:flutter/material.dart';
import 'package:widgets_07/pages/box2_page.dart';
import 'package:widgets_07/pages/box_page.dart';
import 'package:widgets_07/pages/images_page.dart';
import 'package:widgets_07/pages/login_register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App widgets',
      debugShowCheckedModeBanner: false,
      initialRoute: BoxPage.route,
      theme:  ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          primary: Colors.purple,
          secondary: Colors.orange,
        ),
        useMaterial3: true,
      ),
      routes: {
        LoginRegister.route : (_) => LoginRegister(),
        BoxPage.route : (_) => BoxPage(),
        Box2Page.route : (_) => Box2Page(),
        ImagesPage.route : (_) => ImagesPage(),
      },
    );
  }
}
