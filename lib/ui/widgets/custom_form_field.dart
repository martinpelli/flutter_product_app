import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final bool isSecret;
  final String? Function(String?)? validate;
  final Function(String)? onChange;

  const CustomFormField({
    Key? key,
    required this.icon,
    required this.labelText,
    this.isSecret = false,
    required this.validate,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      validator: validate,
      autocorrect: false,
      obscureText: isSecret,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            icon,
            color: Colors.deepPurple,
          )),
    );
  }
}
