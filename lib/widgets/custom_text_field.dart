import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final IconData icon;
  final Color? primaryColor;
  final Color? accentColor;
  final bool obscureText;

  const CustomTextField(
      {super.key,  required this.placeholder, 
      required this.icon, 
      this.primaryColor, 
      this.accentColor,
      this.obscureText = false,
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: placeholder,
          contentPadding: EdgeInsets.only(top: 14),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: primaryColor ?? Theme.of(context).colorScheme.primary , width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: accentColor ?? Theme.of(context).colorScheme.secondary, width: 1.0))),
    );
  }
}
