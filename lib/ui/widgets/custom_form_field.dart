import 'package:flutter/material.dart';
import 'package:flutter_products_app/ui/decorations/input_decoration.dart';

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
      decoration: CustomInputDecoration.customInputDecoration(labelText: labelText, icon: icon)
    );
  }
}
