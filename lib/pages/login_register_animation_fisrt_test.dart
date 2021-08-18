import 'package:flutter/material.dart';
import 'package:widgets_07/widgets/custom_text_field.dart';

class LoginRegister extends StatefulWidget {
  static const String ROUTE = "/login_register";

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister>
    with SingleTickerProviderStateMixin {
  bool _loginView = false;

  late AnimationController _animationController;
  late Animation<Size> _heightAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _heightAnimation = Tween<Size>(
      begin: Size(double.infinity, 350),
      end: Size(double.infinity, 400),
    ).animate(
        CurvedAnimation(curve: Curves.linear, parent: _animationController));

        _animationController.addListener(() {
          setState(() {
            print(_animationController.status);
            print(_animationController.value);
          });
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App widgets"),
      ),
      body: Container(
        //height: _loginView ? 300 : 350,
        height: _heightAnimation.value.height,
        margin: EdgeInsets.all(8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                  icon: Icons.person,
                  placeholder: "Usuario",
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  icon: Icons.lock,
                  placeholder: "Contraseña",
                  obscureText: true,
                ),
                SizedBox(
                  height: 15,
                ),
                Visibility(
                  visible: !_loginView,
                  child: CustomTextField(
                    icon: Icons.lock,
                    placeholder: "Repetir contraseña",
                    obscureText: true,
                  ),
                ),
                RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      _loginView ? "Login" : "Registrarse",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {}),
                Spacer(),
                SwitchListTile(
                    title: Text(
                      _loginView ? "Login" : "Registrarse",
                    ),
                    value: _loginView,
                    onChanged: (value) {
                      setState(() {
                        _loginView = value;

                        if (!_loginView) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
