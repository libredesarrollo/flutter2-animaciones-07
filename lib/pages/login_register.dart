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
  late Animation<double> _opaicityAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _heightAnimation = Tween<Size>(
      begin: Size(double.infinity, 320),
      end: Size(double.infinity, 370),
    ).animate(
        CurvedAnimation(curve: Curves.linear, parent: _animationController));

    _opaicityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
        CurvedAnimation(curve: Curves.linear, parent: _animationController));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App widgets"),
      ),
      body: AnimatedContainer(
        //height: _loginView ? 300 : 350,
        duration: Duration(milliseconds: 300),
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
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  constraints: BoxConstraints(
                      minHeight: _loginView ? 0 : 60,
                      maxHeight: _loginView ? 0 : 120),
                  child: FadeTransition(
                    opacity: _opaicityAnimation,
                    //visible: !_loginView,
                    child: CustomTextField(
                      icon: Icons.lock,
                      placeholder: "Repetir contraseña",
                      obscureText: true,
                    ),
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

                        if (_loginView) {
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
