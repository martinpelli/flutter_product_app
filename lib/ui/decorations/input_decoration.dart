import 'package:flutter/material.dart';

class CustomInputDecoration {

  static InputDecoration customInputDecoration({String? labelText, String? hintText, IconData? icon}) =>

    InputDecoration(
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
          ),
          labelText: labelText ?? '',
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: icon != null ? Icon(
            icon,
            color: Colors.deepPurple,
          ): null);
  
}