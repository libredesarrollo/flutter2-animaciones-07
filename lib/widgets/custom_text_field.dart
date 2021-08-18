import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final IconData icon;
  final Color? primaryColor;
  final Color? accentColor;
  final bool obscureText;

  const CustomTextField(
      { required this.placeholder, 
      required this.icon, 
      this.primaryColor, 
      this.accentColor,
      this.obscureText = false,
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: this.obscureText,
      decoration: InputDecoration(
          prefixIcon: Icon(this.icon),
          hintText: this.placeholder,
          contentPadding: EdgeInsets.only(top: 14),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: this.primaryColor ?? Theme.of(context).primaryColor , width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: this.accentColor ?? Theme.of(context).accentColor, width: 1.0))),
    );
  }
}
